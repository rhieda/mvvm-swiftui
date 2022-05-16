//
//  HomeView.swift
//  teste (iOS)
//
//  Created by rafael hieda on 14/05/22.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search Text",
                              text: $viewModel.searchText)
                    .textFieldStyle(.roundedBorder)
                    
                    if viewModel.isSearchEnabled {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    } else {
                        Image(systemName: "x.circle.fill")
                            .foregroundColor(.red)
                    }
                    
                }.padding(.init(top: 16, leading: 8, bottom: 0, trailing: 8))
                
                Spacer()
                
                switch viewModel.searchingStatus {
                    
                case .emptyResult:
                    NoDataView {}
                    Spacer()
                case .searchFinishedWithError:
                    WarningView {}
                    Spacer()
                case .searching:
                    ProgressView()
                    Spacer()
                case .searchWithMatches:
                    List {
                        ForEach(viewModel.results, id: \.trackId) {
                            let viewModel = SearchResultVM(model: $0)
                            SearchResultRow(resultVM: viewModel)
                        }
                        
                    }.listStyle(.inset)
                        .padding(.init(top: 0, leading: 8, bottom: 0, trailing: 8))
                case .idle:
                    NoDataView {}
                    Spacer()
                }
            
                Button {
                    viewModel.performSearch()
                } label: {
                    Text("Search Songs")
                        .frame(width: 250,
                               height: 40)
                }.buttonStyle(.bordered)
                    .disabled(!viewModel.isSearchEnabled)
                    .padding(.bottom, 32)
                
            }.navigationTitle("Fetch Songs")
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
