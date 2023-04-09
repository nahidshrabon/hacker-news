//
//  PostModel.swift
//  hacker-news
//
//  Created by Md. Nahidul Islam on 28/3/23.
//

struct Results: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
