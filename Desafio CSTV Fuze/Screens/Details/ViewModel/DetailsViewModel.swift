//
//  DetailsViewModel.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import Foundation
import SwiftUI

class DetailsViewModel: ViewModel, ObservableObject{
    
    @Published var firstTeam: TeamResults?
    @Published var secondTeam: TeamResults?
    
    func getTeams(match: MatchResult?){
        
        if let matchUnrapped = match{
            
            if let firstOpponentId = match?.opponents?[0].opponent?.id{
                getTeam(id: firstOpponentId) { team in
                    self.firstTeam = team
                }
            }
            
            if let secondOpponentId = match?.opponents?[1].opponent?.id{
                getTeam(id: secondOpponentId) { team in
                    self.secondTeam = team
                }
            }
        }
        
    }
    
    private func getTeam(id: Int, completion: @escaping(TeamResults?) -> Void){
        do{
            try self.perform(TeamResults.self, request: APIURLs.getTeam(id).request()) { team in
                print("Team:")
                dump(team)
                completion(team)
            }
        }catch{
            errorProcedure()
        }
        
    }
    
    
}
