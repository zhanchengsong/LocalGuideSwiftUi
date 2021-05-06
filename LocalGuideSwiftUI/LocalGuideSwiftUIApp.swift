//
//  LocalGuideSwiftUIApp.swift
//  LocalGuideSwiftUI
//
//  Created by Zhancheng on 2021-04-18.
//

import SwiftUI

@main
struct LocalGuideSwiftUIApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.scenePhase) var scenePhase
    let authViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(authViewModel).environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}
