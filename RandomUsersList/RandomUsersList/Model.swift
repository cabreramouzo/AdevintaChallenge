//
//  Model.swift
//  RandomUsersList
//
//  Created by MAC on 05/05/2022.
//

import SwiftUI
import Combine

var urlRandomUsers = URL(string: "https://randomuser.me/api/?inc=gender,name,email,location,registered,picture&results=300")!

struct UserName: Decodable, Hashable {
    var title, first, last: String
}

struct UserStreet: Decodable, Hashable {
    var number: Int
    var name: String
}

struct UserLocation: Decodable, Hashable {
    var street: UserStreet
    var city: String
    var state: String
}

enum Gender: String, Decodable, CaseIterable, Hashable {
    case female = "female"
    case male = "male"
}

struct RegisteredDate: Decodable, Hashable {
    var date: String
    var age: Int
}

struct UserPicture: Decodable, Hashable {
    var large, medium, thumbnail: String
}

struct UserModel: Decodable, Hashable {
    var name: UserName
    var location: UserLocation
    var registered: RegisteredDate
    var gender: Gender
    var email: String
    var picture: UserPicture
}

struct ApiResult: Decodable {
    var results: [UserModel]
}
