//
//  StatusModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation

//MARK: - Status box characters
enum Status {
    case none
    case loading
    case loaded
    case error(error: String)
}

//MARK: - Status box series
enum StatusSeries {
    case none
    case loading
    case loaded(series:[Serie])
    case error(error: String)
}

