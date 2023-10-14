//
//  ContentView.swift
//  Memorize
//
//  Created by Giuliano Machado on 16/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HStack {
            CardView(isFaceUp: true)
            CardView()
            CardView()
            CardView()
        }

        .foregroundColor(.orange)
        .imageScale(.small)
        .padding()
    }
}

struct CardView: View {
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
                Text("🤪").font(.largeTitle)
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
