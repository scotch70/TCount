//
//  LoginView.swift
//  TCount
//
//  Created by L.T.A Neeft on 20/04/2021.
//

import SwiftUI

import SwiftUI

struct LoginView: View {
    
    @State var username: String = ""
    @State var password: String = ""
    @State var loginIsCorrect = false
    @State var shouldShowAlert = false
    
    
    var body: some View {
        NavigationView {
            VStack {
                LogoView()
                Text("T-Count")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Form {
                    Section {
                        TextField("Username", text: $username)
                            .disableAutocorrection(true)
                            .padding()
                            .cornerRadius(5.0)
                        
                        SecureField("Password", text: $password)
                            .padding()
                            .cornerRadius(5.0)
                    }
                }
               
                NavigationLink(destination: FlightNumberView(), isActive: $loginIsCorrect) {
                    Text("Login")
                        .onTapGesture {
                            let loginIsCorrect = username == "U01EEF" && password == "12345"
                            
                            if loginIsCorrect {
                                self.loginIsCorrect = true
                            } else {
                                self.shouldShowAlert = true
                            }
                        }
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                
                
            }
            
        }
        .navigationBarTitle("TCount")
        .alert(isPresented: $shouldShowAlert) { Alert(title: Text("Email/Password incorrect")) }
    }
    
    
}



struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}









