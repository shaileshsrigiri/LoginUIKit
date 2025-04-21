//
//  LoginViewController.swift
//  LoginUIKit
//
//  Created by Shailesh Srigiri on 4/15/25.
//

import UIKit

class LoginViewController: UIViewController {

    let usernameField = UITextField()
    let passwordField = UITextField()
    let loginButton = UIButton(type: .system)
    let usernameErrorLabel = UILabel()
    let passwordErrorLabel = UILabel()

    private let viewModel: LoginViewModelProtocol
    
    // MARK: - Initialization
    init(viewModel: LoginViewModelProtocol = LoginViewModel()) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        view.backgroundColor = .white

        setupUI()
    }

    private func setupUI() {
        usernameField.placeholder = "Username"
        usernameField.borderStyle = .roundedRect

        passwordField.placeholder = "Password"
        passwordField.borderStyle = .roundedRect
        passwordField.isSecureTextEntry = true

        loginButton.setTitle("Login", for: .normal)
        loginButton.addTarget(self, action: #selector(validateCredentials), for: .touchUpInside)

        [usernameErrorLabel, passwordErrorLabel].forEach {
            $0.textColor = .red
            $0.font = UIFont.systemFont(ofSize: 12)
        }

        let stack = UIStackView(arrangedSubviews: [
            usernameField, usernameErrorLabel,
            passwordField, passwordErrorLabel,
            loginButton
        ])
        stack.axis = .vertical
        stack.spacing = 12
        stack.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(stack)

        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            stack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }

    @objc private func validateCredentials() {
        let username = usernameField.text ?? ""
        let password = passwordField.text ?? ""

        let usernameError = viewModel.validateUsername(username)
        let passwordError = viewModel.validatePassword(password)

        usernameErrorLabel.text = usernameError
        passwordErrorLabel.text = passwordError

        if usernameError == nil && passwordError == nil {
            let successVC = DetailLoginViewController(username: username, password: password)
            navigationController?.pushViewController(successVC, animated: true)
        }
    }
}
