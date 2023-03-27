//
//  Theme.swift
//  Memorize
//
//  Created by Fredy Sanchez on 26/03/23.
//

import Foundation

struct Theme {
    init(name: String, emojis: [String], numberOfPairsOfCards: Int, color: String) {
        self.name = name
        self.emojis = emojis
        self.numberOfPairsOfCards = numberOfPairsOfCards
        self.color = color
        
        if self.numberOfPairsOfCards > self.emojis.count {
            self.numberOfPairsOfCards = self.emojis.count - 1
        }
    }
    
    var name: String
    var emojis: [String]
    var numberOfPairsOfCards: Int
    var color: String
}
