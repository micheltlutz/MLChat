//
//  MLChatSpec.swift
//  MLChat
//
//  Created by Michel Anderson Lutz Teixeira on 01/04/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Quick
import Nimble
@testable import MLChat

class MLChatSpec: QuickSpec {
    override func spec() {
        describe("MLChatSpec") {
            it("works") {
                expect(MLChat.name) == "MLChat"
            }
        }
    }
}
