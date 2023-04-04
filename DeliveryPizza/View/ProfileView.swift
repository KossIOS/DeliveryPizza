//
//  ProfileView.swift
//  DeliveryPizza
//
//  Created by Konstantyn Koroban on 25/03/2023.
//

import SwiftUI

struct ProfileView: View {
    
    @State var isAvaAlertPresented = false
    @State var isQuitAlertPresented = false
    @State var isAuthViewPresented = false
    
    
    var body: some View {
        
        VStack(alignment: .center, spacing: 10){
            HStack(spacing: 16) {
                Image("person")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .padding(20)
                    .background(Color("personColor"))
                    .clipShape(Circle())
                    .onTapGesture {
                        isAvaAlertPresented.toggle()
                    }
                    .confirmationDialog("Photo", isPresented: $isAvaAlertPresented) {
                        Button {
                            print("Library")
                        } label: {
                            Text("From Galery")
                        }
                        
                        Button {
                            print("Camera")
                        } label: {
                            Text("From Camera")
                        }
                    }
                
                VStack(alignment: .leading) {
                    Text("Konstantyn Koroban")
                        .bold()
                    Text("+48 791533611")
                    
                }.padding(.trailing)
            }
            
            VStack(alignment: .leading){
                Text("Delivery adres :")
                    .bold()
                Text("Poland, Cracow, ul.Siemaszki 24")
            }.padding(.trailing, 102)
            
            List {
                Text("Your order here!")
                    
            }.listStyle(.plain)
            
            
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Quit")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.padding()
                .confirmationDialog("Did you have exit?", isPresented: $isQuitAlertPresented) {
                    Button {
                        isAuthViewPresented.toggle()
                    } label: {
                        Text("Yes")
                    }
                }
                .fullScreenCover(isPresented: $isAuthViewPresented, onDismiss: nil) {
                    AuthView()
                }
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
