//
//  ContentView.swift
//  H1N1
//
//  Created by Thiago Américo Lopes on 9/10/2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        VStack {
            NavigationView {
                List(networkManager.posts) { post in
                    NavigationLink(destination: PostDetailView(url: post.url)) {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }                    }
                }
                .navigationTitle("H1N1")
            }
            .onAppear {
                self.networkManager.fectData()
            }
        }
    }
}

#Preview {
    ContentView()
}
