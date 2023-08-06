//
//  NoTeamPlayers.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import SwiftUI

enum TeamPlayersAlignment{
    case left
    case right
}

struct NoTeamPlayers: View {
    
    var teamName: String
    var alignment: TeamPlayersAlignment
    
    var body: some View {
        VStack(alignment: getViewAlignment(), spacing: 16){
            IconConstants.exclamation.icon.font(.system(size: 60)).foregroundStyle(AppColors.foreground.secondary.color)
            Text(NoTeamPlayersTexts.message(teamName).text).font(AppFont.regular(12).font()).foregroundStyle(AppColors.foreground.secondary.color).multilineTextAlignment(getTextAlignment())
        }.padding(16)
    }
    
    private func getTextAlignment() -> TextAlignment{
        return alignment == .left ? .trailing : .leading
    }
    
    private func getViewAlignment() -> HorizontalAlignment{
        return alignment == .left ? .trailing : .leading
    }
}

#Preview {
    NoTeamPlayers(teamName: "TestTeam", alignment: .left)
}
