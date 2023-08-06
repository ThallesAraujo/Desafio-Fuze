//
//  StringConstantsPortuguese.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import Foundation

let emptyString = String()

enum HomeTexts: String{
    
    case homeScreenTitle = "Partidas"
    
}

enum OpponentsViewTexts: String{
    
    case versus = "vs"
    
}

enum TimeLabelTexts: String{
    
    case now = "AGORA"
}


enum DetailsTexts: String{
    case one = "1"
    case two = "2"
}

enum NoTeamPlayersTexts{
    
    case message(String)
    
    var text: String{
        switch self {
        case .message(let teamName):
            return "Integrantes do Time \(teamName) não disponíveis na API"
        }
    }
}

enum ErrorTexts:String{
    case networkErrorText = "Ocorreu um erro de conexão. Verifique sua internet e tente novamente"
}
