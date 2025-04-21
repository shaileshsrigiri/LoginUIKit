//
//  DetailLoginViewController.swift
//  LoginUIKit
//
//  Created by Shailesh Srigiri on 4/15/25.
//

import UIKit

class DetailLoginViewController: UIViewController {

    let username: String
    let password: String

    init(username: String, password: String) {
        self.username = username
        self.password = password
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Welcome"

        let label = UILabel()
        label.text = "Username: \(username)\nPassword: \(password)"
        label.numberOfLines = 0
        label.textAlignment = .center

        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)

        NSLayoutConstraint.activate([
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
}
