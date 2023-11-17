//
//  SeriesView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 17/11/23.
//

import SwiftUI

struct SeriesView: View {
//    var characterId: Int
    @StateObject var viewModel: SeriesViewModel
    var body: some View {
        NavigationStack {
            List {
                if let series = viewModel.series {
                    ForEach(series) { serie in
                        SeriesRowView(serie: serie)
                            .frame(height: 500)
                    }
                }
            }
        }
        
    
    }
}

struct SeriesView_Previews: PreviewProvider {
    static var previews: some View {
        SeriesView(viewModel: SeriesViewModel(characterId: 1009144))
    }
}

