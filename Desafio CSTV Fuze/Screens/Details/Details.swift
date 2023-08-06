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
                
                if viewModel.showError{
                    ErrorView(viewModel: viewModel)
                }else{
                    VStack(spacing: 16){
                        OpponentsView(match: match).padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                        Text(DateFormat().formatDate(match.scheduledAt)).font(AppFont.bold(12).font())
                        Spacer().frame(height: 16)
                        HStack(spacing: 16){
                            if let firstTeamPlayers = viewModel.firstTeam?.players, firstTeamPlayers.count > 0{
                                VStack(alignment: .trailing, spacing: 16){
                                    ForEach(firstTeamPlayers, id: \.id){player in
                                        TeamMember(player: player, alignment: .left)
                                    }
                                    Spacer()
                                }.padding(0)
                            }else{
                                NoTeamPlayers(teamName: viewModel.firstTeam?.name ?? DetailsTexts.one.rawValue, alignment: .left)
                                Spacer()
                            }
                            
                            if let secondTeamPlayers = viewModel.secondTeam?.players, secondTeamPlayers.count > 0{
                                VStack(alignment: .leading, spacing: 16){
                                    ForEach(secondTeamPlayers, id: \.id){player in
                                        TeamMember(player: player, alignment: .right)
                                    }
                                    Spacer()
                                }
                            }else{
                                NoTeamPlayers(teamName: viewModel.secondTeam?.name ?? DetailsTexts.two.rawValue, alignment: .right)
                                Spacer()
                            }
                            
                        }
                        
                    }
                }
                
                
            }.onAppear(perform: {
                viewModel.getTeams(match: match)
            })
            
        }.navigationTitle(getNavigationTitle()).navigationBarTitleDisplayMode(.inline)
    }
    
    func getNavigationTitle() -> String{
        return "\(match.league?.name ?? emptyString) \(match.serie?.name ?? emptyString)"
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
