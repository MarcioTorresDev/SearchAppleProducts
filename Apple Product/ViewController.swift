//
//  ViewController.swift
//  Apple Product
//
//  Created by Márcio Torres on 22/06/25.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    // MARK: - Dados dos Produtos
    let products: [String: (price: Double, imageName: String)] = [
        "iPhone 16 Pro": (5700.00, "iphone"),
        "iPad Pro": (5900.00, "ipad"),
        "MacBook Air": (6500.00, "macbook"),
        "AirPods Pro": (1200.00, "airpods"),
        "Magic Mouse": (799.00, "mouse"),
        "Magic Keyboard": (1400.00, "keyboard"),
        "HomePod Mini": (600.00, "homepod")
    ]
    
    // MARK: - Componentes de UI
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Busca de Produtos Apple"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let searchTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Digite o nome do produto"
        textField.borderStyle = .roundedRect
        textField.returnKeyType = .done
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private let searchButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Buscar", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .lightGray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.font = UIFont.systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Ciclo de Vida
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupViews()
        setupConstraints()
        
        searchButton.addTarget(self, action: #selector(searchProduct), for: .touchUpInside)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGesture)
        
        searchTextField.delegate = self
    }
    
    // MARK: - Ações
    
    @objc private func searchProduct() {
        guard let searchText = searchTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines), !searchText.isEmpty else {
            resultLabel.text = "Por favor, digite um nome de produto."
            productImageView.image = nil
            return
        }
        
        let lowercasedInput = searchText.lowercased()
        
        // Busca inteligente: ignora maiúsculas/minúsculas e aceita buscas parciais
        
        if let matchedProduct = products.first(where: { $0.key.lowercased().contains(lowercasedInput) }) {
            resultLabel.text = "Produto: \(matchedProduct.key)\nPreço: R$ \(String(format: "%.2f", matchedProduct.value.price))"
            
            productImageView.image = UIImage(named: matchedProduct.value.imageName)
            
        } else {
            resultLabel.text = "Produto não encontrado."
            productImageView.image = nil
        }
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        searchProduct()
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: - Setup de Views
    
    private func setupViews() {
        view.addSubview(titleLabel)
        view.addSubview(searchTextField)
        view.addSubview(searchButton)
        view.addSubview(productImageView)
        view.addSubview(resultLabel)
    }
    
    // MARK: - Constraints
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            searchTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            searchTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            searchTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            searchTextField.heightAnchor.constraint(equalToConstant: 44),
            
            searchButton.topAnchor.constraint(equalTo: searchTextField.bottomAnchor, constant: 20),
            searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            productImageView.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 30),
            productImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            productImageView.heightAnchor.constraint(equalToConstant: 200),
            productImageView.widthAnchor.constraint(equalToConstant: 200),
            
            resultLabel.topAnchor.constraint(equalTo: productImageView.bottomAnchor, constant: 20),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
