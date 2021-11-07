//
//  Theme.swift
//  Memorize
//
//  Created by Lennart Wisbar on 04.11.21.
//

import Foundation

struct EmojiTheme {
    let name: String
    let emojis: [String]
    let numberOfPairs: Int
    let color: EmojiTheme.Color
    
    enum Color {
        case red, green, blue, yellow, orange, purple, black, pink, brown
    }
    
    static let faces = EmojiTheme(name: "Faces",
                                  emojis: ["😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊"],
                                  numberOfPairs: 6,
                                  color: .yellow)
    static let animals = EmojiTheme(name: "Animals",
                                    emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️", "🐨", "🐯", "🦁", "🐮"],
                                    numberOfPairs: 8,
                                    color: .brown)
    static let games = EmojiTheme(name: "Games",
                                  emojis: ["🎮", "🎯", "🎱", "👾", "🕹", "🎲", "🎳", "♥️", "♠️", "♦️", "♣️"],
                                  numberOfPairs: 7,
                                  color: .orange)
    static let hands = EmojiTheme(name: "Hands",
                                  emojis: ["🤲", "👐", "🙌", "👏", "🤝", "👍", "👎", "👊", "✊", "🤛", "🤜", "🤞"],
                                  numberOfPairs: 5,
                                  color: .pink)
    static let professions = EmojiTheme(name: "Professions",
                                        emojis: ["👮‍♀️", "👷‍♀️", "💂‍♀️", "🕵️", "👩‍⚕️", "👩‍🌾", "👨‍🍳", "👩‍🎓", "👨‍🎤", "👩‍🏫", "👩‍🏭", "🧑‍🎨", "👩‍🚒"],
                                        numberOfPairs: 8,
                                        color: .black)
    static let flags = EmojiTheme(name: "Flags",
                                  emojis: ["🏳️", "🏴‍☠️", "🏁", "🇦🇽", "🇩🇿", "🇦🇮", "🇦🇺", "🇧🇪", "🇬🇭", "🇮🇪", "🇸🇪"],
                                  numberOfPairs: 7,
                                  color: .green)
    
    static var random: EmojiTheme {
        [EmojiTheme.faces, EmojiTheme.animals, EmojiTheme.games, EmojiTheme.hands, EmojiTheme.professions, EmojiTheme.flags].randomElement()!
    }
}
