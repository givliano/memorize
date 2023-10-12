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
    var isFaceUp = false

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
            print("hi")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
