//
//  Model.swift
//  RandomUsersList
//
//  Created by MAC on 05/05/2022.
//

import SwiftUI
import Combine

let urlRandomUsers = URL(string: "https://randomuser.me/api/")

struct UserName: Codable {
    let title: String
    let first: String
    let last: String
}

struct UserLocation: Codable {
    let street: String
    let city: String
    let state: String
}

enum Gender: String, Codable, CaseIterable {
    case female = "Female"
    case male = "Male"
}

struct UserModel: Codable, Identifiable {
    let id:Int
    let name: UserName
    let location: UserLocation
    let registeredDate: Date
    let gender: Gender
    let email: String
    let avatar: URL
}
