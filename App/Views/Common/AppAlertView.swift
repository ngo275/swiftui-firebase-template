//
//  AppAlertView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI

// ref: https://github.com/Arvindcs/APAlertView
struct AlertViewModifier: ViewModifier {
    
    @ObservedObject var alert: AppAlertView
    
    public func body(content: Content) -> some View {
        content.alert(isPresented: $alert.showAlertView) {
            alert.getSystemAlert
        }
    }
}

struct ActionSheetModifier: ViewModifier {
    
    @ObservedObject var alert: AppAlertView
    
    public func body(content: Content) -> some View {
        content.actionSheet(isPresented: $alert.showActionSheet, content: {
            alert.getActionSheet
        })
    }
}


class AppAlertView: ObservableObject {
    
    // MARK: Published
    @Published var showAlertView : Bool = false
    @Published var showActionSheet : Bool = false
    
    // MARK: Properties
    private var title : String = ""
    private var message : String = ""
    
    private var primaryCompletion: (buttonName: String, closure: (() -> ())) = ("", {})
    private var secondaryCompletion: (buttonName: String, closure: (() -> ())) = ("", {})
    private var dissmissCompletion: (buttonName: String, closure: (() -> ())) = ("", {})
    
    //MARK:- Default Alert View
    func showAlertView(title: String = "",
                              message: String,
                              primaryCompletion: (buttonName: String, closure: (() -> ())),
                              secondaryCompletion: (buttonName: String, closure: (() -> ())) = ("", {})) {
        self.title = title
        self.message = message
        self.primaryCompletion = primaryCompletion
        self.secondaryCompletion = secondaryCompletion
        self.showAlertView = true
    }
    
    func showAlertView(title: String,
                              message: String,
                              primaryCompletion: (buttonName: String, closure: (() -> ()))) {
        self.showAlertView(title: title, message: message, primaryCompletion: primaryCompletion, secondaryCompletion: ("", {}))
    }
    
    // MARK: A representation for an alert presentation.
    var getSystemAlert: Alert {
        
        let primaryButton = Alert.Button.default(Text(primaryCompletion.buttonName)) {
            self.primaryCompletion.closure()
        }
        
        if secondaryCompletion.buttonName != "" {
            let secondaryButton = Alert.Button.destructive(Text(secondaryCompletion.buttonName)) {
                self.secondaryCompletion.closure()
            }
            
            return Alert(title: Text(title), message: Text(message), primaryButton: primaryButton, secondaryButton: secondaryButton)
        }
        
        return Alert(title: Text(title), message: Text(message), dismissButton: primaryButton)
    }
    
    //MARK:- Action Sheet
    func showActionSheet(title: String,
                                message: String = "",
                                primaryCompletion: (buttonName: String, closure: (() -> ())),
                                secondaryCompletion: (buttonName: String, closure: (() -> ())) = ("", {}),
                                dissmissCompletion: (buttonName: String, closure: (() -> ()))) {
        self.title = title
        self.message = message
        self.primaryCompletion = primaryCompletion
        self.secondaryCompletion = secondaryCompletion
        self.dissmissCompletion = dissmissCompletion
        self.showActionSheet = true
    }
    
    var getActionSheet: ActionSheet {
        
        let action1 = ActionSheet.Button.default(Text(primaryCompletion.buttonName)) {
            self.primaryCompletion.closure()
        }
        
        let action2 = ActionSheet.Button.destructive(Text(secondaryCompletion.buttonName)) {
            self.secondaryCompletion.closure()
        }
        
        let action3 = ActionSheet.Button.cancel(Text(dissmissCompletion.buttonName)) {
            self.dissmissCompletion.closure()
        }
        
        return ActionSheet(title: Text(title), message: Text(message), buttons: [action1, action2, action3])
    }
}
