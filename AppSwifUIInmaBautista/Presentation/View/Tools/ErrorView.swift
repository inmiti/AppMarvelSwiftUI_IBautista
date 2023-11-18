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
            
            // Warning image
            Image(systemName: "exclamationmark.triangle")
                .resizable()
                .foregroundColor(.red)
                .frame(width: 100, height: 100)
                .padding()
                .shadow(radius: 10, x: 20, y: 10)
                .id(0)
            
            // Error message
            Text("Error: \(textError)")
                .font(.title)
                .foregroundColor(.red)
                .bold()
                .padding()
                .shadow(radius: 10, x: 20, y: 10)
                .id(1)
            
            // Return button
            Button {
                //Action: 
                rootViewModel.status = .loading
            } label: {
                Text("Volver")
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 250, height: 50)
                    .background(.gray)
                    .cornerRadius(20)
                    .shadow(radius: 10, x: 20, y: 10)
            }
            .padding([.top], 100)
            .id(2)
        
        }
    }
}

struct ErrorView_Previews: PreviewProvider {
    static var previews: some View {
        ErrorView(error: "Prueba de error")
            .environmentObject(RootViewModel())
    }
}
