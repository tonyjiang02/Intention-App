//
//  TabNavigationView.swift
//  Quit-Social
//
//  Created by Tony Jiang on 5/18/23.
//

import SwiftUI

struct TabNavigationView: View {
    @State private var selectedTab = 0

    var body: some View {
        TabView(selection: $selectedTab) {
            ContentView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
                .tag(0)

            FriendsView()
                .tabItem {
                    Image(systemName: "person.2")
                    Text("Friends")
                }
                .tag(1)

            LeaderboardView()
                .tabItem {
                    Image(systemName: "chart.bar")
                    Text("Leaderboard")
                }
                .tag(2)

            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
                .tag(3)
        }
    }
}

struct HomeView: View {
    var body: some View {
        Text("Home")
    }
}

struct FriendsView: View {
    var body: some View {
        Text("Friends")
    }
}

struct LeaderboardView: View {
    var body: some View {
        Text("Leaderboard")
    }
}

struct ProfileView: View {
    var body: some View {
        Text("Profile")
    }
}

struct TabNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        TabNavigationView()
    }
}
