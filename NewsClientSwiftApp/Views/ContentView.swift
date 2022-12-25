//
//  ContentView.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/16.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @ObservedObject var newsService = NewsService()

    var body: some View {
        NavigationView {
            List(self.newsService.articles, id: \.title) { article in
                ArticleRow(article: article)
            }.navigationTitle("ニュース記事一覧")
        }           // データ読み込み処理
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
