//
//  CharacterModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation

// MARK: - Welcome
struct Response: Codable {
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let results: [Character]
}

// MARK: - Result
struct Character: Codable, Identifiable {
    let id: Int
    let name, description: String
    let modified: String
    let thumbnail: Thumbnail
}

// MARK: - Thumbnail
struct Thumbnail: Codable {
    let path: String
    let `extension`: String
}

