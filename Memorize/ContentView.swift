//
//  ContentView.swift
//  Memorize
//
//  Created by Giuliano Machado on 16/09/2023.
//

import SwiftUI

struct ContentView: View {
    let emojis: Array<String> = ["🤪", "🌽", "🥑", "🍅", "🌮", "🧃", "📕", "⚾️", "🏋️‍♀️", "⛳️"];

    @State var cardCount: Int = 4

    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }

    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            // ForEach View also takes parameters, like index in
            // Array.indices === array.length
            ForEach(0..<cardCount, id: \.self) { index in
                CardView(content: emojis[index])
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .foregroundColor(.orange)
    }

    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            // View to add space
            Spacer()
            cardAdder
        }
        .imageScale(.large)
        .font(.largeTitle)
    }

    // External names and internal names: `by` is used when calling the function,
    // `offset` is used internally in the function.
    func cardCountAdjuster(by offset: Int, symbol: String) -> some View {
        Button(action: {
            cardCount += offset
        }, label: {
            Image(systemName: symbol)
        })
        .disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }

    var cardRemover: some View {
        // When theres one line of code you can return the value implicitly
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }

    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}

struct CardView: View {
    let content: String
    // Views are immutable, you can't change the variables in them even
    // if they are not constant.
    //  @State creates a pointer in memory to store isFaceUp
    // `Temporary state`
    @State var isFaceUp = true


    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                if (isFaceUp) {
                    base.foregroundColor(.white)
                    base.strokeBorder(lineWidth: 2)
                    Text(content).font(.largeTitle)
                }
            }
            .opacity(isFaceUp ? 1 : 0)
            // Opacity so that the element is rendered in its proper height
            base.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            // Structs have funtions in them, e.g. Bool has `toggle`
            isFaceUp.toggle()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
