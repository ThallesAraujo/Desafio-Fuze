//
//  TimeLabel.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI
//TODO: Formatar data
struct TimeLabel: View {
    
    var match: MatchResult
    
    var body: some View {
        Text(getLabel() ?? "").padding(8).background(getBackground()).cornerRadius(10, corners: [.topRight, .bottomLeft])
    }
    
    
    private func getBackground() -> Color?{
        return match.status == .running ? .red : Color("time_label_default_background")
    }
    
    private func getLabel() -> String?{
        
        return match.status == .running ? "Agora" :
        match.scheduledAt?.ISO8601Format()
        
    }
}

