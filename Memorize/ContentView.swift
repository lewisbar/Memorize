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
            Text("Memorize!").font(.largeTitle).padding(.top)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        Card(content: emoji, color: .blue).aspectRatio(2/3, contentMode: .fit)
                    }
                }
                .padding()
            }
        }
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
