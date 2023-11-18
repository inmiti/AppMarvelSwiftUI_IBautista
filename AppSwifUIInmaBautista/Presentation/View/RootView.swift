//
//  RootView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

struct RootView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    var body: some View {
        //Status box
        switch rootViewModel.status {
            case Status.none:
                LaunchView()
            case .loading:
                LoaderView()
            case .error(error: let error):
                ErrorView(error: error)
            case .loaded:
                CharactersView()
        }
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
            .environmentObject(RootViewModel())
    }
}
