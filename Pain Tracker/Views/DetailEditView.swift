//
//  DetailEditView.swift
//  Pain Tracker
//
//  Created by massi on 25/06/2023.
//

import SwiftUI

struct DetailEditView: View {
    @Binding var entry: Entry
    @State private var intensity = 0.0
    
    var body: some View {
        Form {
            Section(header: Text("Record")) {
                VStack {
                    Slider(
                        value: $intensity,
                        in: Double(PainLevel.noPain.rawValue)...Double(PainLevel.unableToMove.rawValue),
                        step: 1,
                        onEditingChanged: { editing in
                            entry.intensity = Int(intensity)
                        },
                        minimumValueLabel: Text("\(PainLevel.noPain.rawValue)"),
                        maximumValueLabel: Text("\(PainLevel.unableToMove.rawValue)"), label: { }
                    )
                    Text("\(PainLevel(rawValue: Int(intensity))!.name)")
                }
                TextField("Location", text: $entry.location)
                TextField("Movement", text: $entry.movement)
                TextField("Notes", text: $entry.notes).lineLimit(2)
            }
        }
    }
}
