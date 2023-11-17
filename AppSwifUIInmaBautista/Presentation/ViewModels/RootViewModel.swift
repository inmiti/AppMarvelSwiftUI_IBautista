//
//  RootViewModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation
import Combine

final class RootViewModel: ObservableObject{
    @Published var status = Status.none
    @Published var characters: [Character]?
    
    var suscriptors = Set<AnyCancellable>()
    
    init(){
        loadCharacters()
       
    }
    
    func loadCharacters() {
        status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getCharacters())
            .tryMap {
                //Evaluamos si el status code es 200
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    print("Error: \($0.response)")
                    throw URLError(.badServerResponse)
                }
                //Si todo está ok:
                return $0.data
                
            }
            .decode(type: Response.self, decoder: JSONDecoder())
            .receive(on: DispatchQueue.main)
            .sink { completion in
                //Evaluamos la respuesta:
                switch completion {
                case .finished:
                    self.status = .loaded
                case .failure(let error):
                    self.status = .error(error: "Descarga errónea")
                    print("Error: \(error)")
                }
            } receiveValue: { data in
                self.characters = data.data.results
                print("Valores recibidos: \(data)")
            }
            .store(in: &suscriptors)
    }
}

