//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Fredy Sanchez on 08/03/23.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    typealias Card = MemoryGame<String>.Card
    
    private static var themes = [
        Theme(name: "Vehicles", emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🛴", "🚲", "🛵"], numberOfPairsOfCards: 10, color: "red"),
        Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏑", "🏏"], numberOfPairsOfCards: 8, color: "blue"),
        Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️"], numberOfPairsOfCards: 6, color: "yellow"),
        Theme(name: "Fruits", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐"], numberOfPairsOfCards: 10, color: "orange"),
        Theme(name: "Drinks", emojis: ["🍼", "🍹", "🥃", "🍸", "🧃", "🥤", "🍺", "☕️"], numberOfPairsOfCards: 8, color: "green"),
        Theme(name: "Instruments", emojis: ["🎤", "🎹", "🥁", "🎷", "🎸", "🎻"], numberOfPairsOfCards: 6, color: "brown"),
    ]
    
    @Published private var memoryGame: MemoryGame<String>
    var theme: Theme
    
    var cardColor: Color {
        switch theme.color {
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
        theme.name
    }
    
    init() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        memoryGame = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }
    
    private static func createMemoryGame(withTheme theme: Theme) -> MemoryGame<String> {
        MemoryGame(numberOfPairsOfCards: theme.numberOfPairsOfCards) { pairIndex in
            theme.emojis[pairIndex]
        }
    }
    
    //MARK: - Intent
    func choose(_ card: Card) {
        memoryGame.choose(card)
    }
    
    func addTheme(_ theme: Theme) {
        EmojiMemoryGame.themes.append(theme)
    }
    
    func startNewGame() {
        theme = EmojiMemoryGame.themes.randomElement()!
        theme.emojis.shuffle()
        memoryGame = EmojiMemoryGame.createMemoryGame(withTheme: theme)
    }
}
