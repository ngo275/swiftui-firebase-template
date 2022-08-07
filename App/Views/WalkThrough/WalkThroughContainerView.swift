//
//  WalkThroughContainerView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import Foundation


import SwiftUI

// NOTE: Please edit this file when to customize walk through.
struct WalkThroughContainerView: View {
    enum Page {
        case one, two
    }
    
    var page: Page
    
    var body: some View {
        switch page {
        case .one:
            WalkThroughOne()
        case .two:
            WalkThroughTwo()
        }
    }
}


struct WalkThroughOne: View {
    var body: some View {
        GeometryReader { geometory in
            ZStack {
                VStack {
                    Color.appPrimary.frame(width: geometory.size.width, height: geometory.size.height * 0.6).ignoresSafeArea()
                    Spacer()
                }

                VStack(spacing: 0) {
                    Spacer(minLength: 20)
                    Image("wt_image1")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometory.size.width * 0.6)
                        .shadowedStyle()
                    
                    Spacer(minLength: 8)
                    Text("WTTitle1")
                        .style(.title)
                        .padding(16)
                    
                    Text("WTDesc11")
                        .style(.headline)
                        .padding(2)
                    Text("WTDesc12")
                        .style(.headline)
                        .padding(2)
                    
                    Spacer(minLength: 88)
                }
            }
        }
        
    }
}


struct WalkThroughTwo: View {
    var body: some View {
        GeometryReader { geometory in
            ZStack {
                VStack {
                    Color.appPrimary.frame(width: geometory.size.width, height: geometory.size.height * 0.6).ignoresSafeArea()
                    Spacer()
                }

                VStack(spacing: 0) {
                    Spacer(minLength: 20)
                    Image("wt_image2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geometory.size.width * 0.6)
                        .shadowedStyle()
                    
                    Spacer(minLength: 8)
                    Text("WTTitle2")
                        .style(.title)
                        .padding(16)
                    
                    Text("WTDesc21")
                        .style(.headline)
                        .padding(2)
                    Text("WTDesc22")
                        .style(.headline)
                        .padding(2)
                    
                    Spacer(minLength: 88)
                }
            }
        }
        
    }
}
