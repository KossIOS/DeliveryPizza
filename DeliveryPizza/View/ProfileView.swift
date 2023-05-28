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
    
    @StateObject var viewModel: ProfileViewModel
    
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
                
                VStack(alignment: .leading, spacing: 12) {
                    TextField("Name", text: $viewModel.profile.name)
                        .font(.body.bold())
                    HStack {
                        Text("+48")
                        TextField("Phone", value: $viewModel.profile.phone, format: IntegerFormatStyle.number)
                    }
                }
            }.padding()
            
            VStack(alignment: .leading, spacing: 8){
                Text("Delivery adres :")
                    .bold()
                TextField("Your address", text: $viewModel.profile.address)
            }.padding(.horizontal)
            
            List {
                if viewModel.orders.count == 0 {
                    Text("No orders")
                } else {
                    ForEach(viewModel.orders, id: \.id) { order in
                        OrderCell(order: order)
                    }
                }
                
                
            }.listStyle(.plain)
            
            Button {
                isQuitAlertPresented.toggle()
            } label: {
                Text("Exit")
                    .padding()
                    .padding(.horizontal, 30)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .cornerRadius(20)
            }.padding()
                .confirmationDialog("Did you have exit?", isPresented: $isQuitAlertPresented, titleVisibility: .visible) {
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
            viewModel.setProfile()
        }
        
        .onAppear {
            self.viewModel.getProfile()
            self.viewModel.getOrders()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(viewModel: ProfileViewModel(profile: KKUser(id: "", name: "Koss", phone: 123456789, address: "Siemaszki")))
    }
}
