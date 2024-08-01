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

struct ContentView: View {
    var body: some View {
        HStack {
            Card(isFaceUp: true)
            Card(isFaceUp: false)
            Card(isFaceUp: true)
        }
        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
        .padding()
    }
}


struct Card: View {
    var isFaceUp: Bool = false
    var body: some View {
        ZStack(content: {
            if isFaceUp {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.gray)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 10)
                Text("💻").padding().font(.largeTitle)
            } else {
                RoundedRectangle(cornerRadius: 12).foregroundColor(.blue)
                RoundedRectangle(cornerRadius: 12)
                    .strokeBorder(lineWidth: 10)
                Text("").padding().font(.largeTitle)
            }
        })
    }
}



















#Preview {
    ContentView()
}
