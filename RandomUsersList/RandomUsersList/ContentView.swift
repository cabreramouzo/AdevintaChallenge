//
//  ContentView.swift
//  RandomUsersList
//
//  Created by MAC on 05/05/2022.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var usersVM: RandomUsersViewModel
    @StateObject var imagesVM = ImageViewModel()
    var body: some View {
        NavigationView {
            List {
                ForEach(usersVM.randomUsers, id: \.self) { user in
                    NavigationLink(
                        destination: UserDetailView(user: user),
                        label: {
                            UserRow(user: user)
                        })
                        .navigationTitle(Text("Random Users"))
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var viewModel = RandomUsersViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(viewModel)
    }
}

struct UserRow: View {
    @StateObject var imagesVM = ImageViewModel()
    let user: UserModel
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("\(user.name.first), \(user.name.last)")
                Text("\(user.email)")
                    .font(.footnote)
                
            }
            Spacer()
            imagesVM.image
                .resizable()
                .scaledToFit()
                .frame(width: 50)
        }.onAppear(perform: {
            imagesVM.getNetworkImage(url: URL(string: user.picture.thumbnail))
        })
    }
}
