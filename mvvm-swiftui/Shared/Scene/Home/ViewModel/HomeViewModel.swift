//
//  HomeViewModel.swift
//  teste (iOS)
//
//  Created by rafael hieda on 14/05/22.
//

import Foundation

enum SearchStatus {
    case idle
    case searching
    case searchWithMatches
    case emptyResult
    case searchFinishedWithError
}


@MainActor
public class HomeViewModel: ObservableObject {
    
    @Published var results = [SearchResult]()
    @Published var searchText = "" {
        didSet {
            isSearchEnabled = (searchText.count > 2)
        }
    }
    
    @Published private(set) var isSearchEnabled = false
    
    @Published var isSearchingData = false
    
    @Published var searchingStatus: SearchStatus = .idle
    
    func performSearch() {
        let searchValue = searchText.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? String()
        guard let gURL = URL(string: "https://itunes.apple.com/search?term=\(searchValue)") else {
            return
        }
        
        Task {
            do {
                searchingStatus = .searching
                let fetchedResult:(data: Data, urlResponse: URLResponse) = try await URLSession.shared.data(from: gURL)
                let searchResponse = try JSONDecoder().decode(SearchResponse.self,
                                                        from: fetchedResult.data)
                
                DispatchQueue.main.async { [weak self] in
                    
                    guard let self = self else { return }
                    if let results = searchResponse.results,
                       results.count > 0{
                        self.searchingStatus = .searchWithMatches
                        self.results = results
                    } else {
                        self.searchingStatus = .emptyResult
                        self.results = []
                    }
                }
                
            } catch {
                searchingStatus = .searchFinishedWithError
                print("Error while fetching data")
            }
            print(self.searchingStatus)
        }
        
    }
    
}
