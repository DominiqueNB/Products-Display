//
//  ViewController.swift
//  Products Display
//
//  Created by Dominique Bezerra on 17/06/24.
//

import UIKit

protocol ViewConfiguration {
    func addSubviews()
    func setupConstraints()
    func setupStyle()
}

extension ViewConfiguration {
    func setup() {
        addSubviews()
        setupConstraints()
        setupStyle()
    }
}
