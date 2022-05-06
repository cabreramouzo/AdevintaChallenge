//
//  UserDetailView.swift
//  RandomUsersList
//
//  Created by MAC on 06/05/2022.
//

import SwiftUI

struct UserDetailView: View {
    let user: UserModel
    @StateObject var imagesVM = ImageViewModel()
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Personal data")) {
                    VStack(alignment: .leading) {
                        Text("First Name")
                            .font(.headline)
                        Text(user.name.first)
                    }
                    VStack(alignment: .leading) {
                        Text("Last Name")
                            .font(.headline)
                        Text(user.name.last)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Email")
                            .font(.headline)
                        Text(user.email)
                        
                    }
                    HStack {
                        Text("Gender")
                            .font(.headline)
                        Text(user.gender.rawValue.capitalized)
                    }
                    VStack(alignment: .leading) {
                        Text("Registered Date")
                            .font(.headline)
                        Text(user.registered.date)
                    }
                }
                Section(header: Text("User Image")) {
                    HStack {
                        Spacer()
                        imagesVM.image
                            .resizable()
                            .scaledToFit()
                            .frame(width:150, height: 150)
                            .background(Color.gray.opacity(0.3))
                            .cornerRadius(10)
                        Spacer()
                    }
                }
                .onAppear() {
                    imagesVM.getNetworkImage(url: URL(string: user.picture.large))
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationTitle("User Info")
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static let u = UserModel(name: UserName(title: "Mr.", first: "Pepito", last: "De Los Palotes"), location: UserLocation(street: UserStreet(number: 32, name: "Carrer Major"), city: "Barcelona", state: "Ehpaña"), registered: RegisteredDate(date: "23/09/99", age: 23), gender: Gender.male, email: "pepito@mail.com", picture: UserPicture(large: "https://randomuser.me/api/portraits/thumb/men/42.jpg", medium: "https://randomuser.me/api/portraits/thumb/men/42.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/42.jpg"))
    static var previews: some View {
        UserDetailView(user: u)
    }
}
