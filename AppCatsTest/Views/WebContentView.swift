//
//  WebContentView.swift
//  AppCatsTest
//
//  Created by Jose Preatorian on 04-02-25.
//

import Foundation
import SwiftUI
import WebKit

struct WebContentView: View {
    let url: URL
    
    var body: some View {
        WebView(url: url)
            .navigationTitle("Web")
    }
}

struct WebView: UIViewRepresentable {
    let url: URL
    
  public func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        webView.load(URLRequest(url: url))
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        
    }
}

struct WebContentView_Previews: PreviewProvider {
    static var previews: some View {
        WebContentView(url: URL(string: "http://www.vetstreet.com/cats/bengal")!)
    }
}
