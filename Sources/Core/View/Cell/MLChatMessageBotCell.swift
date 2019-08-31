//
//  MLChatMessageBotCell.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

final class MLChatMessageBotCell: MLChatCellBase, MLChatCellProtocol {
    static var cellId = UUID().uuidString.lowercased()
    private var chatConfigurations: MLChatConfigurations!

    func configure(with configuration: MLChatConfigurations) {
        chatConfigurations = configuration
        setupViewConfiguration()
    }
}

// MARK: - ViewConfiguration
extension MLChatMessageBotCell: ViewConfiguration {
    private func setUpFonts() {
        if let nameFont = chatConfigurations.nameFont {
            messageName.font = nameFont
        }
        if let messageFont = chatConfigurations.messageFont {
            messageLabel.font = messageFont
        }
    }

    public func setupConstraints() {
        setUpFonts()
        NSLayoutConstraint.activate([
            bubbleBackgroundView.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            bubbleBackgroundView.widthAnchor.constraint(lessThanOrEqualToConstant: 260),
            bubbleBackgroundView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            bubbleBackgroundView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),

            messageName.topAnchor.constraint(equalTo: bubbleBackgroundView.topAnchor, constant: 10),
            messageName.heightAnchor.constraint(equalToConstant: 20),
            messageName.leadingAnchor.constraint(equalTo: bubbleBackgroundView.leadingAnchor, constant: 16),
            messageName.trailingAnchor.constraint(equalTo: bubbleBackgroundView.trailingAnchor, constant: -16),

            messageLabel.topAnchor.constraint(equalTo: messageName.bottomAnchor, constant: 4),
            messageLabel.leadingAnchor.constraint(equalTo: messageName.leadingAnchor),
            messageLabel.trailingAnchor.constraint(equalTo: messageName.trailingAnchor)
            ])
    }

    public func buildViewHierarchy() {
        addSubview(bubbleBackgroundView)
        bubbleBackgroundView.addSubview(messageName)
        bubbleBackgroundView.addSubview(messageLabel)
    }

    public func configureViews() {
        backgroundColor = .clear
    }
}
