//
//  FriendsViewModel.swift
//  FriendsGiving
//
//  Created by GuitarLearnerJas on 30/9/2024.
//

import Foundation
class FriendsViewModel: ObservableObject {
    @Published var friends: [Friend] = []
    
   init() {
       loadData()
    }
    
    func addFriend(friend: Friend) {
        if friend.id == nil { //This is a new friend to append. Create an id, first
            var newFriend = friend
            newFriend.id = UUID().uuidString
            friends.append(newFriend)
        } else { //This is an existing friend, just editing. Find the index to update
            if let index = friends.firstIndex(where: { $0.id == friend.id }) {
                friends[index] = friend
            }
        }
        saveData()
    }
    
    func deleteFriend(atOffsets: IndexSet) {
        friends.remove(atOffsets: atOffsets)
        saveData()
    }
    
    
    func movefriend(fromOffsets: IndexSet, toOffset: Int) {
        friends.move(fromOffsets: fromOffsets, toOffset: toOffset)
        saveData()
    }
    
    private func loadData() {
        let path = URL.documentsDirectory.appending(component: "friends")
        guard let data = try? Data(contentsOf: path) else {
            print("Error loading data")
            return
        }
        do {
            friends = try JSONDecoder().decode([Friend].self, from: data)
        } catch {
            print("Error decoding data: \(error)")
        }
        
    }
    private func saveData() {
        let path = URL.documentsDirectory.appending(components: "friends")
        let data = try? JSONEncoder().encode(friends)
        do {
            try data?.write(to: path)
        } catch {
            print("Error saving data: \(error)")
        }
    }
}
