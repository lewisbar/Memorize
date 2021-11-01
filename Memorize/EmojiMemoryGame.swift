//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Lennart Wisbar on 31.10.21.
//

//  This is the VIEW MODEL part of MVVM.

import Foundation

class EmojiMemoryGame: ObservableObject {
    static let emojis = Themes.faces
    
    static func createMemoryGame() -> MemoryGame<String> {
        MemoryGame<String>(numberOfPairsOfCards: 4) { pairIndex in
            emojis[pairIndex]
        }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    struct Themes {
        static let faces = ["😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊"]
        static let animals = ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮"]
        static let games = ["🎮", "🎯", "🎱", "👾", "🕹", "🎲", "🎳", "♥️", "♠️", "♦️", "♣️"]
    }
    
    // MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
