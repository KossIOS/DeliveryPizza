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
    
    @StateObject var vieModel: ProfileViewModel
    
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
                    TextField("Name", text: $vieModel.profile.name)
                        .font(.body.bold())
                    HStack {
                        Text("+48")
                        TextField("Phone", value: $vieModel.profile.phone, format: IntegerFormatStyle.number)
                    }
                }
            }.padding()
            
            VStack(alignment: .leading){
                Text("Delivery adres :")
                    .bold()
                TextField("Your address", text: $vieModel.profile.address)
            }.padding(.horizontal)
            
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
        .onSubmit {
            vieModel.setProfile()
        }
        
        .onAppear{
            self.vieModel.getProfile()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(vieModel: ProfileViewModel(profile: KKUser(id: "", name: "Koss", phone: 123456789, address: "Siemaszki")))
    }
}
