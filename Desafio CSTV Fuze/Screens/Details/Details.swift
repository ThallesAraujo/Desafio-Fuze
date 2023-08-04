//
//  Details.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import SwiftUI

struct Details: View {
    
    var match: MatchResult
    @StateObject var viewModel = DetailsViewModel()
    
    var body: some View {
        NavigationView{
            
            ScrollView{
                
                if viewModel.isLoading{
                    ProgressView()
                }
                
                VStack{
                    OpponentsView(match: match)
                    Text(DateFormat().formatDate(match.scheduledAt)).font(.custom("Roboto-Bold", size: 12))
                    
                    
                    if let firstTeamPlayers = viewModel.firstTeam?.first?.players{
                        ForEach(firstTeamPlayers, id: \.id){player in
                            Text(player.name ?? "")
                        }
                    }
                    
                    
                }
                
                
            }.onAppear(perform: {
                viewModel.getTeams(match: match)
            }).navigationTitle("\(match.league?.name ?? "") \(match.serie?.name ?? "")").navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

#Preview {
    VStack{
        if let match = MatchesMockManager().getMatchesMock(){
            Details(match: match)
        }else{
            Text("Error")
        }
    }
}
