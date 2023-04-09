//
//  DetailView.swift
//  hacker-news
//
//  Created by Md. Nahidul Islam on 28/3/23.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://hn.algolia.com/")
    }
}
