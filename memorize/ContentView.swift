//
//  ContentView.swift
//  memorize
//
//  Created by Manas Pande on 5/25/25.
//

import SwiftUI

// Important to scope out where exactly data is required
let emojis = ["💃","❤️","😘","☺️","🙈", "😭","😩","💕","😒","🛌","📖","🧑‍💻"]

struct ContentView: View {
    @State var cardCount: Int = 5
    
    // We want each code maintainable and short thus refactoring
    // var body here is our main view all others are pieces in the bigger view struct
    var body: some View {
        VStack {
            ScrollView {
                cardStack
            }
            Spacer()
            cardStackAdjusters
        }.padding()
    }
    
    var cardStack: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index], isFaceUp: false)
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.green)
        .padding()
    }
    
    // Since these are not a part of the card stack
    // Refactor these into their own views
    var cardStackAdjusters: some View {
                HStack() {
                    cardRemover
                    Spacer()
                    cardAdder
                }
                .imageScale(.large)
                .font(.largeTitle)
            }
    
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
    
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    @State var isFaceUp = false
    
    // To-Do : Fix group opacity to render cards face down everytime
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.blue)
                base.strokeBorder()
                Text(content).font(.largeTitle).padding()
            }
            base.fill().opacity(isFaceUp ? 1 : 0)
            
        }.onTapGesture {
            isFaceUp.toggle()
        }
    }
}

#Preview {
    ContentView()
}
