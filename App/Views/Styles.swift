//
//  Styles.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI

extension Color {
    static let appLightGray = Color("lightGray")
    static let appWhite = Color("white")
    static let appPrimary = Color("primary")
    static let appSecondary = Color("secondary")
    static let appBackground = Color("background")
    static let appText = Color("text")
    static let appTextField = Color("textField")
    static let appSubtext = Color("subtext")
    static let appPlaceholder = Color("placeholder")
    static let appCard = Color("card")
    static let appLine = Color("line")
    static let appDisabled = Color("disabled")
    static let appKeyboard = Color("keyboard")
    static let appSegmentedControl = Color("segmentedControl")
}


extension Font {
    static let header: Font = .custom("Inter-Medium", size: 19)
//    static let sectionFooter: Font = Font.footer.italic()
    static let body: Font = .custom("Inter-Medium", size: 16)
    static let small: Font = .custom("Inter-Medium", size: 14)
    static let bigFont: Font = .custom("Inter-Medium", size: 28)
    static let mediumFont: Font = .custom("Inter-Medium", size: 24)
}


enum Styles {
    case header
    case footer
    case headline
    case body
    case placeholder
    case caption
    case bigText
    case title
    case actionButtonText
    case primaryButtonText
    case secondaryText
    case secondaryButtonText
    case disabledButtonText
}


extension View {
    @ViewBuilder func style(_ style: Styles) -> some View {
        switch style {
        case .header:
            self.font(.header).foregroundColor(.appText)
        case .footer:
            self.font(.small).foregroundColor(.appSubtext)
        case .headline:
            self.font(.body).lineSpacing(4).foregroundColor(.appSubtext)
        case .body:
            self.font(.body).lineSpacing(4).foregroundColor(.appText)
        case .placeholder:
            self.font(.body).foregroundColor(.appPlaceholder)
        case .caption:
            self.font(.small).foregroundColor(.appSubtext)
        case .bigText:
            self.font(.bigFont).foregroundColor(.appText)
        case .title:
            self.font(.mediumFont).foregroundColor(.appText)
        case .actionButtonText:
            self.font(.body).foregroundColor(.appPrimary)
        case .primaryButtonText:
            self.font(.body)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.appPrimary)
                .foregroundColor(.appBackground)
                .cornerRadius(40)
        case .secondaryText:
            self.font(.body).foregroundColor(.appSecondary)
        case .secondaryButtonText:
            self.font(.body)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.appBackground)
                .foregroundColor(.appSubtext)
                .cornerRadius(40)
                .overlay(
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(Color.appSubtext, lineWidth: 1)
                    )
        case .disabledButtonText:
            self.font(.body)
                .padding()
                .frame(maxWidth: .infinity)
                .background(Color.appDisabled)
                .foregroundColor(.appWhite)
                .cornerRadius(40)
        }
    }
    
    func shadowedStyle(_ isToast: Bool = true) -> some View {
        if isToast {
            return self
                .shadow(color: .black.opacity(0.08), radius: 2, x: 0, y: 0)
                .shadow(color: .black.opacity(0.30), radius: 24, x: 0, y: 0)
        } else {
            return self
                .shadow(color: .black.opacity(0.08), radius: 2, x: 0, y: 0)
                .shadow(color: .black.opacity(0.20), radius: 6, x: 0, y: 0)
        }
        
    }
}

struct StylesView: View {
    var body: some View {
        Text("Test Header").style(.header)
        Text("Text Footer").style(.footer)
        Text("Test Button").style(.primaryButtonText)
    }
}

struct StylesView_Previews: PreviewProvider {
    static var previews: some View {
        StylesView()
    }
}

struct DismissingKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .onTapGesture {
                let keyWindow = UIApplication.shared.connectedScenes
                        .filter({$0.activationState == .foregroundActive})
                        .map({$0 as? UIWindowScene})
                        .compactMap({$0})
                        .first?.windows
                        .filter({$0.isKeyWindow}).first
                keyWindow?.endEditing(true)
        }
    }
}
