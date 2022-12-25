//
//  NewsClient.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import Foundation

class NewsService: ObservableObject {
    @Published var articles: [Article] = []
    
    func decodeJSONToNews(data: Data) -> News {
        let decoder = JSONDecoder()
        guard let decodedResponse = try? decoder.decode(News.self, from: data) else {
            print("Json decode エラー")
            return News(articles: [])
        }
        return decodedResponse
    }

    public func fetchNews() {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=jp&apiKey=" + apiKey) else {
            return
        }
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            var statusCode: Int?
            if let response = response as? HTTPURLResponse {
                statusCode = response.statusCode
            }
            if (statusCode != nil && statusCode == 200) {
                if let data = data {
                    let news: News = self.decodeJSONToNews(data: data)
                    DispatchQueue.main.async {
                        self.articles = news.articles
                    }
                }
            } else {
                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
                print("status code: \(String(describing: statusCode))")
            }
        }.resume()
    }
    
    init() {
        fetchNews()
    }
}
