//
//  ContentView.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 22/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State private var is_Auth = true
    
    @State private var email = ""
    @State private var password = ""
    @State private var confirmPassword = ""
    
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
                
                SecureField("Password", text: $email)
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
                    print ("Aut")
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
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
