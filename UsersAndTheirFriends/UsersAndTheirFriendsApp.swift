//
//  UsersAndTheirFriendsApp.swift
//  UsersAndTheirFriends
//
//  Created by Григорий Скороспелкин on 03.04.2025.
//

import SwiftUI
import SwiftData

@main
struct UsersAndTheirFriendsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
