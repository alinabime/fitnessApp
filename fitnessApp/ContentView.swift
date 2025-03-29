//
//  ContentView.swift
//  fitnessApp
//
//  Created by alinabi on 3/29/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "heart")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(",!")
        }
    }
}

#Preview {
    ContentView()
}
