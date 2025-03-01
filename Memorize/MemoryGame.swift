//
//  MemoryGame.swift
//  Memorize
//
//  Created by 大大怪将军 on 2025/3/1.
//

import Foundation

struct MemoryGame<CardContent> {
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = []
        // add numberOfPairsOfCards x 2 cards
        for pairIndex in 0..<max(2,numberOfPairsOfCards) {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(content: content))
            cards.append(Card(content: content))
        }
    }
    
    func choose(_ card: Card) {
        
    }
    
    mutating  func shuffle() {
        cards.shuffle() 
    }
    
    struct Card {
        var isFaceUp = true
        var isMatched = false
        var content: CardContent
    }
}
