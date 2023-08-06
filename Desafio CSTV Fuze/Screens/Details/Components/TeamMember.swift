//
//  TeamMember.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import SwiftUI

struct TeamMember: View {
    
    var player: Player
    var alignment: TeamPlayersAlignment
    
    var body: some View {
        ZStack{
            
            VStack{
                
                HStack(alignment: .bottom) {
                    if alignment == .left{
                        Spacer()
                        PlayerName(alignment: getHorizontalAlignment(), player: player)
                        PlayerImage(player: player)
                    }else{
                        PlayerImage(player: player)
                        PlayerName(alignment: getHorizontalAlignment(), player: player)
                        Spacer()
                    }
                    
                }.padding(getEdgeInsets()).offset(x: getOffsetX(), y: getOffsetY())
                
            }.padding(EdgeInsets(top: 4, leading: 0, bottom: 4, trailing: 8)).background(AppColors.background.card.color.cornerRadius(12, corners: getCorners()).frame(minHeight: 54))
            
        }
    }
    
    private func getCorners() -> UIRectCorner{
        return alignment == .left ?
        [.topRight, .bottomRight]
        : [.topLeft, .bottomLeft]
    }
    
    private func getHorizontalAlignment() -> HorizontalAlignment{
        return alignment == .left ? .trailing : .leading
    }
    
    private func getOffsetX() -> CGFloat{
        return alignment == .left ? -8 : 16
    }
    
    private func getOffsetY() -> CGFloat{
        return -12
    }
    
    private func getEdgeInsets() -> EdgeInsets{
        return alignment == .left ?
        EdgeInsets(top: 0, leading: 16, bottom: 0, trailing: 0) :
        EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 16)
    }
}


