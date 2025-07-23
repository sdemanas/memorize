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
            CardView(isFaceUp: false)
            CardView(isFaceUp: true)
        }
        .foregroundColor(.orange)
        .padding()
    }
}

struct CardView: View {  
    var isFaceUp: Bool = false
    var body: some View {
        ZStack (content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.blue)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 2)
                Text("Hi").font(.largeTitle).padding()
            }
            else {
                RoundedRectangle(cornerRadius: 12)
                    .foregroundColor(.yellow)
            }
        })
    }
}

#Preview {
    ContentView()
}
