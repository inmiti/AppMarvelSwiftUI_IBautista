//
//  PrincipalSeriesView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 18/11/23.
//

import SwiftUI

struct PrincipalSeriesView: View {
    @StateObject var seriesViewModel: SeriesViewModel
    
    var body: some View {
        //Status box
        switch seriesViewModel.statusView {
            case .none:
                LaunchView()
            case .loading:
                LoaderView()
            case .error(error: let error):
                ErrorView(error: error)
            case .loaded(series: let series):
                SeriesView(series: series)
        }
    }
}

struct PrincipalSeriesView_Previews: PreviewProvider {
    static var previews: some View {
        PrincipalSeriesView(seriesViewModel: SeriesViewModel(characterId: 1011334))
    }
}
