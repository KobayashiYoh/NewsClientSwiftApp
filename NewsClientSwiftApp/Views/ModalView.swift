//
//  ModalView.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/25.
//

import SwiftUI

struct ModalView: View {
    let title: String
    var body: some View {
        Text(title)
    }
}

struct ModalView_Previews: PreviewProvider {
    static var previews: some View {
        ModalView(title: "title")
    }
}
