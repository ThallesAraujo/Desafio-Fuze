//
//  LiveLabel.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI

struct LiveLabel: View {
    
    var text: String
    
    var body: some View {
        Text(text).padding(8).background(.red).cornerRadius(10, corners: [.topRight, .bottomLeft])
    }
}

