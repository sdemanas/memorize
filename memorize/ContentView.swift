//
//  ContentView.swift
//  memorize
//
//  Created by Manas Pande on 5/25/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            let emojis = ["💃","❤️","😘","☺️","🙈"]
            ForEach(emojis.indices, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: false)
            }
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                base.foregroundColor(.blue)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle).padding()
            }
            else {
                base.foregroundColor(.yellow)
            }
        }.onTapGesture {
            isFaceUp.toggle()
            print("faceflip")
        }
    }
}

#Preview {
    ContentView()
}
