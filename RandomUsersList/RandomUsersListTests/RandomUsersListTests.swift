//
//  RandomUsersListTests.swift
//  RandomUsersListTests
//
//  Created by MAC on 05/05/2022.
//

import XCTest
@testable import RandomUsersList

class RandomUsersListTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testRemoveUserFromVM() throws {
        let u1 = UserModel(name: UserName(title: "Mr.", first: "Perico", last: "De Los Palotes"), location: UserLocation(street: UserStreet(number: 32, name: "Carrer Major"), city: "Barcelona", state: "Ehpaña"), registered: RegisteredDate(date: "23/09/99", age: 23), gender: Gender.male, email: "pepito@mail.com", picture: UserPicture(large: "https://randomuser.me/api/portraits/thumb/men/42.jpg", medium: "https://randomuser.me/api/portraits/thumb/men/42.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/men/42.jpg"))
        let u2 = UserModel(name: UserName(title: "Ms", first: "Perica", last: "Dels Pelots"), location: UserLocation(street: UserStreet(number: 32, name: "Carrer Manresa"), city: "Barcelona", state: "Catalunya"), registered: RegisteredDate(date: "23/09/91", age: 30), gender: Gender.female, email: "perica@mail.com", picture: UserPicture(large: "https://randomuser.me/api/portraits/thumb/woman/42.jpg", medium: "https://randomuser.me/api/portraits/thumb/woman/42.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/woman/42.jpg"))
        let u3 = UserModel(name: UserName(title: "Ms", first: "Perica", last: "Dels Pelots"), location: UserLocation(street: UserStreet(number: 32, name: "Carrer Manresa"), city: "Barcelona", state: "Catalunya"), registered: RegisteredDate(date: "23/09/91", age: 30), gender: Gender.female, email: "perica@mail.com", picture: UserPicture(large: "https://randomuser.me/api/portraits/thumb/woman/42.jpg", medium: "https://randomuser.me/api/portraits/thumb/woman/42.jpg", thumbnail: "https://randomuser.me/api/portraits/thumb/woman/42.jpg"))
        
        var users = [u1, u2, u3]
        let vm = RandomUsersViewModel(usersArray: users)
        vm.remove(at: IndexSet(integer: 1))
        assert(vm.randomUsers.count == 2)
        users = [u1, u3]
        for i in 0..<2 {
            assert(vm.randomUsers[i] == users[i])
        }
        vm.remove(at: IndexSet(integer: 0))
        assert(vm.randomUsers.count == 1)
        users = [u3]
        assert(vm.randomUsers[0] == users[0])
    }

}
