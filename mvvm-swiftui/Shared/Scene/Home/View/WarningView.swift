//
//  WarningView.swift
//  MVVM-SwiftUI (iOS)
//
//  Created by rafael hieda on 16/05/22.
//

import SwiftUI

struct WarningView<Content: View>: View {
    
    let content: Content
    
    private let noDataString: String = "Could not fetch data"
    private let noDataImageName = "x.circle.fill"
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Image(systemName: noDataImageName)
            .resizable()
            .foregroundColor(.red)
            .frame(width: 64, height: 64, alignment: .center)
        Text(noDataString)
            .font(.title2)
        content
    }
    
}
