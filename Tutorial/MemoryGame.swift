//
//  MemorizeGame.swift
//  Tutorial
//
//  Created by Jhones on 18/10/24.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: Array<Card>
    
    func chose(card: Card) {
        
    }
    
    struct Card {
        var isfaceUp: Bool
        var isMatched: Bool
        var content: CardContent
    }
}
