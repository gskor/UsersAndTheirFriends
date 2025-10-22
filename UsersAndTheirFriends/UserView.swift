//
//  UserView.swift
//  UsersAndTheirFriends
//
//  Created by Григорий Скороспелкин on 09.04.2025.
//

import SwiftUI

struct UserView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 10) {
                Text("Name: \(user.name)")
                Text("Age: \(user.age)")
                Text("Company: \(user.company)")
                Text("Email: \(user.email)")
                Text("Address: \(user.address)")
                Text("About: \(user.about)")
                Text("Registered: \(user.registered.formatted(.dateTime.year().month().day()))")
                
                Text("Friends:")
                    .font(.headline)
                ForEach(user.friends, id: \.id) { friend in
                    Text(friend.name)
                }
            }
        }
        .scrollBounceBehavior(.basedOnSize)
        .padding()
        .navigationTitle(user.name)
    }
}
