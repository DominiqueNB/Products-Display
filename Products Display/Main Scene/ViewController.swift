//
//  ViewController.swift
//  Products Display
//
//  Created by Dominique Bezerra on 17/06/24.
//

import UIKit

protocol ViewControllerProtocol: AnyObject {
    func reloadTableView()
    func present(viewController: UIViewController)
    func renderError(message: String)
}

final class ViewController: UIViewController, ViewControllerProtocol {
    private lazy var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width - 20, height: 60))
        textField.placeholder = "Buscar"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .whileEditing
        textField.delegate = self
        return textField
    }()

    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: CGRect(x: 10, y: 160, width: UIScreen.main.bounds.size.width - 20, height: self.view.frame.height - 300))
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
    }()

    private lazy var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 20
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        return button
    }()

    let interactor: InteractorProtocol
    private var searchTerm: String?

    init(interactor: InteractorProtocol) {
        self.interactor = interactor
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        super.loadView()

        setup()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc
    func didTapButton() {
        var term: String = ""
        if let searchTerm, searchTerm.isEmpty == false {
            term = searchTerm
        } else if let textFieldText = textField.text, textFieldText.isEmpty == false {
            term = textFieldText
        } else {
            interactor.clearItems()
        }
        interactor.search(term)
    }

    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }

    func present(viewController: UIViewController) {
        navigationController?.present(viewController, animated: true)
    }

    func renderError(message: String) {
        let alert = UIAlertController(title: "Nenhum resultado", message: "Tente usar outras palavras", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        DispatchQueue.main.async {
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return interactor.items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = interactor.items[indexPath.row].title
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        interactor.didSelectItem(at: indexPath.row)
    }
}

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchTerm = textField.text
        textField.becomeFirstResponder()
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        searchTerm = textField.text
        textField.resignFirstResponder()
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchTerm = textField.text
        textField.resignFirstResponder()
        button.isEnabled = true

        return true
    }
}

extension ViewController: ViewConfiguration {
    func addSubviews() {
        self.view.addSubview(textField)
        self.view.addSubview(tableView)
        self.view.addSubview(button)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            self.view.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),

            textField.topAnchor.constraint(equalTo: self.view.topAnchor, constant: -16),
            textField.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),

            tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -60),

            button.topAnchor.constraint(equalTo: self.tableView.bottomAnchor, constant: 24),
            button.heightAnchor.constraint(equalToConstant: 40),
            button.widthAnchor.constraint(equalTo: self.view.widthAnchor, constant: -40),
            button.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
    }

    func setupStyle() {
        self.view.backgroundColor = .white
        self.navigationItem.title = "Busca de Produtos"
        button.setTitle("Pesquisar", for: .normal)
    }
}
