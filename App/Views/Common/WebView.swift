//
//  WebView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import WebKit
import SwiftUI

struct WebView: UIViewRepresentable {
    var urlString: String
    
    class Coordinator: NSObject, WKUIDelegate, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, createWebViewWith configuration: WKWebViewConfiguration, for navigationAction: WKNavigationAction, windowFeatures: WKWindowFeatures) -> WKWebView? {
            if navigationAction.targetFrame == nil {
                webView.load(navigationAction.request)
            }
            return nil
        }
        
        func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: (WKNavigationActionPolicy) -> Void) {
            if let url = navigationAction.request.url?.absoluteString {
                if (url.hasPrefix("https://apps.apple.com/")) {
                    guard let appStoreLink = URL(string: url) else {
                        return
                    }
                    UIApplication.shared.open(appStoreLink, options: [:], completionHandler: { (succes) in
                    })
                    decisionHandler(WKNavigationActionPolicy.cancel)
                } else if (url.hasPrefix("http")) {
                    decisionHandler(WKNavigationActionPolicy.allow)
                } else {
                    decisionHandler(WKNavigationActionPolicy.cancel)
                }
            }
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        
        return webView
    }
    
    func updateUIView(_ webView: WKWebView, context: Context) {
        webView.uiDelegate = context.coordinator
        webView.navigationDelegate = context.coordinator
        
        webView.allowsBackForwardNavigationGestures = true
        
        let url = URL(string: urlString)!
        let request = URLRequest(url: url)
        webView.load(request)
    }
}
