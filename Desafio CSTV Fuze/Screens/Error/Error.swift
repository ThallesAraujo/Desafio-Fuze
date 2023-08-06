//
//  Error.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 05/08/23.
//

import SwiftUI

struct ErrorView: View {
    
    var viewModel: ViewModel
    
    var body: some View {
        VStack(spacing: 24){
            Spacer()
            getIcon().font(.system(size: 100))
            Text(getText())
            Spacer()
        }.padding(16)
    }
    
    private func getIcon() -> Image{
        if viewModel.isNetworkError{
            return IconConstants.error.wifi.icon
        }
        return IconConstants.error.generic.icon
    }
    
    private func getText() -> String{
        if viewModel.isNetworkError{
            return ErrorTexts.networkErrorText.rawValue
        }
        return viewModel.errorString
    }
}
