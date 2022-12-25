//
//  ModalView.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import SwiftUI

struct ModalView: View {
    @Environment(\.presentationMode) var presentation
    var url: String
    var body: some View {
        VStack {
            HStack{
                Image(systemName: "globe").onTapGesture(count: 1, perform: {
                    UIApplication.shared.open(URL(string: url)!)
                }).foregroundColor(Color.blue).frame(width: 48, alignment: .leading).padding()
                Spacer()
                Text("プレビュー").padding().font(.headline)
                Spacer()
                Button(action: {
                    self.presentation.wrappedValue.dismiss()
                }, label: {Text("閉じる")}).frame(width: 48).padding()
            }
            WebView(url: url)
        }
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(url: "")
    }
}
