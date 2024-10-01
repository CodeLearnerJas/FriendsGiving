//
//  DetailView.swift
//  FriendsGiving
//
//  Created by GuitarLearnerJas on 30/9/2024.
//

import SwiftUI

struct DetailView: View {
    @State var friend: Friend
    @Environment(\.dismiss) private var dismiss
    @EnvironmentObject var friendsVM : FriendsViewModel
    var body: some View {
        NavigationStack {
            VStack (alignment: .leading) {
                Text("Name:")
                    .bold()
                
                TextField("Insert Name", text: $friend.name)
                .textFieldStyle(.roundedBorder)
                
                Text("Bringing:")
                    .bold()
                
                TextField("Insert Bringing", text: $friend.bringing)
                .textFieldStyle(.roundedBorder)
                
                Text("Notes:")
                    .bold()
                
                TextField("Insert Notes", text: $friend.notes)
                .textFieldStyle(.roundedBorder)
                .padding(.bottom)
                
                Spacer()
                
            }
            .padding()
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button ("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button ("Save") {
                        //save action
                        friendsVM.addFriend(friend: friend)
                        dismiss()
                    }
                }
            }
            .navigationBarBackButtonHidden()
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    NavigationStack {
        DetailView(friend: Friend())
            .environmentObject(FriendsViewModel())
    }
}
