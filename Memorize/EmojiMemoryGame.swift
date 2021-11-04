//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Lennart Wisbar on 31.10.21.
//

//  This is the VIEW MODEL part of MVVM.

import Foundation

class EmojiMemoryGame: ObservableObject {
    static let theme = EmojiTheme.random
    
    static func createMemoryGame() -> MemoryGame<String> {
        let actualNumberOfPairs = min(theme.emojis.count, theme.numberOfPairs)
        let shuffledEmojis = theme.emojis.shuffled()

        return MemoryGame<String>(numberOfPairsOfCards: actualNumberOfPairs) { shuffledEmojis[$0] }
    }
    
    @Published private var model: MemoryGame<String> = createMemoryGame()
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    
    // MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
