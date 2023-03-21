//
//  ContentView.swift
//  Memorize
//
//  Created by Fredy Sanchez on 05/03/23.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var game: EmojiMemoryGame
    
    var body: some View {
        VStack {
            Text(game.themeName)
                .font(.largeTitle)
                .foregroundColor(.red)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(game.cards) { card in
                        CardView(card: card)
                            .aspectRatio(2/3, contentMode: .fit)
                            .onTapGesture {
                                game.choose(card)
                            }
                    }
                }
                .foregroundColor(game.cardColor)
            }
            Button("New Game") {
                game.startNewGame()
            }
        }
        .padding(.horizontal)
    }
}

struct CardView: View {
    let card: EmojiMemoryGame.Card
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                let cardShape = RoundedRectangle(cornerRadius: CardConstants.cornerRadius)
                if card.isFaceUp {
                    cardShape.fill().foregroundColor(.white)
                    cardShape.strokeBorder(lineWidth: CardConstants.borderWidth)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched {
                    cardShape.opacity(0)
                } else {
                    cardShape.fill()
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * CardConstants.fontScaling)
    }
    
    private struct CardConstants {
        static let cornerRadius: CGFloat = 20.0
        static let fontScaling: CGFloat = 0.8
        static let borderWidth: CGFloat = 2
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        EmojiMemoryGameView(game: game)
    }
}
