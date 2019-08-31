//
//  DateHeaderView.swift
//  MLChat-iOS
//
//  Created by Michel Anderson Lutz Teixeira on 31/08/19.
//  Copyright © 2019 micheltlutz. All rights reserved.
//

import UIKit

final class DateHeaderView: UIView {
    private let label = DateHeaderLabel()
    private let lineView: UIView = {
        let lineView = UIView(frame: .zero)
        lineView.translatesAutoresizingMaskIntoConstraints = false
        lineView.backgroundColor = UIColor(hex: "d3d3d3")
        return lineView
    }()

    init(with date: Date) {
        super.init(frame: .zero)

        formatTitle(with: date)
        setupViewConfiguration()
    }

    private func formatTitle(with date: Date) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyyy"
        let dateString = dateFormatter.string(from: date)
        label.text = dateString
    }

    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - ViewConfiguration
extension DateHeaderView: ViewConfiguration {
    func setupConstraints() {
        NSLayoutConstraint.activate([
            lineView.heightAnchor.constraint(equalToConstant: 1),
            lineView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            lineView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            lineView.topAnchor.constraint(equalTo: topAnchor, constant: 2),
            label.centerXAnchor.constraint(equalTo: centerXAnchor),
            label.centerYAnchor.constraint(equalTo: centerYAnchor)
            ])
    }

    func buildViewHierarchy() {
        addSubview(lineView)
        addSubview(label)
    }
}
