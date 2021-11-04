//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Lennart Wisbar on 31.10.21.
//

//  This is the VIEW MODEL part of MVVM.

// import Foundation
import SwiftUI

class EmojiMemoryGame: ObservableObject {

    static func createMemoryGame(with theme: EmojiTheme) -> MemoryGame<String> {
        let actualNumberOfPairs = min(theme.emojis.count, theme.numberOfPairs)
        let shuffledEmojis = theme.emojis.shuffled()
        return MemoryGame<String>(numberOfPairsOfCards: actualNumberOfPairs) { shuffledEmojis[$0] }
    }
    
    init(with theme: EmojiTheme) {
        self.theme = theme
        self.model = Self.createMemoryGame(with: theme)
    }
    
    @Published private var model: MemoryGame<String>
    @Published private var theme: EmojiTheme
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    var color: Color {
        switch theme.color {
        case .red: return .red
        case .green: return .green
        case .blue: return .blue
        case .orange: return .orange
        case .yellow: return .yellow
        case .black: return .black
        case .purple: return .purple
        case .pink: return .pink
        case .brown: return .brown
        }
    }
    
    
    // MARK: - Intents
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
    
    func startNewGame() {
        model = EmojiMemoryGame.createMemoryGame(with: .random)
    }
}
