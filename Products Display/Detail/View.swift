//
//  DetailViewController.swift
//  Products Display
//
//  Created by Dominique Bezerra on 19/06/24.
//

import Foundation
import UIKit

class View: UIView {
    let stackView: UIStackView = {
        let stackView = UIStackView(frame: CGRect(x: 10, y: 20, width: UIScreen.main.bounds.size.width - 20, height: UIScreen.main.bounds.size.height - 100))
        stackView.axis = .vertical
        stackView.alignment = .leading
        stackView.spacing = 12
        return stackView
    }()

    private lazy var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        return image
    }()

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24)
        return label
    }()

    private lazy var idLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    private lazy var buyingModeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        return label
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        return button
    }()

    init() {
        super.init(frame: .zero)
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func render(item: ItemViewModel) {
        titleLabel.text = item.title
        idLabel.text = item.id
        buyingModeLabel.text = item.buyingMode
        button.setTitle("Comprar", for: .normal)
        image.image = item.image
    }

    func updateImage(_ downloadedImage: UIImage) {
        image.image = downloadedImage
    }
}
extension View: ViewConfiguration {
    func addSubviews() {
        addSubview(stackView)
        stackView.addArrangedSubview(image)
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(idLabel)
        stackView.addArrangedSubview(buyingModeLabel)
        stackView.addArrangedSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: self.centerYAnchor),

            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalTo: self.widthAnchor, constant: -40),
            button.centerXAnchor.constraint(equalTo: self.centerXAnchor)
        ])
    }

    func setupStyle() {
        backgroundColor = .white
    }
}
