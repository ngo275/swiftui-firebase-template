# SwiftUI + Firebase template project

This is a template project with SwiftUI and Firebase. You can create an iOS with SwiftUI and Firebase right away! :rocket:

Integrated Firebase services are following
- Firestore Database
- Firebase App Check
- Authentication
- Functions
- Events

## Folder structure

This app has the following design.

```
.
├── Animations                      # Lotties JSON files
├── Localization                    # Localization files (`*.strings`)
├── Utils                           # Utility functions 
├── Services                        # Service classes (business domain)
├── Repositories                    # Repository classes (data layer)
├── Views                           # View classes (view layer)
├── Extensions                      # Swift extension files
├── GoogleService-Info.plist        # Firebase config file (git ignored)
└── README.md
```

- This project sets up necessary service classes in `ContentView.swift` through `environmentObject`. View files that need to access services simply declare `@EnvironmentObject`, like `@EnvironmentObject var postService: SamplePostService`.
- `Views/Styles.swift` has a convenient view modifier called `.style(_)`. You can style Text like `Text("Hello world!").style(.header)`.

## How to use

Just fork the repository on GitHub and go to "Create a new repository" page. You will find `swiftui-firebase-template` in the `Repository template` section! :smile:

Then you have to set up a Firebase project.

1. Create a new Firebase project (Please enable Firebase Auth anonymous login and Firestore)
2. Add `GoogleService-Info.plist` in the new repository
3. Start adding your own implementation


## License

MIT
