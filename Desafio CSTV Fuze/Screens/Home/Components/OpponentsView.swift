//
//  OpponentsView.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import SwiftUI

struct OpponentsView: View {
    
    var match: MatchResult
    
    var body: some View {
        HStack{
            TeamView(team: match.opponents?[0])
            
            Text(OpponentsViewTexts.versus.rawValue).font(AppFont.regular(12).font()).foregroundStyle(AppColors.foreground.secondary.color)
            
            TeamView(team: match.opponents?[1])
            
        }.padding(12)
    }
}
