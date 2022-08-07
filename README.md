# SwiftUI + Firebase boilerplate project

This is repository is a boilerplate for a project that uses SwiftUI and Firebase.

Integrated Firebase services are following
- Firestore Database
- Firebase App Check
- Authentication
- Functions
- Events

## Folder structure

This app has the following design 

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


## How to use

Just clone the repository.

Then you have to set up a Firebase project.

1. Create a new Firebase project
2. Add `GoogleService-Info.plist` in the cloned project
3. Start adding your own implementation

## License

MIT
