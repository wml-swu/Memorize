//
//  CardView.swift
//  Memorize
//
//  Created by 大大怪将军 on 2025/3/2.
//

import SwiftUI

struct CardView: View {
    typealias Card = MemoryGame<String>.Card
    
    let card: Card
    
    init(_  card: Card) {
        self.card = card
    }
    
    var body: some View {
        Pie(endAngle: .degrees(240))
            .opacity(Constants.Pie.opacity)
            .overlay(
                Text(card.content)
                    .font(.system(size: Constants.FontSize.largest))
                    .minimumScaleFactor(Constants.FontSize.scaleFactor)
                    .multilineTextAlignment(.center)
                    .aspectRatio(1, contentMode: .fit)
                    .padding(Constants.Pie.inset)
            )
            .padding(Constants.inset)
            .cardify(isFaceUp: card.isFaceUp)
            .opacity(card.isFaceUp || !card.isMatched ? 1 : 0)
    }
    
    private struct Constants {
        static let cornerRadius: CGFloat = 12
        static let lineWidth: CGFloat = 2
        static let inset: CGFloat = 5
        struct FontSize {
            static let largest: CGFloat = 200
            static let smallest: CGFloat = 10
            static let scaleFactor = smallest / largest
        }
        struct Pie {
            static let opacity: CGFloat = 0.3
            static let inset: CGFloat = 5
        }
    }
}

typealias Card = CardView.Card

#Preview {
    VStack {
        HStack {
            CardView(Card(isFaceUp: true, content: "X", id: "test1" ))
                .aspectRatio(4/3, contentMode: .fit)
            CardView(Card(content: "X", id: "test1"))
        }
        HStack {
            CardView(Card(isFaceUp: true, content: "This is a very long string and I hope it fits", id: "test1" ))
            CardView(Card(isMatched:true, content: "X", id: "test1"))
        }
    }
        .padding()
        .foregroundColor(.green)
}
