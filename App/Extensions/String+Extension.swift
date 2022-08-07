//
//  String+Extension.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import Foundation

extension String {
    func trimmingLeadingAndTrailingSpaces(using characterSet: CharacterSet = .whitespacesAndNewlines) -> String {
        return trimmingCharacters(in: characterSet)
    }
    
    func initialUppercased() -> String {
        let lowercasedString = self.lowercased()
        return lowercasedString.prefix(1).uppercased() + lowercasedString.dropFirst()
    }
}
