//
//  HomeViewModel.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ViewModel, ObservableObject{
    
    @Published var matches: [MatchResult]?
    
    func getMatches(){
        
        do{
            try self.perform([MatchResult].self, request: APIURLs.getMatches.request()) { matches in
                var allMatches = matches.filter({$0.opponents?.count ?? 0 > 1})
                allMatches.sort { left, right in
                    left.scheduledAt ?? Date() < right.scheduledAt ?? Date()
                }
                allMatches.sort { left, right in
                    return left.status == .running
                }
                self.matches = allMatches
                print("Matches:")
                dump(matches)
            }
        }catch{
            errorProcedure()
        }
    }
    
    
    
}


