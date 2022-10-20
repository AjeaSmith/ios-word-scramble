//
//  WorkWithStrings.swift
//  WordScramble
//
//  Created by Ajea Smith on 10/20/22.
//

import SwiftUI

struct WorkWithStrings: View {
    var body: some View {
        Button(action: test) {
            Text("Click me")
        }.font(.largeTitle)
    }
    func test() {
        let word = "swift"
        let checker = UITextChecker()
        
        let range = NSRange(location: 0, length: word.utf16.count)
        let misspelled = checker.rangeOfMisspelledWord(in: word, range: range, startingAt: 0, wrap: false, language: "en")
        
        let allGood = misspelled.location == NSNotFound
    }
}

struct WorkWithStrings_Previews: PreviewProvider {
    static var previews: some View {
        WorkWithStrings()
    }
}
