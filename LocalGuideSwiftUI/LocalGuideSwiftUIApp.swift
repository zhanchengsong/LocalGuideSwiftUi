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

    var body: some Scene {
        WindowGroup {
            LoginView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
