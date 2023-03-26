//
//  ContentView.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 22/02/2023.
//

import SwiftUI

struct AuthView: View {
    @State private var is_Auth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    @State private var isTabViewShow = false
    
    var body: some View {
        
        VStack(spacing: 20) {
            Text(is_Auth ? "Authorization" : "Registration")
                .padding()
                .padding(.horizontal, 30)
                .font(.title2.bold())
                .background(Color("whiteAlpha"))
                .cornerRadius(30)
                .padding(.top, -45)
            
            VStack {
                TextField("Enter your email", text: $email)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(15)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                SecureField("Password", text: $password)
                    .padding()
                    .background(Color("whiteAlpha"))
                    .cornerRadius(15)
                    .padding(8)
                    .padding(.horizontal, 12)
                
                if !is_Auth {
                    SecureField("Repeat password", text: $confirmPassword)
                        .padding()
                        .background(Color("whiteAlpha"))
                        .cornerRadius(15)
                        .padding(8)
                        .padding(.horizontal, 12)
                }
                
                Button {
                    if is_Auth {
                        print ("Autorization")
                        isTabViewShow.toggle()
                    } else {
                        print ("Registration")
                        self.email = ""
                        self.password = ""
                        self.confirmPassword = ""
                        self.is_Auth.toggle()
                    }
                    
                } label: {
                    Text("Sign In")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(15)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
                
                Button {
                    is_Auth.toggle()
                } label: {
                    Text("Registration")
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(LinearGradient(colors: [Color("yellow"), Color("orange")], startPoint: .leading, endPoint: .trailing))
                        .cornerRadius(15)
                        .padding(8)
                        .padding(.horizontal, 12)
                        .font(.title3.bold())
                        .foregroundColor(.black)
                }
            }
            
            
        }.frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Image("background")).ignoresSafeArea()
            .animation(Animation.easeOut(duration: 0.5), value: is_Auth)
            .fullScreenCover(isPresented: $isTabViewShow) {
                MainTabBarView()
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
