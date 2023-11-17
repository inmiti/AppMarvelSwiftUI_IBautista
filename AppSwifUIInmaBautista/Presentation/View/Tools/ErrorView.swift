//
//  ErrorView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

struct ErrorView: View {
    @EnvironmentObject var rootViewModel: RootViewModel
    
    private var textError: String
    init(error: String) {
        self.textError = error
    }
    var body: some View {
        VStack{
            Text("Error")
            
        }
       
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Prueba de error")
            .environmentObject(RootViewModel())
    }
}
