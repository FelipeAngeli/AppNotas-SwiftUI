//
//  Note.swift
//  AppDeNotas
//
//  Created by Felipe Angeli on 14/03/24.
//

import Foundation

struct Note: Identifiable, Equatable, Codable {
    var id: UUID = UUID()
    var title: String = ""
    var content: String = ""
    
    static func == (lhs: Note, rhs: Note) -> Bool {
        return lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.content == rhs.content
    }
    
}
