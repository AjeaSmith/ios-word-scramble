//
//  ContentView.swift
//  WordScramble
//
//  Created by Ajea Smith on 10/20/22.
//

import SwiftUI

struct ContentView: View {
    @State private var usedWords = [String]()
    @State private var rootWord = ""
    @State private var newWord = ""
    
    var body: some View {
        NavigationView {
            List{
                Section{
                    TextField("Enter your word", text: $newWord)
                        .autocapitalization(.none)
                }
                Section{
                    ForEach(usedWords, id: \.self) { word in
                        HStack{
                            Image(systemName: "\(word.count).circle")
                            Text(word)
                        }
                    }
                }
            }
            .navigationTitle(rootWord)
            .onSubmit(addNewWord)
            .onAppear(perform: startGame)
        }
    }
    
    func addNewWord() {
        let answer = newWord.lowercased().trimmingCharacters(in: .whitespacesAndNewlines)
        guard answer.count > 0 else { return }
        
        withAnimation {
            usedWords.insert(answer, at: 0)
        }
        
        newWord = ""
    }
    
    func startGame() {
        guard let startWordsURL = Bundle.main.url(forResource: "start", withExtension: "txt") else { return }
        
        if let startWords = try? String(contentsOf: startWordsURL){
            let allWords = startWords.components(separatedBy: "\n")
            rootWord = allWords.randomElement() ?? "silkworm"
            return
        }
        fatalError("could not load start.txt from bundle")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
