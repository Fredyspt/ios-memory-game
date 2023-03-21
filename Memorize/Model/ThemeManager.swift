//
//  Theme.swift
//  Memorize
//
//  Created by Fredy Sanchez on 20/03/23.
//

import Foundation

struct ThemeManager {
    private(set) var themes = [
        Theme(name: "Vehicles", emojis: ["🚗", "🚕", "🚙", "🚌", "🚎", "🏎️", "🚓", "🚑", "🚒", "🚐", "🛻", "🚚", "🚛", "🛴", "🚲", "🛵"], numberOfPairsOfCards: 10, themeColor: "red"),
        Theme(name: "Sports", emojis: ["⚽️", "🏀", "🏈", "⚾️", "🥎", "🏐", "🏉", "🥏", "🎱", "🏓", "🏸", "🏑", "🏏"], numberOfPairsOfCards: 8, themeColor: "blue"),
        Theme(name: "Animals", emojis: ["🐶", "🐱", "🐭", "🐹", "🐰", "🦊", "🐻", "🐼", "🐻‍❄️"], numberOfPairsOfCards: 6, themeColor: "yellow"),
        Theme(name: "Fruits", emojis: ["🍏", "🍎", "🍐", "🍊", "🍋", "🍌", "🍉", "🍇", "🍓", "🫐"], numberOfPairsOfCards: 10, themeColor: "orange"),
        Theme(name: "Drinks", emojis: ["🍼", "🍹", "🥃", "🍸", "🧃", "🥤", "🍺", "☕️"], numberOfPairsOfCards: 8, themeColor: "green"),
        Theme(name: "Instruments", emojis: ["🎤", "🎹", "🥁", "🎷", "🎸", "🎻"], numberOfPairsOfCards: 6, themeColor: "brown"),
    ]
    
    var activeTheme: Theme? {
        themes.filter({ $0.isActive }).onlyElement
    }
    
    init() {
        if let themeIndex = themes.indices.randomElement() {
            themes[themeIndex].isActive = true
        }
    }
    
    mutating func setActiveTheme(named themeName: String) {
        themes.indices.forEach({ themes[$0].isActive = themes[$0].name == themeName })
    }
    
    mutating func addTheme(_ theme: Theme) {
        themes.append(theme)
    }
    
    struct Theme {
        let name: String
        let emojis: [String]
        let numberOfPairsOfCards: Int
        let themeColor: String
        var isActive = false
    }
}
