//
//  SearchResultVM.swift
//  teste (iOS)
//
//  Created by rafael hieda on 14/05/22.
//

import Foundation

struct SearchResultVM {
    let model: SearchResult
    
    var trackName: String {
        model.trackName ?? String()
    }
    
    var imgURL: URL? {
        URL(string: model.artworkUrl60 ?? String())
    }
    
    var fullPrice: String {
        guard let gPrice = model.trackPrice,
                let gCurrency = model.currency else { return "NA"}
        return gPrice.formatted(.currency(code: gCurrency))
    }
    
}
