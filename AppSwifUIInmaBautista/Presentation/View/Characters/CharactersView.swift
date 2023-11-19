//
//  CharactersView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

struct CharactersView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    var body: some View {
        if #available(macOS 13.0, *) {
            NavigationStack {
                List{
                    if let characters = rootViewModel.characters{
                        ForEach(characters) { character in
                            NavigationLink {
                                //Navegation to Series
                                PrincipalSeriesView(seriesViewModel: SeriesViewModel(characterId: character.id))
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
        } else {
            // Fallback on earlier versions
        }
    }
}

struct CharactersView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersView()
            .environmentObject(RootViewModel())
    }
}
