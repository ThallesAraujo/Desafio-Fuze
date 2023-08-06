//
//  IconConstants.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import Foundation
import SwiftUI

enum IconConstants{
    
    case exclamation
    case teamMember
    case team
    
    var icon: Image{
        switch self {
        case .exclamation:
            return Image(systemName: "exclamationmark.circle")
        case .teamMember:
            return Image(systemName: "person.fill")
        case .team:
            return Image(systemName: "checkerboard.shield")
        }
    }
    
    enum error: String{
        case generic = "multiply.square"
        case wifi = "wifi"
        
        var icon: Image{
            switch self {
            case .generic:
                return Image(systemName: "multiply.square")
            case .wifi:
                return Image(systemName: "wifi")
            }
        }
    }
    
}
