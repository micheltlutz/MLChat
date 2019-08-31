//
//  Configurations.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

public struct MLChatConfigurations {
    ///Flag for simulate bot typing text
    public let useBotTyping: Bool
    ///Define color for button action
    public let actionColor: String
    ///Define background color for bubble
    public let bubbleBackgroundColor: String
    ///Define text color for message text
    public let messageColor: String
    ///Define text color for message text is incoming
    public let messageColorIncoming: String
    ///Define text color for message time
    public let timerMessageColor: String
    ///Define background color for bubble when message is incoming
    public let bubbleBagroundColorIncoming: String
    ///Define background color for chat
    public let backgroundColor: String
    ///Define text for send button
    public let actionText: String
    ///Define color for top line in TextView
    public let borderColorInputView: String
    ///Limit for height TextView
    public let maximumNumberOfLines: Int
    ///Custom image for activity indicator, when using this property the component UIRefreshControl shift de default activity indicator
    public let customImageLoading: String?
    ///Define hello message for new chat or chatMessages[]
    public let helloMessage: String?
    ///Define font color for helloMessage
    public let helloMessageColor: String?
    ///Define font for username
    public let nameFont: UIFont?
    ///Define font for Message
    public let messageFont: UIFont?
    ///Define font for Time message
    public let timeFont: UIFont?
    ///Define font for button action
    public let actionFont: UIFont?
    ///Define font for UITextView font
    public let textViewFont: UIFont?
    ///Define font for Hello Message font
    public let helloMessageFont: UIFont?

    public init(useBotTyping: Bool,
                actionColor: String,
                bubbleBackgroundColor: String,
                messageColor: String,
                messageColorIncoming: String,
                timerMessageColor: String,
                bubbleBagroundColorIncoming: String,
                backgroundColor: String,
                actionText: String,
                borderInputView: String,
                maximumNumberOfLines: Int,
                customImageLoading: String?,
                helloMessage: String?,
                helloMessageColor: String?,
                nameFont: UIFont?,
                messageFont: UIFont?,
                timeFont: UIFont?,
                actionFont: UIFont?,
                textViewFont: UIFont?,
                helloMessageFont: UIFont?) {
        self.useBotTyping = useBotTyping
        self.actionColor = actionColor
        self.bubbleBackgroundColor = bubbleBackgroundColor
        self.messageColor = messageColor
        self.messageColorIncoming = messageColorIncoming
        self.timerMessageColor = timerMessageColor
        self.bubbleBagroundColorIncoming = bubbleBagroundColorIncoming
        self.backgroundColor = backgroundColor
        self.actionText = actionText
        self.borderColorInputView = borderInputView
        self.maximumNumberOfLines = maximumNumberOfLines
        self.customImageLoading = customImageLoading
        self.helloMessage = helloMessage
        self.helloMessageColor = helloMessageColor
        self.nameFont = nameFont
        self.messageFont = messageFont
        self.timeFont = timeFont
        self.actionFont = actionFont
        self.textViewFont = textViewFont
        self.helloMessageFont = helloMessageFont
    }
}
