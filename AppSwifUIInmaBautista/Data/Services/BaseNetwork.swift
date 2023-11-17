//
//  BaseNetwork.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation

//MARK: - Properties

let server = "https://gateway.marvel.com/"
let content = "application/json"
let contentType = "Content-type"
let apikey = "d5d46f82e5e1ac7df0adeb18d9413912"
let ts = "1"
let hash = "236eb6b30b2e0efab2c602e51a5345af"

struct HTTPMethods {
    static let get = "GET"
    static let post = "POST"
    static let put = "PUT"
    static let delete = "DELETE"
}

enum endpoints: String {
    case characterView = "v1/public/characters"
}

//MARK: - Request
struct BaseNetwork {
    func getCharacters() -> URLRequest {
        let urlS = "\(server)\(endpoints.characterView.rawValue)?apikey=\(apikey)&ts=\(ts)&hash=\(hash)"
        var request: URLRequest = URLRequest(url: URL(string: urlS)!)
        request.httpMethod = HTTPMethods.get
        request.addValue(content, forHTTPHeaderField: contentType)
        return request
    }
}
