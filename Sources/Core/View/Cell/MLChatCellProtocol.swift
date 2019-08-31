//
//  MLChatCellProtocol.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

public protocol MLChatCellProtocol: AnyObject {
    static var cellId: String { get }
    func configure(with configuration: MLChatConfigurations)
}
