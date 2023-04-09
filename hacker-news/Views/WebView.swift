//
//  WebView.swift
//  hacker-news
//
//  Created by Md. Nahidul Islam on 28/3/23.
//

import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard
            let urlString = urlString,
            let url = URL(string: urlString)
        else {
            print("Bad url \(String(describing: urlString))")
            return
        }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
