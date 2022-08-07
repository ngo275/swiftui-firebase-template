//
//  SamplePostsView.swift
//  App
//
//  Created by Shu on 2022/08/07.
//

import SwiftUI

struct SamplePostsView: View {
    @EnvironmentObject var postService: SamplePostService
    
    @State private var showingAlert = false
    @State private var text = ""
    
    var body: some View {
        VStack {
            Button(action: {
                showingAlert.toggle()
            }) {
                Text("Add").style(.actionButtonText)
            }
            
            LazyVStack {
                ForEach(postService.posts ?? []) { post in
                    Text(post.title)
                }
            }
            
            TextFieldAlertView(
                        text: $text,
                        isShowingAlert: $showingAlert,
                        placeholder: "",
                        title: NSLocalizedString("AddTitle", comment: ""),
                        message: NSLocalizedString("AddTitleDesc", comment: ""),
                        leftButtonTitle: NSLocalizedString("Cancel", comment: ""),
                        rightButtonTitle: NSLocalizedString("Add", comment: ""),
                        leftButtonAction: {
                            text = ""
                        },
                        rightButtonAction: {
                            postService.add(title: text, message: "Test message")
                            text = ""
                        }
                    )
            .frame(width: 0, height: 0)

        }
    }
}

struct SamplePostsView_Previews: PreviewProvider {
    static var previews: some View {
        SamplePostsView().environmentObject(SamplePostService())
    }
}
