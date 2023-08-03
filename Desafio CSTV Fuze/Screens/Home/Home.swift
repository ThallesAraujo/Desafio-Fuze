//
//  Home.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI

struct Home: View {
    
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView{
            ScrollView{
                if let matches = viewModel.matches {
                    ForEach(matches, id: \.id){match in
                        VStack{
                            HStack{
                                TeamView(team: match.opponents?[0])
                                
                                Text("vs")
                                
                                TeamView(team: match.opponents?[1])
                                
                            }
                        }
                    }
                }
            }
        }.onAppear(perform: {
            viewModel.getMatches()
        })
    }
}

#Preview {
    Home()
}
