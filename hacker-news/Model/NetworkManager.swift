//
//  NetworkManager.swift
//  hacker-news
//
//  Created by Md. Nahidul Islam on 28/3/23.
//

import Foundation

final class NetworkManager: ObservableObject {
    static let rootURLString = "https://hn.algolia.com/api/v1/search?tags=front_page"
    
    @Published var posts = [Post]()
    
    func fetchData() {
        guard
            let url = URL(string: NetworkManager.rootURLString)
        else { return }
        
        URLSession(configuration: .default)
            .dataTask(with: url) { (data, response, error) in
                guard error == nil else {
                    print("Fetch Error \(error.debugDescription)")
                    return
                }
                
                guard let safeData = data else {
                    print("Data is nil")
                    return
                }
                
                do {
                    let results = try JSONDecoder().decode(Results.self, from: safeData)
                    
                    DispatchQueue.main.async {
                        self.posts = results.hits
                    }
                } catch {
                    print("Decoding Error \(error)")
                }
            }.resume()
    }
}
