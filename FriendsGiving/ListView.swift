//
//  ContentView.swift
//  FriendsGiving
//
//  Created by GuitarLearnerJas on 30/9/2024.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var friendsVM: FriendsViewModel
    @State private var sheetPresented: Bool = false
 
    var body: some View {
        NavigationStack {
            List {
                ForEach(friendsVM.friends) { friend in
                    NavigationLink {
                        DetailView(friend: friend)
                    } label: {
                        VStack (alignment: .leading) {
                            Text(friend.name)
                                .font(.title2)
                            Text(friend.bringing)
                                .font(.callout)
                        }
                    }
                }
                .onDelete(perform: friendsVM.deleteFriend)
                .onMove(perform: friendsVM.movefriend)
            }
            .listStyle(.plain)
            .navigationTitle("Friends")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading) {
                    EditButton()
                }
               
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        sheetPresented.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .padding()
        }
        .sheet(isPresented: $sheetPresented) {
            NavigationStack {
                DetailView(friend: Friend())
            }
        }
    }
}

#Preview {
    ListView()
        .environmentObject(FriendsViewModel())
}
