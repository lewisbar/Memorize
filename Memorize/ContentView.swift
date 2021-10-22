//
//  ContentView.swift
//  SwiftUI Training
//
//  Created by Lennart Wisbar on 19.10.21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = Themes.faces.shuffled()
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).padding(.top)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojis.count], id: \.self) { emoji in
                        Card(content: emoji, color: .blue).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
            HStack(alignment: .bottom) {
                ImageTextButton(image: Image(systemName: "face.smiling"), text: "Faces") {
                    emojis = Themes.faces.shuffled()
                }
                Spacer()
                ImageTextButton(image: Image(systemName: "tortoise"), text: "Animals") {
                    emojis = Themes.animals.shuffled()
                }
                Spacer()
                ImageTextButton(image: Image(systemName: "gamecontroller"), text: "Games") {
                    emojis = Themes.games.shuffled()
                }
            }
            .padding(.horizontal).padding(.bottom)
        }
    }
}

struct Themes {
    static let faces = ["😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊"]
    static let animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮"]
    static let games = ["🎮", "🎯", "🎱", "👾", "🕹", "🎲", "🎳", "♥️", "♠️", "♦️", "♣️"]
}

struct ImageTextButton: View {
    var image: Image
    var text: String
    var action: () -> Void
    
    var body: some View {
        Button(action: action, label: {
            VStack {
                image.font(.largeTitle)
                Text(text).font(.footnote)
            }
        })
    }
}

struct Card: View {
    var content = "🙂"
    var color = Color.red
    @State var isFaceUp = true
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
        .foregroundColor(color)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.light)
        ContentView().preferredColorScheme(.dark)
    }
}
