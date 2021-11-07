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
    
    private enum Scenario {
        case doesNotExist
        case notClickable
        case onlyOneCardIsFaceUpNow(chosenIndex: Int)
        case match(chosenIndex: Int, matchIndex: Int)
        case mismatch(chosenIndex: Int, misMatchIndex: Int)
    }
    
    private func scenario(for chosenCard: Card) -> Scenario {
        guard let chosenIndex = cards.firstIndex(where: { $0.id == chosenCard.id }) else { return .doesNotExist }
        if cards[chosenIndex].isFaceUp || cards[chosenIndex].isMatched { return .notClickable }
        guard let potentialMatchIndex = indexOfTheOnlyFaceUpCard else { return .onlyOneCardIsFaceUpNow(chosenIndex: chosenIndex) }
        if cards[chosenIndex].content == cards[potentialMatchIndex].content { return .match(chosenIndex: chosenIndex, matchIndex: potentialMatchIndex) }
        else { return .mismatch(chosenIndex: chosenIndex, misMatchIndex: potentialMatchIndex) }
    }
    
    mutating func choose(_ chosenCard: Card) {
        switch scenario(for: chosenCard) {
        case .doesNotExist, .notClickable: return
        case .onlyOneCardIsFaceUpNow(let chosenIndex):
            for index in cards.indices where cards[index].isFaceUp {
                cards[index].hasBeenSeen = true
                cards[index].isFaceUp = false
            }
            cards[chosenIndex].isFaceUp = true
            indexOfTheOnlyFaceUpCard = chosenIndex
        case .match(let chosenIndex, let matchIndex):
            cards[chosenIndex].isMatched = true
            cards[matchIndex].isMatched = true
            score += 2
            cards[chosenIndex].isFaceUp = true
            indexOfTheOnlyFaceUpCard = nil
        case .mismatch(let chosenIndex, let misMatchIndex):
            if cards[chosenIndex].hasBeenSeen { score -= 1 }
            if cards[misMatchIndex].hasBeenSeen { score -= 1 }
            cards[chosenIndex].isFaceUp = true
            indexOfTheOnlyFaceUpCard = nil
        }
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
