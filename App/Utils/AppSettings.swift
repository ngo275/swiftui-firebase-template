//
//  AppSettings.swift
//  App
//
//  Created by Shu on 2023/02/18.
//

import Foundation
import SwiftUI

enum Theme: Int {
    case light
    case dark
    
    var colorScheme: ColorScheme {
        switch self {
        case .light:
            return .light
        case .dark:
            return .dark
        }
    }
}

class AppSettings: ObservableObject {
    static let shared = AppSettings()
    @AppStorage(Constants.userDefaults.theme) var currentTheme: Theme = .dark
}
