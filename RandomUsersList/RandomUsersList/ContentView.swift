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
        List {
            ForEach(usersVM.randomUsers, id: \.self) { user in
                
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
        }.onAppear(perform: {
            //usersVM.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    @StateObject static var viewModel = RandomUsersViewModel()
    static var previews: some View {
        ContentView()
            .environmentObject(viewModel)
    }
}
