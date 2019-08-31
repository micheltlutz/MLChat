//
//  MLChatMessage.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

public enum MLChatMessageType: String {
    case user
    case bot
}

public struct MLChatMessage {
    public let name: String
    public let text: String
    public let date: Date
    public let type: MLChatMessageType

    public init(name: String, text: String, date: Date, type: MLChatMessageType) {
        self.name = name
        self.text = text
        self.date = date
        self.type = type
    }
}

extension MLChatMessage {
    func firstLetterName() -> String {
        if let char = name.character(at: 1) {
            return String(char)
        }
        return ""
    }
}
