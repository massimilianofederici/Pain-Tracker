//
//  NewEntrySheet.swift
//  Pain Tracker
//
//  Created by massi on 25/06/2023.
//

import Foundation
import SwiftUI

struct NewEntrySheet: View {
    @State private var newEntry = Entry.empty()
    @State private var date = Date()
    @Binding var isPresentingNewEntryView: Bool
    var callback: (Entry) -> Void;
    
    var body: some View {
        NavigationStack {
            DetailEditView(entry: $newEntry, date: $date)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewEntryView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            newEntry.timestamp = date
                            callback(newEntry)
                            isPresentingNewEntryView = false
                        }
                    }
                }
        }
    }
}
