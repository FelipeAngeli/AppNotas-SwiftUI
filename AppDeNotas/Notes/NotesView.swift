//
//  NotesView.swift
//  AppDeNotas
//
//  Created by Felipe Angeli on 13/03/24.
//

import SwiftUI

struct NotesView: View {

  @State var viewModel = NoteViewModel()
    @State var isGoAdditioNote: Bool = false


    var body: some View {
        List($viewModel.note, editActions: .all) { $note in
            NavigationLink {
                NotesDetailView(note: $note)
            } label: {
                HStack{
                    Image(systemName: "pencil")
                        .frame(width: 24, height: 24)
                        .padding(.trailing, 8)
                    VStack(alignment: .leading){
                        Text(note.title)
                            .font(.headline)
                        Text(note.content)
                            .font(.subheadline)
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
        .navigationTitle("Notas")
        .toolbar{
            ToolbarItem(placement:
                    .topBarTrailing) {
                        Button("Adicionar"){
                            isGoAdditioNote.toggle()
                        }
                    }
        }
        .sheet(isPresented: $isGoAdditioNote, content: {
            AddNotesView(viewModel: viewModel)
        })
    }
}

#Preview {
    NavigationStack {
        NotesView()
    }
}
