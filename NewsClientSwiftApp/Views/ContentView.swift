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
    @State private var keyword = ""
    @State private var page = 1

    var body: some View {
        NavigationView {
            List(self.newsService.articles, id: \.title) { article in
                ArticleRow(article: article)
            }.navigationTitle("最新ニュース一覧")
        }.searchable(text: $keyword, placement: .navigationBarDrawer(displayMode: .always)).onSubmit(of: .search) {
            self.newsService.fetchNews(keyword: keyword, page: page)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
