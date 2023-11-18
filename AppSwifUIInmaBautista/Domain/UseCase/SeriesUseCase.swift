//
//  SeriesUseCase.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 18/11/23.
//

import Foundation
import Combine

protocol SeriesUseCaseProtocol: AnyObject {
    func getSeries(characterId: Int) -> AnyPublisher<Response<Serie>, Error>
}
// MARK: - Real Case
final class SeriesUseCase: SeriesUseCaseProtocol  {
    let networker: NetworkerProtocol
    let baseNetwork: BaseNetwork
    
    init(network: NetworkerProtocol = Networker(),
         baseNetwork: BaseNetwork = BaseNetwork()){
        self.networker = network
        self.baseNetwork = baseNetwork
    }
    
    func getSeries(characterId: Int) -> AnyPublisher<Response<Serie>, Error> {
        return networker.callServer(type: Response<Serie>.self, request: baseNetwork.getSeries(characterId: characterId))
    }
}

// MARK: - For Testing/ UI Use case of characters
final class SeriesUseCaseFakeSuccess: SeriesUseCaseProtocol {
    func getSeries(characterId: Int) -> AnyPublisher<Response<Serie>, Error> {
        let data: Response = SeriesFake().responseSeries
        let publisher = CurrentValueSubject<Response<Serie>,Error>(data)
        return publisher.eraseToAnyPublisher()
    }
}

//MARK: - For testing: Case use failure
/*
 final class SeriesUseCaseFakeError: SeriesUseCaseProtocol {
 func getSeries(characterId: Int) -> AnyPublisher<Response<Serie>, Error> {
 let error = FakeError.fakeError(description: "This is a fake error for testing purposes.")
 let data = Response<Serie>(data: DataClass<Serie>(results: []))
 let publisher = CurrentValueSubject<Response<Serie>,Error>(data)
 return publisher.eraseToAnyPublisher()
 }
 }
 */
