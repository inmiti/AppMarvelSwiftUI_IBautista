//
//  LoaderView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

struct LoaderView: View {
    @State private var isAnimating = false
    
    var body: some View {
        VStack{
            //Animation
            Image(systemName: "circle.grid.cross.right.filled")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
                .rotationEffect(.degrees( isAnimating ? 360 : 0))
                .animation(Animation.linear(duration: 0.5).repeatForever(autoreverses: false), value: isAnimating)
                .onAppear(){
                    self.isAnimating = true
                }
                .id(3)
            
            //Loading text
            Text("Loading.....")
                .font(.title)
                .padding()
                .id(4)
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
