//
//  NoDataView.swift
//  MVVM-SwiftUI (iOS)
//
//  Created by rafael hieda on 16/05/22.
//

import SwiftUI

struct NoDataView<Content: View>: View {
    
    let content: Content
    
    private let noDataString: String = "No data available"
    
    private let noDataImageName = "exclamationmark.triangle.fill"
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        Image(systemName: noDataImageName)
            .resizable()
            .foregroundColor(.yellow)
            .frame(width: 64, height: 64, alignment: .center)
        Text(noDataString)
            .font(.title2)
        content
    }
    
}
