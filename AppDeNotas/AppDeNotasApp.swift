//
//  AppDeNotasApp.swift
//  AppDeNotas
//
//  Created by Felipe Angeli on 12/03/24.
//

import SwiftUI
import FirebaseCore

@main
struct AppDeNotasApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
            LoginView()
        }
    }
}


