//
//  CharacterViewModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    @Published var series: [Serie]?
    @Published var status = Status.none
    var suscriptors = Set<AnyCancellable>()
    
    init(characterId: Int) {
        
        loadSeries(characterId: characterId)
    }
    
    func loadSeries(characterId: Int){
        self.status = .loading
        
        URLSession.shared
            .dataTaskPublisher(for: BaseNetwork().getSeries(characterId: characterId))
            .receive(on: DispatchQueue.main)
            .tryMap {
                //Evaluamos si el status code es 200
                guard let response = $0.response as? HTTPURLResponse,
                      response.statusCode == 200 else {
                    print("Error: \($0.response)")
                    self.status = .error(error: "El servidor no responde")
                    throw URLError(.badServerResponse)
                }
                //Si todo está ok:
                return $0.data
                
            }
            .decode(type: Response<Serie>.self, decoder: JSONDecoder())
//            .receive(on: DispatchQueue.main)
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
                self.series = data.data.results
                print("Valores recibidos: \(data)")
            }
            .store(in: &suscriptors)
        
        
    }
    
}
