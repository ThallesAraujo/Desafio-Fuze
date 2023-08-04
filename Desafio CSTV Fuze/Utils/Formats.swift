//
//  Formats.swift
//  Desafio CSTV Fuze
//
//  Created by Thalles Araújo on 04/08/23.
//

import Foundation
class DateFormat{
    
    func formatDate(_ date: Date?) -> String{
        let formatter = DateFormatter()
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.doesRelativeDateFormatting = true
        formatter.locale = Locale.init(identifier: Locale.preferredLanguages[0])
        return formatter.string(from: date ?? Date())
    }
    
}
