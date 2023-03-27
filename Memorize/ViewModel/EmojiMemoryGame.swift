//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Fredy Sanchez on 08/03/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    typealias Theme = ThemeManager.Theme
    
    @Published private var memoryGame: MemoryGame<String>
    @Published private var themeManager: ThemeManager
    
    var cardColor: Color {
        switch themeManager.activeTheme?.themeColor {
        case "red": return .red
        case "yellow": return .yellow
        case "blue": return .blue
        case "orange": return .orange
        case "green": return .green
        case "brown": return .brown
        default: return .black
        }
    }
    
    var cards: Array<Card> {
        memoryGame.cards
    }
    
    var themeName: String {
        themeManager.activeTheme?.name ?? "Memorize!"
    }
    
    init() {
        let themeManager = ThemeManager()
        memoryGame = EmojiMemoryGame.createMemoryGame(withTheme: themeManager.activeTheme!)
        self.themeManager = themeManager
    }
    
    
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        let numberOfPairs = theme.numberOfPairsOfCards > theme.emojis.count ? theme.emojis.count - 1 : theme.numberOfPairsOfCards
        
        return MemoryGame(numberOfPairsOfCards: numberOfPairs) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    //MARK: - Intent
    func choose(_ card: Card) {
        memoryGame.choose(card)
    }
    
    func addTheme(_ theme: Theme) {
        themeManager.addTheme(theme)
    }
    
    func startNewGame() {
        if let themeName = themeManager.themes.randomElement()?.name {
            themeManager.setActiveTheme(named: themeName)
        }
        memoryGame = EmojiMemoryGame.createMemoryGame(withTheme: themeManager.activeTheme!)
    }
}
