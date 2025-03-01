//
//  MemorizeGame.swift
//  Memorize
//
//  Created by 大大怪将军 on 2025/3/1.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func choose(card: Card) {
        
    }
    
    struct Card {
        var isFaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
