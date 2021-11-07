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
            HStack {
                Spacer()
                Button(action: viewModel.startNewGame, label: {
                    Text("New Game")
                })
            }
            .padding(.horizontal)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(viewModel.cards) { card in
                        CardView(card: card, color: viewModel.themeColor)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                viewModel.choose(card)
                            }
                    }
                }
                .padding()
            }
            .padding(.horizontal)
            HStack {
                Text("Theme: \(viewModel.themeName)")
                Spacer()
                Text("Score: \(viewModel.score)")
            }
            .padding()
        }
    }
}


private struct CardView: View {
    let card: MemoryGame<String>.Card
    let color: Color
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if card.isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched {
                shape.opacity(0)
            } else {
                shape.fill().foregroundColor(color)
            }
        }
    }
}





































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = EmojiMemoryGame(with: .random)
        ContentView(viewModel: viewModel).preferredColorScheme(.light)
        ContentView(viewModel: viewModel).preferredColorScheme(.dark)
    }
}
