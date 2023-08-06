//
//  FontConstants.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import Foundation
import SwiftUI

enum AppFont{
    
    case regular(CGFloat)
    case bold(CGFloat)
    
    func font() -> Font{
        switch self {
        case .regular(let size):
            return .custom("Roboto-Regular", size: size)
        case .bold(let size):
            return .custom("Roboto-Bold", size: size)
        }
    }
    
}

enum FontNames: String{
    case medium = "Roboto-Medium"
}
