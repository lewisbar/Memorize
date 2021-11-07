//
//  MemoryGame.swift
//  Memorize
//
//  Created by Lennart Wisbar on 31.10.21.
//

//  This is the MODEL part of MVVM.

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private (set) var cards: Array<Card>
    private (set) var score = 0
    private var indexOfTheOnlyFaceUpCard: Int?
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),  // Chosen card is clickable (i.e. face down and not already matched)
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched {
            
            if let potentialMatchIndex = indexOfTheOnlyFaceUpCard {  // There is already another card which is face up
                if cards[chosenIndex].content == cards[potentialMatchIndex].content {  // Match
                    cards[chosenIndex].isMatched = true
                    cards[potentialMatchIndex].isMatched = true
                    score += 2
                } else {  // Mismatch
                    if cards[chosenIndex].hasBeenSeen {
                        score -= 1
                    }
                    if cards[potentialMatchIndex].hasBeenSeen {
                        score -= 1
                    }
                }
                indexOfTheOnlyFaceUpCard = nil
            } else {  // The chosen card is currently the only card that is face up
                for index in cards.indices {
                    if cards[index].isFaceUp {
                        cards[index].hasBeenSeen = true
                    }
                    cards[index].isFaceUp = false
                }
                indexOfTheOnlyFaceUpCard = chosenIndex
            }
            cards[chosenIndex].isFaceUp.toggle()
        }
        print("\(cards)")
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = Array<Card>()
        // Add numberOfPairsOfCards x 2 cards to cards array
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        cards = cards.shuffled()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        var hasBeenSeen = false
        var content: CardContent
        var id: Int
    }
}
