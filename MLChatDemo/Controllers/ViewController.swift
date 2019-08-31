//
//  ViewController.swift
//  MLChatDemo
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit
import MLChat

class ViewController: UIViewController {
    private var chatBottomConstraint: NSLayoutConstraint!
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
                                                           helloMessage: "Hello buddy! Can I help you?",
                                                           helloMessageColor: "FF4B69",
                                                           nameFont: nil,
                                                           messageFont: nil,
                                                           timeFont: nil,
                                                           actionFont: nil,
                                                           textViewFont: nil,
                                                           helloMessageFont: nil)
        return chatDefaultConfigurations
    }()
    private var chatInputView: MLChatInputView!
    private var chat: MLChat!
    private let viewModel = ChatViewModel()

    // MARK: - Life Cicle
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "CHAT"
        chatInputView = MLChatInputView(configuration: chatConfigurations)

        chat = MLChat(configurarion: chatConfigurations)
        chatInputView.shouldSendMessage = { [weak self] message in
            guard let self = self else { return }
            self.chat.addMessage(MLChatMessage(name: "User", text: message, date: Date(), type: .user))
        }
        setupViewConfiguration()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        chat.messages = viewModel.chatMessages
        chat.reloadData()
    }

    private func setupViewConfiguration() {
        view.backgroundColor = .white
        view.addSubview(chat)
        view.addSubview(chatInputView)
        chatBottomConstraint = chat.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        NSLayoutConstraint.activate([
            chat.topAnchor.constraint(equalTo: view.topAnchor),
            chat.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chat.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            chatBottomConstraint,
            chatInputView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            chatInputView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            chatInputView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
}
