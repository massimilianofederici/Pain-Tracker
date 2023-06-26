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
    @State private var isEditing = false
    
    var body: some View {
        Form {
            Section(header: Text("Record")) {
                VStack {
                    Slider(
                        value: $intensity,
                        in: Double(PainLevel.noPain.rawValue)...Double(PainLevel.unableToMove.rawValue),
                        step: 1,
                        onEditingChanged: { editing in
                            isEditing = editing
                            entry.intensity = Int(intensity)
                        }
                    )
                    Text("\(intensity)").foregroundColor(isEditing ? .red : .blue)
                }
                TextField("Location", text: $entry.location)
                TextField("Notes", text: $entry.notes)
                //                HStack {
                //                    Slider(value: $scrum.lengthInMinutesAsDouble, in: 5...30, step: 1) {
                //                        Text("Length")
                //                    }
                //                    .accessibilityValue("\(scrum.lengthInMinutes) minutes")
                //                    Spacer()
                //                    Text("\(scrum.lengthInMinutes) minutes")
                //                        .accessibilityHidden(true)
                //                }
                //                ThemePicker(selection: $scrum.theme)
            }
            //            Section(header: Text("Attendees")) {
            //                ForEach(scrum.attendees) { attendee in
            //                    Text(attendee.name)
            //                }
            //                .onDelete { indices in
            //                    scrum.attendees.remove(atOffsets: indices)
            //                }
            //                HStack {
            //                    TextField("New Attendee", text: $newAttendeeName)
            //                    Button(action: {
            //                        withAnimation {
            //                            let attendee = DailyScrum.Attendee(name: newAttendeeName)
            //                            scrum.attendees.append(attendee)
            //                            newAttendeeName = ""
            //                        }
            //                    }) {
            //                        Image(systemName: "plus.circle.fill")
            //                            .accessibilityLabel("Add attendee")
            //                    }
            //                    .disabled(newAttendeeName.isEmpty)
            //                }
            //            }
        }
    }
}
