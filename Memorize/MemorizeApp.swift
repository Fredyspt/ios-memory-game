//
//  MemorizeApp.swift
//  Memorize
//
//  Created by Fredy Sanchez on 05/03/23.
//

import SwiftUI

@main
struct MemorizeApp: App {
    private let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            EmojiMemoryGameView(game: game)
        }
    }
}
