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
    private var messageTextField: UITextField = {
        let messageTextField = UITextField()
        messageTextField.translatesAutoresizingMaskIntoConstraints = false
        return messageTextField
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
        if chatConfigurations.isMultiline {
            shouldSendMessage?(messageTextView.text)
            messageTextView.text = ""
        } else {
            guard let text = messageTextField.text else { return }
            shouldSendMessage?(text)
            messageTextField.text = ""
        }
    }

    public func setPlaceHolder(with text: String) {
        messageTextField.placeholder = text
    }

    public func changeKeyboardType(with type: UIKeyboardType) {
        messageTextField.keyboardType = type
    }

    public func changeFieldColor(with color: UIColor) {
        if chatConfigurations.isMultiline {
            messageTextView.backgroundColor = color
        } else {
            messageTextField.backgroundColor = color
        }
    }

    public func setImageSendButton(with image: UIImage, tapped: UIImage?) {
        sendButton.setTitle(nil, for: .normal)
        sendButton.setImage(image, for: .normal)
        if let tapped = tapped {
            sendButton.setTitle(nil, for: .highlighted)
            sendButton.setImage(tapped, for: .highlighted)
        }
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
            if chatConfigurations.isMultiline {
                messageTextView.font = messageFont
            }
        }
        if let actionFont = chatConfigurations.actionFont {
            sendButton.titleLabel?.font = actionFont
        }
    }
    public func setupConstraints() {
        setUpFonts()
        if chatConfigurations.isMultiline {
            NSLayoutConstraint.activate([
                messageTextView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                messageTextView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                messageTextView.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
                messageTextView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        } else {
            NSLayoutConstraint.activate([
                heightAnchor.constraint(equalToConstant: 64),
                messageTextField.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                messageTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                messageTextField.trailingAnchor.constraint(equalTo: sendButton.leadingAnchor, constant: -10),
                messageTextField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
            ])
        }
        NSLayoutConstraint.activate([
            sendButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            sendButton.widthAnchor.constraint(equalToConstant: 50),
            sendButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10)
        ])
    }

    public func buildViewHierarchy() {
        if chatConfigurations.isMultiline {
            addSubview(messageTextView)
        } else {
            addSubview(messageTextField)
        }
        addSubview(sendButton)
    }

    public func configureViews() {
        backgroundColor = .white
        translatesAutoresizingMaskIntoConstraints = false
    }
}
