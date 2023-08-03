//
//  Home.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = HomeViewModel()
    
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
                                            HStack{
                                                TeamView(team: match.opponents?[0])
                                                
                                                Text("vs")
                                                
                                                TeamView(team: match.opponents?[1])
                                                
                                            }
                                            
                                            
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
                                                    
                                                    Text(match.league?.name ?? "")
                                                    Text(match.serie?.name ?? "")
                                                    Spacer()
                                                    
                                                }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                                            }
                                            
                                            
                                        }.background(Color.init("background_card", bundle: .main)).cornerRadius(16)
                                        LiveLabel()
                                    }
                                }
                            }
                        }.padding(EdgeInsets(top: 24, leading: 24, bottom: 0, trailing: 24))
                    }.navigationTitle("Partidas").refreshable(action: {
                        viewModel.getMatches()
                    })
                
            
        }.onAppear(perform: {
            viewModel.getMatches()
        })
    }
}

#Preview {
    Home()
}
