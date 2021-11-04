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
        case red, green, blue, yellow, orange, purple, black
    }
}
