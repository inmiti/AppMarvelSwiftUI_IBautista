//
//  Networker.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation
import Combine

//MARK: - API call
protocol NetworkerProtocol: AnyObject {
    func callServer<T>(type: T.Type, request:URLRequest) -> AnyPublisher<T, Error>
    where T:Decodable
}

final class Networker: NetworkerProtocol {
    func callServer<T>(type: T.Type, request: URLRequest) -> AnyPublisher<T, Error> where T:Decodable {
        URLSession.shared
            .dataTaskPublisher(for: request)
            .receive(on: DispatchQueue.main)
            .tryMap {
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    print("Error aqui: \($0.response)")
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
