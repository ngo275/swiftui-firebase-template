//
//  AuthService.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift
import FirebaseFirestore
import Combine

class AuthService: ObservableObject {
    static let shared = AuthService()

    @Published var user: User?
    
    private let store = Firestore.firestore()
    private var authenticationStateHandler: AuthStateDidChangeListenerHandle?
    
    private init() {
        addListners()
    }
    
    static func signin() {
        if Auth.auth().currentUser == nil {
            Auth.auth().signInAnonymously()
        }
    }
    
    private func addListners() {
        if let handler = authenticationStateHandler {
            Auth.auth().removeStateDidChangeListener(handler)
        }
        
        authenticationStateHandler = Auth.auth().addStateDidChangeListener { _, user in
            guard let u = user else { return }
            self.user = u
            Analytics.setUserID(u.uid)
        }
    }
}
