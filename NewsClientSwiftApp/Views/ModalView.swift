//
//  ModalView.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import SwiftUI

struct ModalView: View {
    var url: String
    var body: some View {
        VStack {
            Text("プレビュー").padding().font(.headline)
            WebView(url: url)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(url: "")
    }
}
