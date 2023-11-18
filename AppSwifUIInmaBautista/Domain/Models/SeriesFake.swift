//
//  SeriesFake.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 17/11/23.
//

import Foundation

struct SeriesFake {
    let responseSeries : Response = Response(data: DataClass(results:[
        Serie(
            id: 1996,
            title: "Captain America (1968 - 1996)",
            description: "The Star-Spangled Avenger fights for freedom! Emerging from years on ice following World War II, Steve Rogers must adapt to a world that has gone on without him while also protecting his nation from the forces that would conspire to tear it apart!",
            startYear: 1968,
            endYear: 1996,
            modified: "2018-05-25T09:39:41-0400",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/2/50/5130f2104b29a",
                extension: "jpg")),
        Serie(
            id: 1945,
            title: "Avengers: The Initiative (2007 - 2010)",
            description: nil,
            startYear: 2007,
            endYear: 2010,
            modified: "2013-03-20T17:51:27-0400",
            thumbnail: Thumbnail(
                path: "http://i.annihil.us/u/prod/marvel/i/mg/5/a0/514a2ed3302f5",
                extension: "jpg"))
        ]))
}


                       
           
