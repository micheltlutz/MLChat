// swift-tools-version:4.2
//
//  MLChat.swift
//  MLChat
//
//  Created by Michel Anderson Lutz Teixeira on 01/04/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import PackageDescription

let package = Package(
    name: "MLChat",
    products: [
        .library(
            name: "MLChat",
            targets: ["MLChat"]
        ),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "MLChat",
            dependencies: [],
            path: "Sources"
        ),
        .testTarget(
            name: "MLChatTests",
            dependencies: ["MLChat"],
            path: "Tests"
        ),
    ],
    swiftLanguageVersions: [.v4, .v4_2]
)
