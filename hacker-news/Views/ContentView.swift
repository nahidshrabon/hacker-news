//
//  ContentView.swift
//  hacker-news
//
//  Created by Md. Nahidul Islam on 27/3/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    @State private var searchText = ""
    
    var body: some View {
        NavigationView{
            List(searchResults) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .navigationTitle("Hacker News")
        }
        .searchable(text: $searchText, prompt: "Search for news")
        .onAppear { networkManager.fetchData() }
    }
    
    var searchResults: [Post] {
        if searchText.isEmpty {
            return networkManager.posts
        } else {
            return networkManager.posts
                .filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
