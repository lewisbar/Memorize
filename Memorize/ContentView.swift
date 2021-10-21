//
//  ContentView.swift
//  SwiftUI Training
//
//  Created by Lennart Wisbar on 19.10.21.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["😁", "😆", "😅", "😂", "🤣", "🥲", "☺️", "😊", "😇", "🙂", "🙃", "😉", "😌", "😍", "🥰", "😘", "😗", "😙", "😚", "😋", "😛", "😝", "😜", "🤪", "🤨", "🧐", "🤓"]
    @State var emojiCount = 4
    
    var body: some View {
        VStack {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        Card(content: emoji, color: .blue).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
            HStack {
                removeCardButton
                Spacer()
                addCardButton
            }
            .font(.largeTitle)
            .padding(.bottom)
            .padding(.horizontal)
        }
    }
    
    var addCardButton: some View {
        Button { if emojiCount < emojis.count { emojiCount += 1 } } label: { Image(systemName: "plus.circle") }
    }

    var removeCardButton: some View {
        Button { if emojiCount > 0 { emojiCount -= 1 } } label: { Image(systemName: "minus.circle") }
    }
}

struct Card: View {
    var content = "🙂"
    var color = Color.red
    @State var isFaceUp = true
    
    var body: some View {
        ZStack() {
            let shape = RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.fill().foregroundColor(.white)
                shape.strokeBorder(lineWidth: 4)
                Text(content).font(.largeTitle)
                
            } else {
                shape.fill()
            }
        }
        .foregroundColor(color)
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}





































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
