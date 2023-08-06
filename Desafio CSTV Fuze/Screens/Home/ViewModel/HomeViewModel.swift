//
//  HomeViewModel.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import Foundation
import SwiftUI

class HomeViewModel: ViewModel, ObservableObject{
    
    @Published var matches: MatchResults?
    
    func getMatches(page: Int = 1){
        
        do{
            try self.perform(MatchResults.self, request: APIURLs.getMatches(page).request()) { matches in
                if page == 1{
                    self.matches = self.sortMatches(matches)
                }else{
                    self.matches?.append(contentsOf: self.removeMatchesWithoutOpponents(matches))
                }
            }
        }catch{
            errorProcedure()
        }
        
    }
    
    private func sortMatches(_ matches: MatchResults) -> MatchResults{
        
        var allMatches = removeMatchesWithoutOpponents(matches)
        
        allMatches.sort { left, right in
            left.scheduledAt ?? Date() < right.scheduledAt ?? Date()
        }
        allMatches.sort { left, right in
            return left.status == .running
        }
        
        return allMatches
        
    }
    
    private func removeMatchesWithoutOpponents(_ matches: MatchResults) -> MatchResults{
        var allMatches = matches.filter({$0.opponents?.count ?? 0 > 1}).filter({match in
            if let schedule = match.scheduledAt, let days = Calendar.current.dateComponents([.day], from: .now, to: schedule).day{
                return days >= 0
            }
            return true
        })
        return allMatches
    }
    
    
    
}


