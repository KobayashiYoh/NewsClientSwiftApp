//
//  NewsClient.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import Foundation

class NewsService: ObservableObject {
    @Published var articles: [Article] = []

    public func loadData() {
        
        /// URLの生成
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&apiKey=" + apiKey) else {
            /// 文字列が有効なURLでない場合の処理
            return
        }
        
        /// URLリクエストの生成
        let request = URLRequest(url: url)
        
        /// URLにアクセス
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let data = data {    // ①データ取得チェック
                
                /// ②JSON→Responseオブジェクト変換
                let decoder = JSONDecoder()
                guard let decodedResponse = try? decoder.decode(News.self, from: data) else {
                    print("Json decode エラー")
                    return
                }
                
                /// ③書籍情報をUIに適用
                DispatchQueue.main.async {
                    self.articles = decodedResponse.articles
                }
            } else {
                /// ④データが取得できなかった場合の処理
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
            }
        }.resume()      // タスク開始処理（必須）
    }
    
    init() {
        loadData()
    }
}
