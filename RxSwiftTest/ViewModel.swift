//
//  ViewModel.swift
//  RxSwiftTest
//
//  Created by Артем Галай on 1.01.23.
//

import UIKit
import RxCocoa
import RxSwift

class ViewModel {
    var users = BehaviorSubject(value: [User]())

    func fetchUsers() {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
            guard let data = data else { return }

            do {
                let responseData = try JSONDecoder().decode([User].self, from: data)
                self.users.on(.next(responseData))
            } catch {
                print(error.localizedDescription)
            }
        }
        task.resume()
    }
}

struct User: Codable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
