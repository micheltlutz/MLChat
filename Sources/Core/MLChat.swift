//
//  MLChat.swift
//  MLChat
//
//  Created by Michel Anderson Lutz Teixeira on 01/04/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

class MLChat: UITableView {
    static let name = "MLChat"
    private var refreshControlCustom: RefreshControl!
    private let heightHeaderSection: CGFloat = 60
    private var chatConfigurations: MLChatConfigurations = {
        let chatDefaultConfigurations = MLChatConfigurations(useBotTyping: false,
                                                           actionColor: "FF4B69",
                                                           bubbleBackgroundColor: "D3D3D3",
                                                           messageColor: "000000",
                                                           messageColorIncoming: "FFFFFF",
                                                           timerMessageColor: "B3B3B2",
                                                           bubbleBagroundColorIncoming: "000000",
                                                           backgroundColor: "FFFFFF",
                                                           actionText: "Enviar",
                                                           borderInputView: "9D9D9D",
                                                           maximumNumberOfLines: 6,
                                                           customImageLoading: nil,
                                                           helloMessage: nil,
                                                           helloMessageColor: nil,
                                                           nameFont: UIFont.boldSystemFont(ofSize: 14),
                                                           messageFont: UIFont.systemFont(ofSize: 17),
                                                           timeFont: UIFont.systemFont(ofSize: 12),
                                                           actionFont: UIFont.boldSystemFont(ofSize: 17),
                                                           textViewFont: UIFont.systemFont(ofSize: 16),
                                                           helloMessageFont: UIFont.boldSystemFont(ofSize: 25)
        )
        return chatDefaultConfigurations
    }()
    var messages: [MLChatMessage] = []

    // MARK: - Initialization
    public init(configurarion: MLChatConfigurations?) {
        super.init(frame: .zero, style: .grouped)

        if let configurarion = configurarion {
            chatConfigurations = configurarion
        }
        setUp()
    }

    private func setUp() {
        registerCells()
        separatorStyle = .none
        backgroundColor = UIColor(hex: chatConfigurations.backgroundColor)
        allowsSelection = false
        translatesAutoresizingMaskIntoConstraints = false
        dataSource = self
        delegate = self
        refreshControlCustom = RefreshControl(configuration: chatConfigurations)
        refreshControl = refreshControlCustom
//        refreshControlCustom.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)

//        configureIQKeyboardManager()
    }

    private func registerCells() {
        register(MLChatMessageUserCell.self, forCellReuseIdentifier: MLChatMessageUserCell.cellId)
        register(MLChatMessageBotCell.self, forCellReuseIdentifier: MLChatMessageBotCell.cellId)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Delegate
extension MLChat: UITableViewDelegate {
//    public func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        if let firstMessageInSection = chatMessages[section].first {
//            return DateHeaderView(with: firstMessageInSection.date)
//        }
//        return nil
//    }
}

// MARK: - DataSource
extension MLChat: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch messages[indexPath.row].type {
        case .user:
            return makeUserCell(for: indexPath)
        case .bot:
            return makeBotCell(for: indexPath)
        }
    }

    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return heightHeaderSection
    }
}

// MARK: - Make custom cells
extension MLChat {
    private func makeUserCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: MLChatMessageUserCell.cellId,
                                        for: indexPath) as? MLChatMessageUserCell else { return UITableViewCell() }
        cell.message = messages[indexPath.row]
        cell.configure(with: chatConfigurations)
        return cell
    }

    private func makeBotCell(for indexPath: IndexPath) -> UITableViewCell {
        guard let cell = dequeueReusableCell(withIdentifier: MLChatMessageBotCell.cellId,
                                             for: indexPath) as? MLChatMessageBotCell else { return UITableViewCell() }
        cell.message = messages[indexPath.row]
        cell.configure(with: chatConfigurations)
        return cell
    }
}
