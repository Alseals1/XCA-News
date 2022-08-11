//
//  XCANewsApp.swift
//  XCANewsWatch WatchKit Extension
//
//  Created by Alandis Seals on 8/10/22.
//

import SwiftUI
import WatchKit

@main
struct XCANewsApp: App {
    @WKExtensionDelegateAdaptor(ExtensionDelegate.self) private var extensionDelegate
    @StateObject private var bookmark = ArticleBookmarkViewModel.shared
    @StateObject private var searchVM = ArticleSearchViewModel.shared
    @StateObject private var connectivityVM = WatchConnectivityViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(bookmark)
            .environmentObject(searchVM)
            .environmentObject(connectivityVM)
        }
    }
}
