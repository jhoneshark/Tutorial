//
//  ContentView.swift
//  Tutorial
//
//  Created by Jhones on 30/07/24.
//

import SwiftUI

// posso usar assim VStack(alignment: .leading, spacing: 20)
// mudando de VStack para Zstack
// borda pontilhada   .strokeBorder(style: StrokeStyle(lineWidth: 10, dash: [10,2]) )
// pude usar foregroundColor ou fill para o definir a cor do fundo

// posso usar assim RoundedRectangle(cornerRadius: 12).fill(.gray) ou criar uma vareavel
// e mandar assim var card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)

// onTapGesture pega o clique na tela

// pode ser assim
//        .onTapGesture {
//      isFaceUp = !isFaceUp
// }



// ou
// isFaceUp.toggle()

//temos o foreach assim             HStack {
//    ForEach (0..<4, id: \.self) { index in
//        Card(contentImagem: emojis[index])
//    }
//}
//
//e assim
//
//HStack {
//ForEach (emojis.indices, id: \.self) { index in
//    Card(contentImagem: emojis[index])
//}
//}

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Button("Shuffle") {
                viewModel.shuffle()
            }
            .padding()
        }
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85), spacing: 0)], spacing: 0) {
            ForEach(viewModel.cards.indices, id: \.self) { index in
                CardView(viewModel.cards[index])
                    .aspectRatio(2/3, contentMode: .fit)
                    .padding(4)
            }
        }
        .foregroundColor(.blue)
    }
}


struct CardView: View {
    let card: MemoryGame<String>.Card

    init(_ card: MemoryGame<String>.Card) {
        self.card = card
    }
    
    var body: some View {
        ZStack {
            let base = RoundedRectangle(cornerRadius: 12)
            Group {
                base.fill(.gray)
                base.strokeBorder(lineWidth: 5)
                Text(card.content).font(.system(size: 200))
                    .minimumScaleFactor(0.01)
                    .aspectRatio(1, contentMode: .fit)
            }
               .opacity(card.isFaceUp ? 1 : 0)
            base.fill()
                .opacity(card.isFaceUp ? 0 : 1)
        }
    }
}












#Preview {
    EmojiMemoryGameView(viewModel: EmojiMemoryGame())
}
