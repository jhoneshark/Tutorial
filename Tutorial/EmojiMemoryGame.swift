//
//  EmojiMemoryGame.swift
//  Tutorial
//
//  Created by Jhones on 18/10/24.
//

import SwiftUI

class EmojiMemoryGame {
    private var model = MemoryGame(numberOfPairsOfCards: 4) { pairIndex in
        return ["🐭", "🐸", "🐱", "🐳", "⌚️", "💻", "🖥️", "📱", "💽", "💎"][pairIndex]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        return model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
//        model.choose(card)
    }
}
