//
//  RootViewModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject{
    //Publishers
    @Published var status = Status.none
    @Published var characters: [Character]?
    
    //Properties
    var suscriptors = Set<AnyCancellable>()
    var characterCaseUse: CharacterUseCaseProtocol
    
    //Initializer
    init(characterCaseUse: CharacterUseCaseProtocol = CharactersUseCase()){
        self.characterCaseUse = characterCaseUse
        loadCharacters()
    }
    
    // Load characters function
    func loadCharacters() {
        status = .loading
        characterCaseUse.getCharacters()
            .sink { completion in
                switch completion {
                    case .finished:
                    self.status = .loaded
                    case .failure(let error):
                        self.status = .error(error: "La descarga de personajes ha fallado")
                        print("Error: \(error)")
                    }
            } receiveValue: { [weak self] data in
                self?.characters = data.data.results
                self?.status = .loaded
            }
            .store(in: &suscriptors)
    }
}

