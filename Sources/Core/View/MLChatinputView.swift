//
//  MLChatinputView.swift
//  MLChatDemo
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public final class MLChatInputView: UIView {
    private lazy var messageTextView: UITextView = {
        let messageTextView = UITextView()
        messageTextView.translatesAutoresizingMaskIntoConstraints = false
        messageTextView.sizeToFit()
        messageTextView.isScrollEnabled = false
        messageTextView.textContainer.maximumNumberOfLines = chatConfigurations.maximumNumberOfLines
        return messageTextView
    }()
    private lazy var sendButton: UIButton = {
        let sendButton = UIButton()
        sendButton.setTitle(chatConfigurations.actionText, for: .normal)
        sendButton.setTitleColor(UIColor(hex: chatConfigurations.actionColor), for: .normal)
        sendButton.setTitleColor(.groupTableViewBackground, for: .highlighted)
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        sendButton.addTarget(self, action: #selector(sendButtonTapped), for: .touchUpInside)
        return sendButton
    }()
    private var chatConfigurations: MLChatConfigurations!
    public var shouldSendMessage: ((_ message: String) -> Void)?

    public init(configuration: MLChatConfigurations) {
        super.init(frame: .zero)

        chatConfigurations = configuration
        setupViewConfiguration()
    }

    @objc func sendButtonTapped() {
        shouldSendMessage?(messageTextView.text)
        messageTextView.text = ""
    }

    @available(*, unavailable)
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewConfiguration
extension MLChatInputView: ViewConfiguration {
    private func setUpFonts() {
        if let messageFont = chatConfigurations.textViewFont {
            messageTextView.font = messageFont
        }
        if let actionFont = chatConfigurations.actionFont {
            sendButton.titleLabel?.font = actionFont
        }
    }
    public func setupConstraints() {
        setUpFonts()
        NSLayoutConstraint.activate([
            messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            messageTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            messageTextView.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
            messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            sendButton.widthAnchor.constraint(equalToConstant: 50),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
    }

    public func buildViewHierarchy() {
        addSubview(messageTextView)
        addSubview(sendButton)
    }

    public func configureViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}
