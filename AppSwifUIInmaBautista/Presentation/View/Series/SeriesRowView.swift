//
//  SeriesRowView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 17/11/23.
//

import SwiftUI

struct SeriesRowView: View {
    var serie: Serie
    var body: some View {
        VStack{
            //Serie title
            Text(serie.title)
                .font(.title)
                .bold()
            
            // Image
            AsyncImage(
                url: URL(string: "\(serie.thumbnail.path).\(serie.thumbnail.extension)")) { image in
                    image
                        .resizable()
                        .cornerRadius(20)
                        .opacity(0.8)
                        .padding()
                } placeholder: {
                    Image(systemName: "photo")
                        .resizable()
                        .cornerRadius(20)
                        .foregroundColor(.gray)
                        .opacity(0.8)
                }
                .id(7)
            
            //Description or years
            Text(serie.description ?? "Inicio: \(serie.startYear) - Fin: \(serie.endYear)")
                .foregroundColor(.gray)
                .font(.callout)
                .id(8)
        }
    }
}

struct SeriesRowView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesRowView(serie: Serie(id: 1996, title: "Captain America (1968 - 1996)", description: "The Star-Spangled Avenger fights for freedom! Emerging from years on ice following World War II, Steve Rogers must adapt to a world that has gone on without him while also protecting his nation from the forces that would conspire to tear it apart!", startYear: 1968, endYear: 1996, modified: "2018-05-25T09:39:41-0400", thumbnail: Thumbnail(path: "http://i.annihil.us/u/prod/marvel/i/mg/2/50/5130f2104b29a", extension: "jpg")))
    }
}
