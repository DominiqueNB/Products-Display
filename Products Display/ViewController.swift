//
//  ViewController.swift
//  Products Display
//
//  Created by Dominique Bezerra on 17/06/24.
//

import UIKit

final class ViewController: UIViewController {
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: self.view.frame.height - 60))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Pesquisar", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    let interactor: InteractorProtocol = Interactor()

    override func loadView() {
        super.loadView()

        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.title = "Busca de Produtos"
        interactor.fetchItems()
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = interactor.items[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
    }

    @objc
    func didTapButton() {
        self.navigationItem.title = "Itens encontrados"
    }
}

extension ViewController: ViewConfiguration {
    func addSubviews() {
        self.view.addSubview(tableView)
        self.view.addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -24),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    func setupStyle() {
        self.view.backgroundColor = .white
    }
}
