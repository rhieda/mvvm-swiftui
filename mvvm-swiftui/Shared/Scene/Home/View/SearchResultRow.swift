//
//  SearchResultRow.swift
//  teste (iOS)
//
//  Created by rafael hieda on 14/05/22.
//

import SwiftUI

struct SearchResultRow: View {
    
    let resultVM: SearchResultVM
    
    var body: some View {
        HStack {

            AsyncImage(url: resultVM.imgURL) { image in
                image.resizable()
            } placeholder: {
                Image(systemName: "camera.fill")
            }.frame(width: 50,
                    height: 50)
            .cornerRadius(10)
            
            Text(resultVM.trackName)
                .font(.title3)
                .lineLimit(2)
            
            Spacer()
            
            VStack {
                Text("Price")
                    .font(.caption2)
                Text(resultVM.fullPrice)
                    .font(.caption2.weight(.heavy))
            }
            
        }.padding()
    }
}

struct SearchResultRow_Previews: PreviewProvider {
    static var previews: some View {
        SearchResultRow(resultVM: SearchResultVM(
            model: SearchResult.example)
        )
            .previewLayout(.fixed(width: 360, height: 80))
    }
}
