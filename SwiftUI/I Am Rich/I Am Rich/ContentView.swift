//
//  ContentView.swift
//  I Am Rich
//
//  Created by Thiago Américo Lopes on 29/9/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
        ZStack {
            Color(.systemTeal).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            VStack {
                Text("I Am Rich")
                    .font(.system(size: 50))
                    .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .foregroundColor(Color.white)
                
                Image("diamond")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 200, height: 200, alignment: .center)
            }
        }
    }
}

#Preview {
    ContentView()
    //ContentView().previewDevice(PreviewDevice(rawValue: "Apple Watch Series 5 - 44mm"))
}
