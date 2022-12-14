//
//  ArticleRow.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import SwiftUI

struct ArticleRow: View {
    @State private var showingSheet = false
    let article: Article

    func dateString(publishedAt: String) -> String {
        let formatter = DateFormatter()
        // 端末設定によって書式が変わらない保証があるen_US_POSIXを指定
        formatter.locale = Locale(identifier: "en_US_POSIX")
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZZZZZ"
        guard let date = formatter.date(from: publishedAt) else { return "" }
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        return formatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: article.urlToImage ?? "")) { phase in
                if let image = phase.image {
                    image.resizable().scaledToFill().frame(width: 64, height: 64).clipped()
                } else if phase.error != nil {
                    Text("No Image").frame(width: 64, height: 64).background(Color.gray).foregroundColor(Color.white)
                } else {
                    ProgressView().frame(width: 64, height: 64)
                }
            }
            VStack{
                Text(article.title).lineLimit(2)
                HStack{
                    Text(dateString(publishedAt: article.publishedAt))
                    Text(article.author ?? "")
                    Spacer()
                }.font(.subheadline).lineLimit(1)
            }
        }.onTapGesture(count: 1, perform: {
            self.showingSheet.toggle()
        }).sheet(isPresented: $showingSheet, onDismiss: {}) {
            ModalView(url: article.url)
        }
    }
}
