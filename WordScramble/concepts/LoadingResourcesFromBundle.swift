//
//  LoadingResourcesFromBundle.swift
//  WordScramble
//
//  Created by Ajea Smith on 10/20/22.
//

import SwiftUI

struct LoadingResourcesFromBundle: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
    func loadFile() {
        if let fileURL = Bundle.main.url(forResource: "some-file", withExtension: "txt"){
            guard let fileContents = try? String(contentsOf: fileURL) else {return}
            print(fileContents)
        }
    }
}

struct LoadingResourcesFromBundle_Previews: PreviewProvider {
    static var previews: some View {
        LoadingResourcesFromBundle()
    }
}
