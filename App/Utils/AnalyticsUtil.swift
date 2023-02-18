//
//  AnalyticsUtil.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import Foundation
import Firebase
import FirebaseAnalytics

// NOTE: Please customize this file to send app events to Firebase Analytics.
struct AnalyticsUtil {
    struct Params {
//        let property1: String?
//        let property2: String?
        
        func toObject() -> [String: String] {
            return [:]
        }
    }
    
    enum EventType: String {
        case onboarded
        case addItem
    }
    
    static func logEvent(_ event: EventType, params: Params? = nil) {
        #if DEBUG
        print("Don't send events...")
        #else
        Analytics.logEvent(event.rawValue, parameters: params?.toObject() ?? [:])
        #endif
        
    }
}
