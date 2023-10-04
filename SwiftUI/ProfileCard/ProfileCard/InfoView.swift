//
//  InfoView.swift
//  ProfileCard
//
//  Created by Thiago Américo Lopes on 4/10/2023.
//

import SwiftUI

struct InfoView: View {
    
    let infoText: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 30)
            .fill(Color.white)
            .frame(height: 40)
            .foregroundStyle(.white)
            .overlay(
                HStack {
                    Image(systemName: imageName).foregroundColor(Color("Info Color"))
                    Text(infoText).foregroundColor(Color("Info Color"))
                }
            )
            .padding()
    }
}
    
#Preview {
    InfoView(infoText: "Dude, that's fantastic", imageName: "phone.fill")
        .previewLayout(.sizeThatFits)
}
