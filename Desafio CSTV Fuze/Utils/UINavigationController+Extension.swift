//
//  UINavigationController+Extension.swift
//  Oppulence
//
//  Created by Thalles Araújo on 26/11/22.
//
// Remove texto "Back" do botão voltar

import Foundation
import UIKit

extension UINavigationController {
    
    open override func viewWillLayoutSubviews () {
        navigationBar.topItem?.backButtonDisplayMode = .minimal
    }
}
