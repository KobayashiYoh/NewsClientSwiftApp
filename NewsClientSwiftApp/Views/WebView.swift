//
//  WebView.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    var url: String

    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {
        print(URL(string: url)!)
        uiView.load(URLRequest(url: URL(string: url)!))
    }
}

struct WebView_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            WebView(url: "url")
        }
    }
}
