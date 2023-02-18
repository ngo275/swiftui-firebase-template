//
//  LottieView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {
    private let tag = 100

    var name: String
    var loopMode: LottieLoopMode = .playOnce
    var animationView = LottieAnimationView()
    @Binding var playing: Bool

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView(frame: .zero)
        animationView.tag = tag
        animationView.animation = LottieAnimation.named(name)
        animationView.contentMode = .scaleAspectFit
        animationView.loopMode = loopMode

        animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animationView)

        NSLayoutConstraint.activate([
            animationView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animationView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        if playing {
            (uiView.viewWithTag(tag) as! LottieAnimationView).play()
        } else {
            (uiView.viewWithTag(tag) as! LottieAnimationView).stop()
        }
    }
}
