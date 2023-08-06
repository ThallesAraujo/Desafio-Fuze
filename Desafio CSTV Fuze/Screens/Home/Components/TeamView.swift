//
//  TeamView.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI

struct TeamView: View {
    
    var team: Opponent?
    
    var body: some View {
        VStack{
            
            if let opponent = team?.opponent{
                
                if let imageString = opponent.imageURL, let imageURL = URL(string: imageString){
                    AsyncImage(url: imageURL){image in
                        image.resizable().aspectRatio(contentMode: .fit).frame(width: 60, height: 60)
                    } placeholder: {
                        ProgressView()
                    }
                }else{
                    IconConstants.team.icon.font(.system(size: 60))
                }
                
                Text(opponent.name ?? emptyString).font(AppFont.regular(10).font())
            }
        }
    }
}
