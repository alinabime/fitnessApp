//
//  FitnessTabView.swift
//  fitnessApp
//
//  Created by alinabi on 3/29/25.
//

import SwiftUI
enum TabItemIdentifier: Hashable {
    case home
    case historical
}

struct FitnessTabView: View {
    @State var selectedTab: TabItemIdentifier = .home
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab("Home", systemImage: "house",value: TabItemIdentifier.home) {
                HomeView()
            }
            Tab("Charts", systemImage: "chart.line.uptrend.xyaxis", value: .historical) {
                HistoricDataView()
            }

        }
    }
}

#Preview {
    FitnessTabView()
}
