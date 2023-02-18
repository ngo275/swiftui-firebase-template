//
//  SamplePostService.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import Foundation
import Combine
import FirebaseFirestore
import FirebaseFirestoreSwift

struct SamplePost: Identifiable, Codable, Equatable {
    @DocumentID var id: String?
    var title: String
    var message: String
    
    @ServerTimestamp var createdAt: Timestamp?
    @ServerTimestamp var updatedAt: Timestamp?
    
    static func ==(lhs: SamplePost, rhs: SamplePost) -> Bool {
        if lhs.id != rhs.id { return false }
        if lhs.title != rhs.title { return false }
        
        return true
    }
}


class SamplePostService: ObservableObject {
    @Published private var repository = SamplePostRepository()
    @Published var posts: [SamplePost]? = nil

    private var cancellables: Set<AnyCancellable> = []

    init() {
        repository.$posts.assign(to: \.posts, on: self).store(in: &cancellables)
        AuthService.shared.$user.receive(on: DispatchQueue.main).sink { [weak self] _ in
            self?.repository.subscribe()
        }.store(in: &cancellables)
    }
    
    func add(title: String, message: String) {
        let newPost = SamplePost(title: title, message: message)
        // Add data to Firestore
        repository.add(post: newPost)
        
        // You can send log event
        AnalyticsUtil.logEvent(.addItem, params: nil)
    }
}
