//
//  StatusModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation

enum Status {
    case none
    case loading
    case loaded
    case error(error: String)
}

enum StatusSeries {
    case none
    case loading
    case loaded(series:[Serie])
    case error(error: String)
}

