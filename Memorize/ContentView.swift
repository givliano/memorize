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
            HStack {
                // ForEach View also takes parameters, like index in
                // Array.indices === array.length
                ForEach(0..<cardCount, id: \.self) { index in
                    CardView(content: emojis[index])
                }
            }
             .foregroundColor(.orange)

            HStack {
                Button(action: {
                    cardCount -= 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.minus.fill")
                })
                .imageScale(.large)
                .font(.largeTitle)
                // View to add space
                Spacer()
                Button(action: {
                    cardCount += 1
                }, label: {
                    Image(systemName: "rectangle.stack.badge.plus.fill")
                })
                .imageScale(.large)
                .font(.largeTitle)
            }

        }


        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
    let content: String
    // Views are immutable, you can't change the variables in them even
    // if they are not constant.
    //  @State creates a pointer in memory to store isFaceUp
    // `Temporary state`
    @State var isFaceUp = false


    var body: some View {
        let base = RoundedRectangle(cornerRadius: 12)

        ZStack {
            if (isFaceUp) {
                base.foregroundColor(.white)
                base.strokeBorder(lineWidth: 2)
                Text(content).font(.largeTitle)
            } else {
                base
            }
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
