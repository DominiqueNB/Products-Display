//
//  DetailViewController.swift
//  Products Display
//
//  Created by Dominique Bezerra on 19/06/24.
//

import Foundation
import UIKit

class View: UIView {
    private lazy var label: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blue, for: .normal)
        return button
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setup(labelText: String, buttonTitle: String) {
        label.text = labelText
        button.setTitle(buttonTitle, for: .normal)
    }
}
extension View: ViewConfiguration {
    func addSubviews() {
        addSubview(label)
        addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),

            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 8),
            button.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }

    func setupStyle() {
        backgroundColor = .white
    }
}
