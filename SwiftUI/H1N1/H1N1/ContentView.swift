//
//  ContentView.swift
//  H1N1
//
//  Created by Thiago Américo Lopes on 9/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationView {
                List(posts) { post in
                    Text(post.title)
                }
                .navigationTitle("H1N1 News")
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

//
//struct Post: Identifiable {
//    let id: String
//    let title: String
//}
//
//let posts = [
//    Post(id: "1", title: "Hi mate"),
//    Post(id: "2", title: "Hi dude"),
//    Post(id: "3", title: "Eae cara")
//]
