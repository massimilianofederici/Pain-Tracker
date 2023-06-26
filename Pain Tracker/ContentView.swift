//
//  ContentView.swift
//  Pain Tracker
//
//  Created by massi on 24/06/2023.
//

import SwiftUI
import SwiftData

@available(iOS 17.0, *)
struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var entries: [Entry]
    @State private var isPresentingNewScrumView = false
    
    var body: some View {
        NavigationStack {
            List(entries) { entry in
                NavigationLink(destination: Text("something")) {
                    CardView(entry: entry)
                }
                .listRowBackground(entry.theme.accentColor)
            }
            .navigationTitle("Recorded entries")
            .toolbar {
                Button(action: {isPresentingNewScrumView = true}) {
                    Image(systemName: "plus")
                }
                .accessibilityLabel("Record new event")
            }
        }
        .sheet(isPresented: $isPresentingNewScrumView) {
            NewEntrySheet(isPresentingNewEntryView: $isPresentingNewScrumView, callback: save)
        }
    }
    
    private func save(newEntry: Entry) {
        withAnimation {
            modelContext.insert(newEntry)
        }
        
    }
    
    private func delete(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(entries[index])
            }
        }
    }
}
