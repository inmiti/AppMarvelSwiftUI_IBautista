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
    var seriesCaseUse: SeriesUseCaseProtocol
    
    init(characterId: Int, seriesCaseUse: SeriesUseCaseProtocol = SeriesUseCase()) {
        self.seriesCaseUse = seriesCaseUse
        loadSeries(characterId: characterId)
    }
    
    func loadSeries(characterId: Int){
        self.status = .loading
        seriesCaseUse.getSeries(characterId: characterId)
            .sink { completion in
                //Evaluamos la respuesta:
                switch completion {
                    case .finished:
                        self.status = .loaded
                    case .failure(let error):
                        self.status = .error(error: "La descarga de series ha fallado")
                        print("Error 22: \(error)")
                }
            } receiveValue: { data in
                self.series = data.data.results
            }
            .store(in: &suscriptors)
    }
}
