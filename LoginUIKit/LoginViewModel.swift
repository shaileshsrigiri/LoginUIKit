//
//  LoginViewModel.swift
//  LoginUIKit
//
//  Created by Shailesh Srigiri on 4/15/25.
//

import Foundation


protocol LoginViewModelProtocol {
    func validateUsername(_ username: String) -> String?
    func validatePassword(_ password: String) -> String?
}

class LoginViewModel: LoginViewModelProtocol {

    func validateUsername(_ username: String) -> String? {
        if username == username.uppercased() ||
            username == username.lowercased() {
            return nil
        }
        let first = username.prefix(1)
        let rest = username.dropFirst()
        if first == first.uppercased() && rest == rest.lowercased() {
            return nil
        }
        return "Username format is invalid"
    }

    func validatePassword(_ password: String) -> String? {
        if password.count < 8 {
            return "Password must be at least 8 characters"
        }
        let numbers = CharacterSet.decimalDigits
        let special = CharacterSet(charactersIn: "!@#?")
        
        guard password.rangeOfCharacter(from: numbers) != nil else {
            return "Password must contain number"
        }
        guard password.rangeOfCharacter(from: special) != nil else {
            return "Password must contain special character (!@#?)"
        }
        return nil
    }
}

