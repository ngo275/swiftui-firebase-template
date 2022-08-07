//
//  View+Extension.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI

extension View {
    func initializeAlert(_ alertManager: AppAlertView) -> some View {
        self.modifier(AlertViewModifier(alert: alertManager))
    }
    
    func initializeAlertActionSheet(_ alertManager: AppAlertView) -> some View {
        self.modifier(ActionSheetModifier(alert: alertManager))
    }
}
