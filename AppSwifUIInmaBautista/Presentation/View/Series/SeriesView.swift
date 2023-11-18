//
//  SeriesView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 17/11/23.
//

import SwiftUI

struct SeriesView: View {
    @State var series: [Serie]
    var body: some View {
        NavigationStack {
            List {
//                if let series = viewModel.series {
                ForEach(series) { serie in
                    SeriesRowView(serie: serie)
                        .frame(height: 500)
                }
            }
        }
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(series: [Serie(
            id: 1996,
            title: "Captain America (1968 - 1996)",
            description: "The Star-Spangled Avenger fights for freedom! Emerging from years on ice following World War II, Steve Rogers must adapt to a world that has gone on without him while also protecting his nation from the forces that would conspire to tear it apart!",
            startYear: 1968,
            endYear: 1996,
            modified: "2018-05-25T09:39:41-0400",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/2/50/5130f2104b29a",
                extension: "jpg"))])
//            viewModel: SeriesViewModel(characterId: 1009144))
    }
}

