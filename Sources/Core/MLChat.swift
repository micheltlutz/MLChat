//
//  MLChat.swift
//  MLChat
//
//  Created by Michel Anderson Lutz Teixeira on 01/04/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit
import IQKeyboardManagerSwift

public class MLChat: UITableView {
    public static let name = "MLChat"
    private var refreshControlCustom: RefreshControl!
    private let heightHeaderSection: CGFloat = 60
    private var chatConfigurations: MLChatConfigurations = {
        let chatDefaultConfigurations = MLChatConfigurations(isMultiline: false,
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
    public var messages = [MLChatMessage]() {
        didSet {
            let offset = CGPoint(x: 0, y: contentSize.height - frame.size.height)
            setContentOffset(offset, animated: false)
        }
    }

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
        refreshControlCustom.addTarget(self, action: #selector(refreshData(_:)), for: .valueChanged)
        configureIQKeyboardManager()
    }

    private func registerCells() {
        register(MLChatMessageUserCell.self, forCellReuseIdentifier: MLChatMessageUserCell.cellId)
        register(MLChatMessageBotCell.self, forCellReuseIdentifier: MLChatMessageBotCell.cellId)
    }

    private func configureIQKeyboardManager() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 16.0
        IQKeyboardManager.shared.enableAutoToolbar = false
        IQKeyboardManager.shared.shouldResignOnTouchOutside = true
    }

    @objc private func refreshData(_ sender: Any) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
            self.refreshControlCustom.endRefreshing()
        }
    }

    public func addMessage(_ message: MLChatMessage) {
        messages.append(message)
        beginUpdates()
        insertRows(at: [IndexPath(row: messages.count-1, section: 0)], with: .automatic)
        endUpdates()
        scrollToBottom()
    }

    func scrollToBottom() {
        if messages.count > 0 {
            let indexPath = IndexPath(row: messages.count - 1, section: 0)
            scrollToRow(at: indexPath, at: .bottom, animated: false)
        }
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Delegate
extension MLChat: UITableViewDelegate { }

// MARK: - DataSource
extension MLChat: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }

    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
