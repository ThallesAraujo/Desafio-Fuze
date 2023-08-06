//
//  PlayerName.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import SwiftUI

struct PlayerName: View {
    
    var alignment: HorizontalAlignment
    var player: Player
    
    var body: some View {
        VStack(alignment: alignment){
            Text(player.name ?? emptyString).font(AppFont.bold(14).font())
            Text(getPlayerName()).font(AppFont.regular(12).font()).foregroundStyle(AppColors.foreground.secondary.color)
        }
    }
    
    private func getPlayerName() -> String{
        return "\(player.firstName ?? emptyString) \(player.lastName ?? emptyString)"
    }
}
