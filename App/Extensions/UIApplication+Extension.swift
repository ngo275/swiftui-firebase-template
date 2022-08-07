//
//  UIApplication+Extension.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import UIKit

extension UIApplication {
    func endEditing(_ force: Bool) {
        self.windows
            .filter{$0.isKeyWindow}
            .first?
            .endEditing(force)
    }
}
