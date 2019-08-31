//
//  DateHeaderLabel.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

class DateHeaderLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)

        backgroundColor = UIColor(hex: "d3d3d3")
        textColor = .black
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
        font = UIFont.boldSystemFont(ofSize: 14)
    }

    override var intrinsicContentSize: CGSize {
        let originalContentSize = super.intrinsicContentSize
        let height = originalContentSize.height + 12
        layer.cornerRadius = height / 2
        layer.masksToBounds = true
        return CGSize(width: originalContentSize.width + 20, height: height)
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
