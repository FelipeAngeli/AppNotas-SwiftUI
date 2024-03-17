//
//  NoteViewModel.swift
//  AppDeNotas
//
//  Created by Felipe Angeli on 14/03/24.
//

import Foundation

@Observable
class NoteViewModel {
    
    //observa se tem mudança
     var note: [Note] = [] {
        didSet {
            saveNotes() // salva as alteraçoes
        }
    }
    
    
    //aqui pega as alterações
    init() {
        guard let data = UserDefaults.standard.data(forKey: "notes") else {return}
        if let getNotes = try? JSONDecoder().decode([Note].self, from: data) {
            self.note = getNotes
        }
    }
    //aqui salva as alterações
    func saveNotes() {
        if let encoded = try? JSONEncoder().encode(note) {
            UserDefaults.standard.setValue(encoded, forKey: "notes")
        }
    }
}


