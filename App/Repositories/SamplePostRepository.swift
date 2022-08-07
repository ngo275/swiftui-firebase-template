//
//  SamplePostRepository.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift
import FirebaseFunctions
import Combine

class SamplePostRepository: ObservableObject {
    private let path = "posts"
    private let childPath = "list"
    private let store = Firestore.firestore()
    private var cancellables: Set<AnyCancellable> = []
    private var snapshotListener: ListenerRegistration? = nil
    private lazy var functions = Functions.functions(region: "asia-southeast1")

    @Published var posts: [SamplePost]? = nil
    
    func subscribe() {
        guard let uid = AuthService.shared.user?.uid else { return }

        if snapshotListener != nil {
            return
        }
        snapshotListener = store.collection(path).document(uid).collection(childPath).order(by: "createdAt", descending: true).addSnapshotListener { querySnapshot, error in
            if let error = error {
                print("Error getting post: \(error.localizedDescription)")
                return
            }
            let data = querySnapshot?.documents.compactMap { doc in
                try? doc.data(as: SamplePost.self)
            } ?? []
            
            self.posts = data
        }
    }
    
    func add(post: SamplePost) {
        guard let uid = AuthService.shared.user?.uid else { return }
        
        do {
            _ = try store.collection(path).document(uid).collection(childPath).addDocument(from: post)
        } catch {
            print("add document error")
        }
    }
}
