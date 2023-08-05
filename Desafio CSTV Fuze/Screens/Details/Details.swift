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
                
                VStack(spacing: 16){
                    OpponentsView(match: match).padding(EdgeInsets(top: 16, leading: 0, bottom: 16, trailing: 0))
                    Text(DateFormat().formatDate(match.scheduledAt)).font(.custom("Roboto-Bold", size: 12))
                    Spacer().frame(height: 16)
                    HStack(spacing: 16){
                        if let firstTeamPlayers = viewModel.firstTeam?.players, firstTeamPlayers.count > 0{
                            VStack(alignment: .trailing, spacing: 16){
                                ForEach(firstTeamPlayers, id: \.id){player in
                                    ZStack{
                                        
                                        VStack{
                                            HStack(alignment: .bottom){
                                                Spacer()
                                                VStack(alignment: .trailing){
                                                    
                                                    Text(player.name ?? "").font(.custom("Roboto-Bold", size: 14))
                                                    Text("\(player.firstName ?? "") \(player.lastName ?? "")").font(.custom("Roboto-Regular", size: 12)).foregroundStyle(Color("secondary_text"))
                                                }
                                                
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 10).fill(.gray).frame(width: 50, height: 50)
                                                    if let playerImage = player.imageURL, let imageURL = URL(string: playerImage){
                                                        AsyncImage(url: imageURL){image in
                                                            image.resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }placeholder: {
                                                            ProgressView()
                                                        }
                                                    }else{
                                                        Image(systemName: "person.fill").font(.system(size: 50))
                                                    }
                                                    
                                                }
                                                
                                            }.offset(x: -8, y: -12)
                                        }.padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8)).background(Color("background_card").cornerRadius(12, corners: [.topRight, .bottomRight]).frame(minHeight: 54))
                                        
                                        
                                    }
                                }
                                Spacer()
                            }.padding(0)
                        }else{
                            Text("Integrantes do Time \(viewModel.firstTeam?.name ?? "1") não disponíveis na API").font(.custom("Roboto-Regular", size: 12)).foregroundStyle(Color("secondary_text")).multilineTextAlignment(.trailing).padding(16)
                        }
                        
                        if let secondTeamPlayers = viewModel.secondTeam?.players, secondTeamPlayers.count > 0{
                            VStack(alignment: .leading, spacing: 16){
                                ForEach(secondTeamPlayers, id: \.id){player in
                                    ZStack{
                                        
                                        
                                        VStack(alignment: .leading){
                                            
                                            HStack(alignment: .bottom){
                                                
                                                ZStack{
                                                    RoundedRectangle(cornerRadius: 10).fill(.gray).frame(width: 50, height: 50)
                                                    if let playerImage = player.imageURL, let imageURL = URL(string:  playerImage){
                                                        AsyncImage(url: imageURL){image in
                                                            image.resizable().aspectRatio(contentMode: .fill).frame(width: 50, height: 50).clipShape(RoundedRectangle(cornerRadius: 10))
                                                        }placeholder: {
                                                            ProgressView()
                                                        }
                                                    }else{
                                                        Image(systemName: "person.fill").font(.system(size: 50))
                                                    }
                                                    
                                                }
                                                
                                                VStack(alignment: .leading){
                                                    
                                                    Text(player.name ?? "").font(.custom("Roboto-Bold", size: 14))
                                                    Text("\(player.firstName ?? "") \(player.lastName ?? "")").font(.custom("Roboto-Regular", size: 12)).foregroundStyle(Color("secondary_text"))
                                                }
                                                
                                                Spacer()
                                                
                                            }.offset(x: 16, y: -12)
                                        }.padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8)).background(Color("background_card").cornerRadius(12, corners: [.topLeft, .bottomLeft]).frame(minHeight: 54))
                                        
                                        
                                    }
                                }
                                Spacer()
                            }.edgesIgnoringSafeArea([.trailing])
                        }else{
                            Text("Integrantes do Time \(viewModel.secondTeam?.name ?? "2") não disponíveis na API").font(.custom("Roboto-Regular", size: 12)).foregroundStyle(Color("secondary_text")).multilineTextAlignment(.leading).padding(16)
                        }
                        
                    }
                    
                }
                
                
            }.onAppear(perform: {
                viewModel.getTeams(match: match)
            })
            
        }.navigationTitle("\(match.league?.name ?? "") \(match.serie?.name ?? "")").navigationBarTitleDisplayMode(.inline)
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
