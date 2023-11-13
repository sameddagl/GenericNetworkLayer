//
//  ContentView.swift
//  GenericNetworkLayer
//
//  Created by Samed Dağlı on 13.11.2023.
//

import SwiftUI

struct ContentView: View {
    private let locationsService = AppContainer.locationsService
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .onAppear {
            locationsService.getLocations(endPoint: .getLocations(page: 1)) { result in
                print(result)
            }
        }
    }
}

#Preview {
    ContentView()
}
