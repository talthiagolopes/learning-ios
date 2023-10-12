//
//  PostDetailView.swift
//  H1N1
//
//  Created by Thiago Américo Lopes on 10/10/2023.
//

import SwiftUI

struct PostDetailView: View {
    
    var url: String
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    PostDetailView(url: "https://google.com")
}
