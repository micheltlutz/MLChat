//
//  ChatViewModel.swift
//  MLChatDemo
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import MLChat

protocol ChatViewModelProtocol: AnyObject {
    func sendMessage(message: String)
    func isChatOutOfHour() -> Bool
}

final class ChatViewModel: ChatViewModelProtocol {
    var grouppedChatMessages = [[MLChatMessage]]()
    var chatMessages = [MLChatMessage]()

    init() {
        loadMockImages()
        attemptToAssembleGroupedMessages()
    }

    func sendMessage(message: String) {
        print("WIP message: \(message)")
    }

    func isChatOutOfHour() -> Bool {
        return false
    }
}

// MARK: - Extension Mock
extension ChatViewModel {
    fileprivate func mockMessages() -> [MLChatMessage] {
        return [
            MLChatMessage(name: "User",
                        text: "Here's my very first message",
                        date: Date.dateFromCustomString(customString: "03/08/2018"), type: .user),
            MLChatMessage(name: "User",
                        text: "I'm going to message another long message that will word wrap",
                        date: Date.dateFromCustomString(customString: "03/08/2018"), type: .user),
            MLChatMessage(name: "Bot",
                        text: """
                            I'm going to message another long message that will word wrap,
                            I'm going to message another long message that will word wrap,
                            I'm going to message another long message that will word wrap
                            """,
                        date: Date.dateFromCustomString(customString: "15/09/2018"), type: .bot),
            MLChatMessage(name: "Bot",
                        text: "Yo, dawg, Whaddup!",
                        date: Date(), type: .bot),
            MLChatMessage(name: "User",
                        text: "This message should appear on the left with a white background bubble",
                        date: Date.dateFromCustomString(customString: "15/09/2018"), type: .user),
            MLChatMessage(name: "User", text: "Third Section message",
                          date: Date.dateFromCustomString(customString: "31/10/2018"), type: .user)
        ]
    }

    fileprivate func loadMockImages() {
        chatMessages = mockMessages()
    }

    fileprivate func attemptToAssembleGroupedMessages() {
        print("Attempt to group our messages together based on Date property")
        let messagesFromServer = mockMessages()
        let groupedMessages = Dictionary(grouping: messagesFromServer) { (element) -> Date in
            return element.date.reduceToMonthDayYear()
        }

        // provide a sorting for your keys somehow
        let sortedKeys = groupedMessages.keys.sorted()
        sortedKeys.forEach { (key) in
            let values = groupedMessages[key]
            grouppedChatMessages.append(values ?? [])
        }
    }
}
