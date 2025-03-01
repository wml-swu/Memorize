//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by 大大怪将军 on 2025/3/1.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    private static let emojis = ["👻","🤡","🌎","👽","🐶","👑","🐛","🌨️","❤️","👀","⚽️","💕"]
    
    private static func createMemoryGame() -> MemoryGame<String> {
        return MemoryGame(numberOfPairsOfCards: 12) { pairIndex in
            if emojis.indices.contains(pairIndex) {
                return emojis[pairIndex]
            } else {
                return "⁉️"
            }
        }
    }
    
    @Published private var model = createMemoryGame() 
    
    var cards: Array<MemoryGame<String>.Card > {
        return model.cards
    }
    
    // MARK: - Intents
    
    func shuffle() {
        model.shuffle()
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    } 
}
 
