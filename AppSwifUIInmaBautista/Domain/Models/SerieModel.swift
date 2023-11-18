//
//  SerieModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 17/11/23.
//

import Foundation

// MARK: - Result series
struct Serie: Codable, Identifiable {
    let id: Int
    let title: String
    let description: String?
    let startYear, endYear: Int
    let modified: String
    let thumbnail: Thumbnail
}

