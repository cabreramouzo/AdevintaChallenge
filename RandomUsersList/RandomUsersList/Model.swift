//
//  Model.swift
//  RandomUsersList
//
//  Created by MAC on 05/05/2022.
//

import SwiftUI
import Combine

let urlRandomUsers = URL(string: "https://randomuser.me/api/?results=30")!

struct UserName: Decodable, Hashable {
    let title, first, last: String
}

struct UserStreet: Decodable, Hashable {
    let number: Int
    let name: String
}

struct UserLocation: Decodable, Hashable {
    let street: UserStreet
    let city: String
    let state: String
}

enum Gender: String, Decodable, CaseIterable, Hashable {
    case female
    case male
}

struct RegisteredDate: Decodable, Hashable {
    let date: String
    let age: Int
}

struct UserPicture: Decodable, Hashable {
    let large, medium, thumbnail: String
}

struct UserModel: Decodable, Hashable {
    let name: UserName
    let location: UserLocation
    let registered: RegisteredDate
    let gender: Gender
    let email: String
    let picture: UserPicture
}

struct ApiResult: Decodable {
    let results: [UserModel]
}

