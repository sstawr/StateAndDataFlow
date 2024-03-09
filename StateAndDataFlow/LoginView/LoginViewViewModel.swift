//
//  LoginViewViewModel.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import Foundation
import Combine

final class LoginViewViewModel: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()
    
    var name = "" {
        didSet {
            charactersCount()
        }
    }
    
    var nameCharactersCount = 0
    @Published var isLoggedIn = false
    
    private func charactersCount() {
        nameCharactersCount = name.count
        objectWillChange.send()
    }
}
