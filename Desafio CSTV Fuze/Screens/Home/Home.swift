//
//  Home.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @State var goToDetails: Bool = false
    @State var selectedMatch: MatchResult?
    @State var page: Int = 1
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                if viewModel.showError{
                    ErrorView(viewModel: viewModel)
                }else{
                    LazyVStack(spacing: 24){
                        if viewModel.isLoading{
                            ProgressView()
                        }
                        
                        if let matches = viewModel.matches {
                            ForEach(matches, id: \.id){match in
                                Card(match: match).onTapGesture {
                                    self.navigateToDetails(match: match)
                                }.onAppear {
                                    if let thisItemIndex = viewModel.matches?.firstIndex(where: {$0.id == match.id }), let finalIndex = viewModel.matches?.count , thisItemIndex == finalIndex - 1{
                                        loadNextPage()
                                    }
                                }
                            }
                        }
                        
                    }.padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
                }
                if let matchUnwrapped = selectedMatch{
                    NavigationLink(emptyString, destination: Details(match: matchUnwrapped), isActive: $goToDetails)
                }
            }.refreshable(action: {
                viewModel.getMatches()
            }).navigationTitle(HomeTexts.homeScreenTitle.rawValue)
        }.onAppear(perform: {
            viewModel.getMatches()
        })
        
    }
    
    
    func navigateToDetails(match: MatchResult){
        self.selectedMatch = match
        self.goToDetails = true
    }
    
    private func loadNextPage(){
        withAnimation {
            self.page += 1
            viewModel.getMatches(page: self.page)
        }
    }
}

#Preview {
    Home()
}
