//
//  Article.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import Foundation

struct Article: Codable {
    let title: String
    let author: String?
    let urlToImage: String?
    let publishedAt: String
}
