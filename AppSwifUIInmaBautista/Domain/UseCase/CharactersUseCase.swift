//
//  CharactersUseCase.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 18/11/23.
//

import Foundation
import Combine

//MARK: - Protocol
protocol CharacterUseCaseProtocol: AnyObject {
    func getCharacters() -> AnyPublisher<Response<Character>, Error>
}
// MARK: - Real Case
final class CharactersUseCase: CharacterUseCaseProtocol  {
    let networker: NetworkerProtocol
    let baseNetwork: BaseNetwork
    
    init(network: NetworkerProtocol = Networker(),
         baseNetwork: BaseNetwork = BaseNetwork()){
        self.networker = network
        self.baseNetwork = baseNetwork
    }
    
    func getCharacters() -> AnyPublisher<Response<Character>, Error> {
        return networker.callServer(type: Response<Character>.self, request: baseNetwork.getCharacters())
    }
}

// MARK: - For Testing/ UI Use case of characters
final class CharactersUseCaseFakeSuccess: CharacterUseCaseProtocol {
    func getCharacters() -> AnyPublisher<Response<Character>, Error> {
        let data: Response = CharacterFake().responseCharacters
        let publisher = CurrentValueSubject<Response<Character>,Error>(data)
        return publisher.eraseToAnyPublisher()
    }
}

//MARK: - For testing: Case use failure
/*
final class CharactersUseCaseFakeError: CharacterUseCaseProtocol {
    func getCharacters() -> AnyPublisher<Response<Character>, Error> {
        let error = FakeError.fakeError(description: "This is a fake error for testing purposes.")
        let data = Response<Character>(data: DataClass<Character>(results: []))
        let publisher = CurrentValueSubject<Response<Character>,Error>(data)
        return publisher.eraseToAnyPublisher()
    }
}
*/
