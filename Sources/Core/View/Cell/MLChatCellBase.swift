//
//  MLChatCellBase.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

class MLChatCellBase: UITableViewCell {
    var message: MLChatMessage! {
        didSet {
            setMessage()
        }
    }
    let messageName: UILabel = {
        let messageName = UILabel()
        messageName.translatesAutoresizingMaskIntoConstraints = false
        messageName.numberOfLines = 0
        messageName.font = UIFont.boldSystemFont(ofSize: 14)
        return messageName
    }()
    let messageLabel: UILabel = {
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        return messageLabel
    }()
    let bubbleBackgroundView: UIView = {
        let bubbleBackgroundView = UIView()
        bubbleBackgroundView.layer.cornerRadius = 12
        bubbleBackgroundView.translatesAutoresizingMaskIntoConstraints = false
        return bubbleBackgroundView
    }()

    func setMessage() {
        messageName.text = message.name
        messageLabel.text = message.text
    }
}
