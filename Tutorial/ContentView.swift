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

struct AppTutorial: View {
    var emojis: [String] = ["🐭", "🐸", "🐱", "🐳", "⌚️", "💻", "🖥️", "📱", "💽", "💎"]
    
    @State var cardCount: Int = 4
    
    var body: some View {
        VStack {
            ScrollView {
                cards
            }
            Spacer()
            cardCountAdjusters
        }
        .padding()
    }
    
    var cardCountAdjusters: some View {
        HStack {
            cardRemover
            Spacer()
            cardAdder
        }.imageScale(.large).font(.largeTitle)
    }
    
    var cards: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 120))]) {
            ForEach (0..<cardCount, id: \.self) { index in
                Card(contentImagem: emojis[index])
                    .aspectRatio(2/3, contentMode: .fit)
            }
        }
        .foregroundColor(.blue)
    }
    
    func cardCountAdjuster(by offset:Int, symbol: String) -> some View {
        Button(action: {
                cardCount += offset
        }, label: {
            Image(systemName: symbol)
        }).disabled(cardCount + offset < 1 || cardCount + offset > emojis.count)
    }
        
    var cardRemover: some View {
        cardCountAdjuster(by: -1, symbol: "rectangle.stack.badge.minus.fill")
    }
    
    var cardAdder: some View {
        cardCountAdjuster(by: +1, symbol: "rectangle.stack.badge.plus.fill")
    }
}


struct Card: View {
    let contentImagem: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            Group {
                card.fill(.gray)
                .strokeBorder(lineWidth: 5)
                Text(contentImagem).padding().font(.largeTitle)
            }
            .opacity(isFaceUp ? 1 : 0)
            card.fill().opacity(isFaceUp ? 0 : 1)
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



















#Preview {
    AppTutorial()
}
