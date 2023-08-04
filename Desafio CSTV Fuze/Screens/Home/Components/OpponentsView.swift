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
            
            Text("vs").font(.custom("Roboto-Regular",size: 12)).foregroundStyle(Color.init("secondary_text", bundle: .main))
            
            TeamView(team: match.opponents?[1])
            
        }.padding(12)
    }
}
