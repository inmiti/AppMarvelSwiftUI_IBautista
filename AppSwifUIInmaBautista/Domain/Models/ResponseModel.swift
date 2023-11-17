//
//  ResponseModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 17/11/23.
//

import Foundation


// MARK: - Welcome
struct Response<T:Codable>: Codable {
    let data: DataClass<T>
}

// MARK: - DataClass
struct DataClass<T:Codable>: Codable {
    let results: [T]
}
