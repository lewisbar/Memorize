//
//  ContentView.swift
//  SwiftUI Training
//
//  Created by Lennart Wisbar on 19.10.21.
//

//  This is the VIEW part of MVVM.

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).padding(.top)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .padding()
            }
            .foregroundColor(.red)
            .padding(.horizontal)
            
//            HStack(alignment: .bottom) {
//                ImageTextButton(image: Image(systemName: "face.smiling"), text: "Faces") {
//                    emojis = Themes.faces.shuffled()
//                }
//                Spacer()
//                ImageTextButton(image: Image(systemName: "tortoise"), text: "Animals") {
//                    emojis = Themes.animals.shuffled()
//                }
//                Spacer()
//                ImageTextButton(image: Image(systemName: "gamecontroller"), text: "Games") {
//                    emojis = Themes.games.shuffled()
//                }
//            }
//            .padding(.horizontal).padding(.bottom)
        }
    }
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

struct CardView: View {
    let card: MemoryGame<String>.Card
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(card.content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }
    }
}





































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame()
        ContentView(viewModel: viewModel).preferredColorScheme(.light)
        ContentView(viewModel: viewModel).preferredColorScheme(.dark)
    }
}
