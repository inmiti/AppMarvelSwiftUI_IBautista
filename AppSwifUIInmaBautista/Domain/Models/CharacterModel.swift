//
//  CharacterModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation

// MARK: - Result characters
struct Character: Codable, Identifiable {
    let id: Int
    let name: String
    let description: String?
    let modified: String
    let thumbnail: Thumbnail
}



