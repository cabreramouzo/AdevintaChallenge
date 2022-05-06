//
//  UserDetailView.swift
//  RandomUsersList
//
//  Created by MAC on 06/05/2022.
//

import SwiftUI

struct UserDetailView: View {
    @State var user = UserModel(name: UserName(title: "Mr.", first: "Pepito", last: "De Los Palotes"), location: UserLocation(street: UserStreet(number: 32, name: "Carrer Major"), city: "Barcelona", state: "Ehpaña"), registered: RegisteredDate(date: "23/09/99", age: 23), gender: Gender.male, email: "pepito@mail.com", picture: UserPicture(large: "https://randomuser.me/api/portraits/thumb/men/42.jpg", medium: "https://randomuser.me/api/portraits/thumb/men/42.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/42.jpg"))
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Personal data")) {
                    VStack(alignment: .leading) {
                        Text("First Name")
                        TextField("Enter name", text: $user.name.first)
                    }
                    VStack(alignment: .leading) {
                        Text("Last Name")
                        TextField("Enter name", text: $user.name.last)
                        
                    }
                    VStack(alignment: .leading) {
                        Text("Email")
                        TextField("Enter email", text: $user.email)
                        
                    }
                    
                    HStack {
                        Text("Gender")
                        TextField("Enter gender", text: $user.email)
                    }
                    VStack(alignment: .leading) {
                        Text("Registered Date")
                        TextField("Enter date", text: $user.registered.date)
                    }
                    
                }
            }
        }
    }
}

struct UserDetailView_Previews: PreviewProvider {
    static var previews: some View {
        UserDetailView()
    }
}
