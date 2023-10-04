//
//  ContentView.swift
//  ProfileCard
//
//  Created by Thiago Américo Lopes on 4/10/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color(red: 0.20, green: 0.60, blue: 0.86, opacity: 0.7).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Image("personal-linkedin").resizable().aspectRatio(contentMode: .fit)
                    .frame(width: 150, height: 150)
                    .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                    .overlay(
                        Circle().stroke(Color.white, lineWidth: 2)
                    )
                Text("Thiago Américo Lopes")
                    .font(Font.custom("Pacifico-Regular", size: 40))
                    .bold()
                    .foregroundStyle(.white)
                Text("iOS Developer")
                    .font(.system(size: 25))
                    .foregroundStyle(.white)
                Divider()
                InfoView(infoText: "+61 477 650 638", imageName: "phone.fill")
                InfoView(infoText: "talthiagolopes@gmail.com", imageName: "envelope.fill")
            }
        }
    }
}

#Preview {
    ContentView()
}
