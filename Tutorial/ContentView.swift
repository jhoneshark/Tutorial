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
    var emojis: [String] = ["🐭", "🐸", "🐱", "🐳"]
    
    var cardCount: Int = 4
    
    var body: some View {
        VStack {
            HStack {
                ForEach (emojis.indices, id: \.self) { index in
                    Card(contentImagem: emojis[index])
                }
            }
            .foregroundColor(.blue)
            HStack {
                Button("Remover") {
                    print("Remover")
                }
                Spacer()
                Button("Adicionar"){
                    print("Adicionar")
                }
                
            }

        }
        .padding()
    }
}


struct Card: View {
    let contentImagem: String
    @State var isFaceUp: Bool = false
    var body: some View {
        ZStack {
            
            let card: RoundedRectangle = RoundedRectangle(cornerRadius: 12)
            if isFaceUp {
                card.fill(.gray)
                .strokeBorder(lineWidth: 5)
                Text(contentImagem).padding().font(.largeTitle)
            } else {
                card.fill()
                Text("").padding().font(.largeTitle)
                
            }
        }
        .onTapGesture {
            isFaceUp.toggle()
        }
    }
}



















#Preview {
    AppTutorial()
}
