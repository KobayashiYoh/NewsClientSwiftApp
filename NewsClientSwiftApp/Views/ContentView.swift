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
                ArticleRow(article: article).onAppear() {
                    if keyword.isEmpty {
                        return
                    }
                    if article.title == self.newsService.articles[self.newsService.articles.count - 5].title {
                        self.page += 1
                        self.newsService.fetchNews(keyword: keyword, page: page)
                        print(article.title == self.newsService.articles[self.newsService.articles.count - 5].title)
                        print("追加読み込み")
                    }
                }
            }.navigationTitle("最新ニュース一覧")
        }.searchable(text: $keyword, placement: .navigationBarDrawer(displayMode: .always)).autocapitalization(.none).onSubmit(of: .search) {
            self.page = 1
            self.newsService.fetchNews(keyword: keyword, page: page)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
