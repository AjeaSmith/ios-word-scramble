//
//  Lists.swift
//  WordScramble
//
//  Created by Ajea Smith on 10/20/22.
//

import SwiftUI

struct Lists: View {
    private let people = ["John", "Fred", "Dan", "Mary", "Micah"]
    var body: some View {
        VStack{
            // V1
            List {
                Section("section 1") {
                    Text("Static row 1")
                    Text("Static row 2")
                }
                Section("Section 2") {
                    ForEach(0..<5) { int in
                        Text("dynamic row \(int)")
                    }
                }
                Section("Section 3") {
                    Text("random row")
                }
            }
            .listStyle(.plain)
            
            // V2
            List(people, id: \.self){
                Text($0)
            }.listStyle(.grouped)
        }
    }
}

struct Lists_Previews: PreviewProvider {
    static var previews: some View {
        Lists()
    }
}
