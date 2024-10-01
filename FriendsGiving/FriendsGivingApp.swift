//
//  FriendsGivingApp.swift
//  FriendsGiving
//
//  Created by GuitarLearnerJas on 30/9/2024.
//

import SwiftUI

@main
struct FriendsGivingApp: App {
    @StateObject var friendsVM = FriendsViewModel()
    
    var body: some Scene {
        WindowGroup {
            ListView()
                .environmentObject(friendsVM)
        }
    }
}

