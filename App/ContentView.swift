//
//  ContentView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI

struct ContentView: View {
    @State private var onboarded: Bool = UserDefaults.standard.bool(forKey: Constants.userDefaults.didWalkThroughKey)

    var body: some View {
        ZStack {
            if !onboarded {
                PageView([WalkThroughContainerView(page: .one), WalkThroughContainerView(page: .two)], finished: $onboarded)
                    .edgesIgnoringSafeArea(.all)
            } else {
                MainView()
                    .environmentObject(SamplePostService())
                    // NOTE: Add services here
            }
        }
        .transition(.slide)
        .animation(.easeInOut)
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
