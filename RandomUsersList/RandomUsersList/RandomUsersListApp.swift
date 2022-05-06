//
//  RandomUsersListApp.swift
//  RandomUsersList
//
//  Created by MAC on 05/05/2022.
//

import SwiftUI

@main
struct RandomUsersListApp: App {
    @StateObject var viewModel = RandomUsersViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
