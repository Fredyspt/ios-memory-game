//
//  MemoryGame.swift
//  Memorize
//
//  Created by Fredy Sanchez on 08/03/23.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    private(set) var cards: Array<Card>
    
    private var indexOfFirstAndOnlySelection: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp == true}).onlyElement }
        set { cards.indices.forEach { cards[$0].isFaceUp = $0 == newValue } }
    }
    
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: {  $0.id == card.id }),
           !cards[chosenIndex].isFaceUp,
           !cards[chosenIndex].isMatched
        {
            if let indexOfPotentialMatch = indexOfFirstAndOnlySelection {
                if cards[indexOfPotentialMatch].content == cards[chosenIndex].content {
                    cards[indexOfPotentialMatch].isMatched = true
                    cards[chosenIndex].isMatched = true
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                indexOfFirstAndOnlySelection = chosenIndex
            }
        }
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int) -> CardContent) {
        cards = []
        
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = createCardContent(pairIndex)
            guard !cards.contains(where: { card in
                card.content == content
            }) else { continue }
            cards.append(Card(content: content, id: pairIndex*2))
            cards.append(Card(content: content, id: pairIndex*2+1))
        }
        
        cards.shuffle()
    }
    
    struct Card: Identifiable {
        var isFaceUp = false
        var isMatched = false
        let content: CardContent
        let id: Int
    }
}

extension Array {
    var onlyElement: Element? {
        self.count == 1 ? self.first : nil
    }
}
 
