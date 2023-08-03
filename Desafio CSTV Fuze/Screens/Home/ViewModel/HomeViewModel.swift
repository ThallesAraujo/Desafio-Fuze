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
                let allMatches = matches.filter({$0.opponents?.count ?? 0 > 1})
                var runningMatches = allMatches.filter({$0.status == .running})
                var notRunningMatches = allMatches.filter({$0.status != .running})
                runningMatches.append(contentsOf: notRunningMatches)
                self.matches = runningMatches
            }
        }catch{
            errorProcedure()
        }
        
    }
    
}
