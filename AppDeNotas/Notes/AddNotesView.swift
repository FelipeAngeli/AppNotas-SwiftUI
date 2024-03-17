//
//  AddNotesView.swift
//  AppDeNotas
//
//  Created by Felipe Angeli on 15/03/24.
//

import SwiftUI

struct AddNotesView: View {
    
    @Bindable var viewModel: NoteViewModel
    @State var note = Note()
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Form {
            Section {
                TextField("Informe o Título", text: $note.title)
            } header: {
            Text("Título")
            }
            
            Section {
                TextEditor(text: $note.content)
            } header: {
            Text("Conteúdo")
            }
            
            Section {
                Button("Salvar") {
                    viewModel.note.append(note)
                    dismiss()
                }
            }
        }
    }
}

#Preview {
    let viewModel = NoteViewModel()
    return AddNotesView(viewModel: viewModel)
}
