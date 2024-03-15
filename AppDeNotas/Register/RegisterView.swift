//
//  RegisterView.swift
//  AppDeNotas
//
//  Created by Felipe Angeli on 13/03/24.
//

import SwiftUI
import FirebaseAuth

struct RegisterView: View {
    
    @State var email: String = ""
    @State var password: String  = ""
    @State var confirmPassword: String = ""
    @State var isPresentAlert: Bool = false
    @State var goNotes: Bool = false
    @State var errorMessage: String = ""
    
    var body: some View {
            ZStack{
                Color.backgroundColor.ignoresSafeArea()
                VStack(spacing:25.0){
                    Text("Register")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 5)
                        .padding(.bottom, 50)
                    Group{                        
                        TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                            .keyboardType(.emailAddress)
                        SecureField("", text: $password, prompt: Text("Password").foregroundStyle(.white))
                        SecureField("", text: $confirmPassword, prompt: Text("Confirm Password").foregroundStyle(.white))
                        
                    }
                    .frame(height: 40)
                    .padding(7)
                    .overlay(content: {
                        RoundedRectangle(cornerRadius: 8).stroke(Color.pinkColor, lineWidth: 2.0)
                    })
                    .padding(7)
                    .foregroundStyle(.white)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    
                    Spacer()
                    
                    Button{
                        registerUser()
                    } label: {
                        Text("Register")
                            .frame(height: 45)
                            .frame(maxWidth: .infinity)
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .bold))
                            .background(isDisableButton ? Color.pinkColor.opacity(0.4) : Color.pinkColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    .disabled(isDisableButton)
                    .padding(.bottom, 50)
                }
        }
            .alert("Attencio", isPresented: $isPresentAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }

            .navigationDestination(isPresented: $goNotes) {
                NotesView()
            }
    }
    var isDisableButton: Bool {
        return email.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        password.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        confirmPassword.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
        }
    
    //registro firebase
    private func registerUser() {
        if password == confirmPassword {
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error {
                    errorMessage = error.localizedDescription
                    isPresentAlert.toggle()
                } else {
                    goNotes.toggle()
                }
            }
        } else {
            errorMessage = "Check password and confirm password and try again"
            isPresentAlert.toggle()
        }
    }
}

#Preview {
    RegisterView()
}
