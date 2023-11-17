//
//  CharactersView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    @State private var filter: String = ""
//    @StateObject var viewModel: RootViewModel
    var body: some View {
        NavigationStack {
            List{
                if let characters = rootViewModel.characters{
                    ForEach(characters) { character in
                        NavigationLink {
                            //Destino
                        } label: {
                            //Celda personalizada
                            CharacterRowView(character: character)
                                .frame(height: 200)
                        }
                    }
                }
            }
            .navigationTitle("Personajes")
        }
//        .searchable(text: $filter,
//                    placement: .automatic,
//                    prompt: "Buscar personajes...")
              
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
            .environmentObject(RootViewModel())
    }
}
