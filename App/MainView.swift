//
//  MainView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationView {
            SamplePostsView()
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
