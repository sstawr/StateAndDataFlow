//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation

final class LoginViewViewModel: ObservableObject {
    
    var name = "" {
        didSet {
            charactersCount()
        }
    }
    
    @Published var nameCharactersCount = 0
    @Published var isLoggedIn = false
    
    private func charactersCount() {
        nameCharactersCount = name.count
    }
}
