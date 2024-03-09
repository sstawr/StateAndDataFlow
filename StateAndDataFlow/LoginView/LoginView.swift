//
//  LoginView.swift
//  StateAndDataFlow
//
//  Created by Alexey Efimov on 06.03.2024.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject private var loginViewVM: LoginViewViewModel
    @State private var countColor = Color.red
    @State private var isDisable = true
    
    var body: some View {
        VStack {
            HStack {
                TextField("Enter your name", text: $loginViewVM.name)
                    .multilineTextAlignment(.center)
                    .onChange(of: loginViewVM.name, initial: true) {
                        countColor = loginViewVM.nameCharactersCount >= 3 ? Color.green : Color.red
                        isDisable = loginViewVM.nameCharactersCount >= 3 ? false : true
                    }
                
                Text("\(loginViewVM.nameCharactersCount)")
                    .foregroundStyle(countColor)
            }
            
            Button(action: login) {
                Label("OK", systemImage: "checkmark.circle")
            }
            .disabled(isDisable)
        }
        .padding()
    }
    
    private func login() {
        if !loginViewVM.name.isEmpty {
            loginViewVM.isLoggedIn.toggle()
        }
    }
}

#Preview {
    LoginView()
        .environmentObject(LoginViewViewModel())
}
