//
//  PageView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI

struct PageView<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    
    @State var currentPage = 0
    @Binding var finished: Bool
    
    init(_ views: [Page], finished: Binding<Bool>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._finished = finished
    }
    
    var isLast: Bool {
        return currentPage + 1 == viewControllers.count
    }
    
    var body: some View {
        GeometryReader { geometory in
            ZStack(alignment: .bottomTrailing) {
                PageViewController(controllers: viewControllers, currentPage: $currentPage)
                HStack {
                    PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                        .frame(width: 50, height: 16, alignment: .center)
                        .offset(x: 60)
                    Spacer()
                    Button(action: { self.hanldeButton() }) {
                        if isLast {
                            Text("Start").style(.primaryButtonText)
                        } else {
                            Text("Next").style(.primaryButtonText)
                        }
                    }
                    .frame(width: 90, height: 32, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .offset(x: -60)
                }.offset(y: -40)
            }
        }
    }
    
    private func hanldeButton() {
        if isLast {
            completeWalkThrough()
        } else {
            goNext()
        }
    }
    
    private func completeWalkThrough() {
        UserDefaults.standard.setValue(true, forKey: Constants.userDefaults.didWalkThroughKey)
        finished = true
    }
    
    private func goNext() {
        if currentPage + 1 < viewControllers.count {
            currentPage += 1
        }
    }
}

