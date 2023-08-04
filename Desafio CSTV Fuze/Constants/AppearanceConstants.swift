//
//  AppearanceConstants.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import Foundation
import UIKit

class AppTitleFonts {
    
    let largeTitleFont =  UIFont.init(name: "Roboto-Medium", size: 32.0)!
    let defaultTitleFont =  UIFont.init(name: "Roboto-Medium", size: 24.0)!
    
}

class AppDefaultColors {
    
    let standardForegroundColor = UIColor.init(named: "TitleColor")!
    
}

class AppNavigationBarTitleAttributes {
    
    let standardTitleTextAttributes: [NSAttributedString.Key: Any] = [
        .font: AppTitleFonts().defaultTitleFont
    ]
    
    let largeTitleTextAttributes: [NSAttributedString.Key: Any] = [
        .font: AppTitleFonts().largeTitleFont
    ]
    
}
