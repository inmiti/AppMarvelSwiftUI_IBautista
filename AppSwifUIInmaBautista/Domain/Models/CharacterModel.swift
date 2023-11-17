//
//  CharacterModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
//    let code: Int
//    let status, copyright, attributionText, attributionHTML: String
//    let etag: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
//    let offset, limit, total, count: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable, Identifiable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: Thumbnail
//    let resourceURI: String
//    let comics: Comics
//    let series: Comics
//    let stories: Stories
//    let events: Comics
//    let urls: [URLElement]
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}

// MARK: - Comics
//struct Comics: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [SeriesItem]
//    let returned: Int
//}

// MARK: - SeriesItem
//struct SeriesItem: Codable {
//    let resourceURI: String
//    let name: String
//}

// MARK: - Stories
//struct Stories: Codable {
//    let available: Int
//    let collectionURI: String
//    let items: [StoriesItem]
//    let returned: Int
//}

// MARK: - StoriesItem
//struct StoriesItem: Codable {
//    let resourceURI: String
//    let name: String
//    let type: ItemType
//}

//enum ItemType: String, Codable {
//    case cover = "cover"
//    case empty = ""
//    case interiorStory = "interiorStory"
//}



//enum Extension: String, Codable {
//    case jpg = "jpg"
//}
//
//// MARK: - URLElement
//struct URLElement: Codable {
//    let type: URLType
//    let url: String
//}
//
//enum URLType: String, Codable {
//    case comiclink = "comiclink"
//    case detail = "detail"
//    case wiki = "wiki"
//}
