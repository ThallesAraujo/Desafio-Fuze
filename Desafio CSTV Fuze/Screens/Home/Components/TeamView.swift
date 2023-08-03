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
                        image.resizable().aspectRatio(contentMode: .fit).frame(maxWidth: 60, maxHeight: 60)
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text(opponent.name ?? "")
            }
        }
    }
}
