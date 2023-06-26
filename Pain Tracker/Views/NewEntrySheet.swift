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
    @Binding var isPresentingNewEntryView: Bool
    var callback: (Entry) -> Void;
    
    var body: some View {
        NavigationStack {
            DetailEditView(entry: $newEntry)
                .toolbar {
                    ToolbarItem(placement: .cancellationAction) {
                        Button("Dismiss") {
                            isPresentingNewEntryView = false
                        }
                    }
                    ToolbarItem(placement: .confirmationAction) {
                        Button("Add") {
                            callback(newEntry)
                            isPresentingNewEntryView = false
                        }
                    }
                }
        }
    }
}
