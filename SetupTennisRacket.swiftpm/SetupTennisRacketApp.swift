import SwiftUI

@main
struct SetupTennisRacketApp: App {
    var body: some Scene {
        WindowGroup {
            SpecList(contentSource: SpecData.homeContent)
        }
    }
}
