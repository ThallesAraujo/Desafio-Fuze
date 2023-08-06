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
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                if viewModel.showError{
                    ErrorView(viewModel: viewModel)
                }else{
                    VStack(spacing: 24){
                        if viewModel.isLoading{
                            ProgressView()
                        }
                        
                        if let matches = viewModel.matches {
                            ForEach(matches, id: \.id){match in
                                Card(match: match).onTapGesture {
                                    self.navigateToDetails(match: match)
                                }
                            }
                        }
                        
                        if let matchUnwrapped = selectedMatch{
                            NavigationLink(emptyString, destination: Details(match: matchUnwrapped), isActive: $goToDetails)
                        }
                        
                    }.padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
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
}

#Preview {
    Home()
}
