//
//  ContentView.swift
//  UsersAndTheirFriends
//
//  Created by Григорий Скороспелкин on 03.04.2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var users: [User]
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                NavigationLink(destination: UserView(user: user)) {
                    VStack(alignment: .leading) {
                        Text("\(user.name)")
                        Text(user.isActive ? "Active" : "Inactive")
                            .foregroundColor(user.isActive ? .green : .red)
                    }
                }
            }
            .navigationTitle("Users")
            .task {
                if users.isEmpty {
                    await loadUsers()
                }
            }
        }
    }
    
    func loadUsers() async {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL")
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try decoder.decode([User].self, from: data)
            for user in decodedUsers {
                modelContext.insert(user)
            }
        } catch {
            print("Failed to load users: \(error)")
        }
    }
}

#Preview {
    ContentView()
}
