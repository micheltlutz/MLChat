//
//  RefreshControl.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

class RefreshControl: UIRefreshControl {
    private lazy var activityIndicator: UIImageView = {
        let activityIndicator = UIImageView(image: UIImage(named: ""))
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 26, height: 26)
        return activityIndicator
    }()

    private var configuration: MLChatConfigurations!

    init(configuration: MLChatConfigurations) {
        super.init()

        self.configuration = configuration
        setUp()
    }

    private func setUp() {
        if let customImageLoading = configuration.customImageLoading {
            tintColor = .clear
            activityIndicator.image = UIImage(named: customImageLoading)
            activityIndicator.translatesAutoresizingMaskIntoConstraints = false
            addSubview(activityIndicator)
            NSLayoutConstraint.activate([
                activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
                activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
                ])
            rotationAnimation()
        }
    }

    private func startAnimating() {
        rotationAnimation()
    }

    @objc private func rotationAnimation() {
        let rotate = CABasicAnimation(keyPath: "transform.rotation")
        rotate.fromValue = NSNumber(value: 0.0)
        rotate.toValue = NSNumber(value: 6.2)
        rotate.repeatCount = Float(CGFloat.greatestFiniteMagnitude)
        rotate.duration = 1.5
        activityIndicator.layer.add(rotate, forKey: "rotateRepeatedly")
    }

    required init?(coder aDecoder: NSCoder) { fatalError("init(coder:) has not been implemented") }
}
