//
//  Networker.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation
import Combine

//Llamada de red con genéricos y combine:
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
                    print("Error: \($0.response)")
                    throw URLError(.badServerResponse)
                }
                return $0.data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
        
}
    
}
