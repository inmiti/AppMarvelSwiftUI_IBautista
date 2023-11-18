//
//  CharacterViewModel.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import Foundation
import Combine

final class SeriesViewModel: ObservableObject {
    //Publishers
    @Published var series: [Serie]?
    @Published var statusView = StatusSeries.none
    
    //Propertiers
    var suscriptors = Set<AnyCancellable>()
    var seriesCaseUse: SeriesUseCaseProtocol
    
    //Initializer
    init(characterId: Int = 0, seriesCaseUse: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.seriesCaseUse = seriesCaseUse

        loadSeries(characterId: characterId)
    }
    
    //Load series function
    func loadSeries(characterId: Int){
        self.statusView = .loading
        seriesCaseUse.getSeries(characterId: characterId)
            .sink { completion in
                //Evaluamos la respuesta:
                switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self.statusView = .error(error: "La descarga de series ha fallado")
                        print("Error Series: \(error)")
                }
            } receiveValue: { [weak self] data in
                self?.series = data.data.results
                self?.statusView = .loaded(series: self?.series ?? [])
            }
            .store(in: &suscriptors)
    }
}
