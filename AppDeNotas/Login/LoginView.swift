//
//  ContentView.swift
//  AppDeNotas
//
//  Created by Felipe Angeli on 12/03/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State var email: String = ""
    @State var password: String  = ""
    @State var goRegister: Bool = false
    @State var goNotes: Bool = false
    @State var isPresentAlert: Bool = false
    @State var errorMessage: String = ""
    
    
    
    var body: some View {
        NavigationStack{
            ZStack{
                Color.backgroundColor.ignoresSafeArea()
                VStack(spacing:25.0){
                    Text("Login")
                        .font(.system(size: 55, weight: .bold))
                        .foregroundStyle(.white)
                        .padding(.top, 20)
                    Spacer()
                    Group{
                        
                        TextField("", text: $email, prompt: Text("E-mail").foregroundStyle(.white))
                            .keyboardType(.emailAddress)
                        
                        SecureField("", text: $password, prompt: Text("Password").foregroundStyle(.white))
                        
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
//                        loginUser()
                        goNotes.toggle()
                    } label: {
                        Text("Login")
                            .frame(width: 180, height: 45)
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .bold))
                            .background(Color.pinkColor)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                    }
                    Spacer()
                    
                    Button{
                        goRegister.toggle()
                    } label: {
                        Text("Don't have an acount? Register")
                            .frame( height: 45)
                            .foregroundStyle(.white)
                            .font(.system(size: 18, weight: .bold))
                    }
                    .padding(.bottom, 50)
                }
              
            }
            .alert("Attencio", isPresented: $isPresentAlert) {
                Button("OK", role: .cancel) {}
            } message: {
                Text(errorMessage)
            }
            .navigationDestination(isPresented: $goRegister) {
                RegisterView()
            }
            .navigationDestination(isPresented: $goNotes) {
                NotesView()
            }
        }
    }
    
    private func loginUser() {
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error {
                errorMessage = error.localizedDescription
                isPresentAlert.toggle()
            } else {
                goNotes.toggle()
            }
        }
    }
}

#Preview {
    LoginView()
}
