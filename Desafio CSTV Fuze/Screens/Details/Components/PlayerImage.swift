//
//  PlayerImage.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import SwiftUI

struct PlayerImage: View {
    
    var player: Player
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 10).fill(.gray).frame(width: 50, height: 50)
            if let playerImage = player.imageURL, let imageURL = URL(string: playerImage){
                AsyncImage(url: imageURL){image in
                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 50, height: 50).clipShape(RoundedRectangle(cornerRadius: 10))
                }placeholder: {
                    ProgressView()
                }
            }else{
                IconConstants.teamMember.icon.font(.system(size: 50))
            }
            
        }
    }
}

