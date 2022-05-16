//
//  ContentView.swift
//  Shared
//
//  Created by rafael hieda on 12/05/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private(set) var textValue: String = ""
    
    var body: some View {
        Text(textValue)
            .padding()
        Spacer()
        TextField("sera que funciona", text: $textValue).padding(.leading)
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
