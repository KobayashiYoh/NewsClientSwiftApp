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
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            List(self.newsService.articles, id: \.title) { article in
                ArticleRow(article: article)
            }.navigationTitle("ニュース記事一覧")
        }.searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always)).onSubmit(of: .search) {
            self.newsService.fetchNews(searchText: searchText)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
