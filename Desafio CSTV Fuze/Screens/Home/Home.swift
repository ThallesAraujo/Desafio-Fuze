//
//  Home.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI

//TODO: Colocar fonte roboto

struct Home: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    @State var goToDetails: Bool = false
    @State var selectedMatch: MatchResult?
    
    var body: some View {
        
        NavigationView{
            ScrollView{
                VStack(spacing: 24){
                    if viewModel.isLoading{
                        ProgressView()
                    }
                    
                    if let matches = viewModel.matches {
                        ForEach(matches, id: \.id){match in
                            ZStack(alignment: .topTrailing){
                                
                                VStack(spacing: 12){
                                    Spacer().frame(height: 24)
                                    OpponentsView(match: match)
                                    VStack(spacing: 0) {
                                        Divider().frame(width: .infinity, height: 2).background(.white.opacity(0.2))
                                        HStack(spacing: 8){
                                            if let leagueLogo = match.league?.imageURL, let leagueLogoURL = URL(string: leagueLogo){
                                                AsyncImage(url: leagueLogoURL){image in
                                                    image.resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 20, maxHeight: 20)
                                                }placeholder: {
                                                    ProgressView()
                                                }
                                            }
                                            
                                            Text(match.league?.name ?? "").font(.custom("Roboto-Regular",size: 8))
                                            Text(match.serie?.name ?? "").font(.custom("Roboto-Regular",size: 8))
                                            Spacer()
                                            
                                            
                                        }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                    }
                                    
                                    
                                }.background(Color.init("background_card", bundle: .main)).cornerRadius(16)
                                TimeLabel(match: match)
                            }.onTapGesture {
                                self.navigateToDetails(match: match)
                            }
                        }
                    }
                    
                    if let matchUnwrapped = selectedMatch{
                        NavigationLink("", destination: Details(match: matchUnwrapped), isActive: $goToDetails)
                    }
                    
                }.padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
            }.refreshable(action: {
                viewModel.getMatches()
            }).navigationTitle("Partidas")
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
