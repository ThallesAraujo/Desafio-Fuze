//
//  Card.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import SwiftUI

struct Card: View {
    
    var match: MatchResult
    
    var body: some View {
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
                        
                        Text(match.league?.name ?? emptyString).font(AppFont.regular(8).font())
                        Text(match.serie?.name ?? emptyString).font(AppFont.regular(8).font())
                        Spacer()
                        
                        
                    }.padding(EdgeInsets(top: 8, leading: 16, bottom: 8, trailing: 16))
                }
                
                
            }.background(AppColors.background.card.color).cornerRadius(16)
            TimeLabel(match: match)
        }
    }
}
