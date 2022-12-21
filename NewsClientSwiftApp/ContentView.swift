//
//  ContentView.swift
//  NewsClientSwiftApp
//
//  Created by 小林陽 on 2022/12/16.
//

import SwiftUI

struct Article: Codable {
    var title: String
}

struct ContentView:
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
