//
//  TimeLabel.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 03/08/23.
//

import SwiftUI
//TODO: Formatar data
struct TimeLabel: View {
    
    var match: MatchResult
    
    var body: some View {
        Text(getLabel()).font(AppFont.bold(8).font()).padding(8).background(getBackground()).cornerRadius(10, corners: [.topRight, .bottomLeft])
    }
    
    
    private func getBackground() -> Color?{
        return match.status == .running ? .red : AppColors.background.timeLabel.color
    }
    
    private func getLabel() -> String{
        return match.status == .running ? TimeLabelTexts.now.rawValue :
        scheduledDateFormatted()
    }
    
    private func scheduledDateFormatted() -> String{
        return DateFormat().formatDate(match.scheduledAt)
    }
}

