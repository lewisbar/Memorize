//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Lennart Wisbar on 21.10.21.
//

import SwiftUI

@main
struct MemorizeApp: App {
    let game = EmojiMemoryGame()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
