//
//  CharacterRowView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

struct CharacterRowView: View {
    var character: Character
    var body: some View {
        ZStack{
            AsyncImage(url: URL(string: "\(character.thumbnail.path).\(character.thumbnail.extension)")) { image in
                image
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
            } placeholder: {
                Image(systemName: "photo")
                    .resizable()
                    .cornerRadius(20)
                    .opacity(0.8)
                    .foregroundColor(.gray)
            }
            
            VStack(alignment: .leading) {
                Spacer()
                    Text(character.name)
                        .font(.title)
                        .foregroundColor(.black)
                        .bold()
                        .padding([.bottom, .leading], 20)
   
            }
        }
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterRowView(character: Character(id: 1012717, name: "Agatha Harkness", description: "", modified: "", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/c/a0/4ce5a9bf70e19", extension: "jpg")))
                    
    }
}


                
