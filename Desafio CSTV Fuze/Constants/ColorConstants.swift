//
//  ColorConstants.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import Foundation
import SwiftUI
enum AppColors{
    
    enum background{
        
        case timeLabel
        case card
        
        var color: Color{
            switch self {
            case .timeLabel:
                return Color("time_label_default_background")
            case .card:
                return Color("background_card")
            }
        }
    }
    
    enum foreground{
        case secondary
        
        var color: Color{
            switch self {
            case .secondary:
                return Color("secondary_text")
            }
        }
    }
    
    
}
