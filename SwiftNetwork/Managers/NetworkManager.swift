//
//  Network.swift
//  SwiftNetwork
//
//  Created by Дэвид Бердников on 04.05.2021.
//

import Foundation

class NetworkManager {

    static let shared = NetworkManager()

    init() {}

    func fetchData(from url: String?, with comlition: @escaping ([Friend]) -> Void ) {
        guard let url = URL(string: URLExamples.UrlJson.rawValue) else { return }

        URLSession.shared.dataTask(with: url) { (data, _, error) in
            guard let data = data else {
                print(error?.localizedDescription ?? "No error description" )
                return
            }

            do {
                let friend = try JSONDecoder().decode([Friend].self, from: data)
                print(friend)
            } catch let error {
                print(error.localizedDescription)
            }
        }.resume()
    }
}



