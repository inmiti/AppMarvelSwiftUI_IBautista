//
//  LoaderView.swift
//  AppSwifUIInmaBautista
//
//  Created by ibautista on 16/11/23.
//

import SwiftUI

struct LoaderView: View {
    var body: some View {
        VStack{
            Image(systemName: "clock")
                .resizable()
                .frame(width: 50, height: 50)
                .padding()
            Text("Loading.....")
                .font(.title)
                .padding()
        }
    }
}

struct LoaderView_Previews: PreviewProvider {
    static var previews: some View {
        LoaderView()
    }
}
