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
                LoaderView()
            case .loading:
                LoaderView()
            case .error:
                ErrorView()
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
