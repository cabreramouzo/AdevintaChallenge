//
//  ViewModel.swift
//  RandomUsersList
//
//  Created by MAC on 05/05/2022.
//

import SwiftUI
import Combine

final class RandomUsersViewModel: ObservableObject {
    @Published var randomUsers = [UserModel]()
    var subscribers = Set<AnyCancellable>()
    
    init() {
        URLSession.shared
            .dataTaskPublisher(for: urlRandomUsers)
            .map(\.data)
            .decode(type: ApiResult.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error when leading \(error)")
                }
            }, receiveValue: { response in
                print(response)
                self.randomUsers = response.results
            })
            .store(in: &subscribers)
    }
    
    func fetchData() {
        URLSession.shared
            .dataTaskPublisher(for: urlRandomUsers)
            .map(\.data)
            .decode(type: ApiResult.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: {
                if case .failure(let error) = $0 {
                    print("Error when leading \(error)")
                }
            }, receiveValue: { response in
                print(response)
                self.randomUsers = response.results
            })
            .store(in: &subscribers)
    }
    
}

final class ImageViewModel: ObservableObject {
    @Published var image = Image(systemName: "person.fill")
    
    var subscribers = Set<AnyCancellable>()
    
    func getNetworkImage(url: URL?) {
        URLSession.shared
            .dataTaskPublisher(for: url!)
            .receive(on: DispatchQueue.main)
            .map(\.data)
            .compactMap { UIImage(data: $0) }
            .map { Image(uiImage: $0) }
            .replaceEmpty(with: Image(systemName: "person.fill"))
            .replaceError(with: Image(systemName: "person.fill"))
            .assign(to: \.image, on: self)
            .store(in: &subscribers)
    }
}
