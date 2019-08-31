//
//  UIVIew+Extension.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import Foundation

public protocol ViewConfiguration: AnyObject {
    func setupConstraints()
    func buildViewHierarchy()
    func configureViews()
    func setupViewConfiguration()
}

extension ViewConfiguration {
    public func setupViewConfiguration() {
        buildViewHierarchy()
        setupConstraints()
        configureViews()
    }

    public func configureViews() {
    }
}
