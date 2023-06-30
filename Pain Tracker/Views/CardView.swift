//
//  CardView.swift
//  Pain Tracker
//
//  Created by massi on 25/06/2023.
//

import Foundation
import SwiftUI

struct CardView: View {
    let entry: Entry
    
    var body: some View {
       
        VStack(alignment: .leading) {
            Text(entry.painLevel.description)
                .font(.headline)
                .accessibilityAddTraits(.isHeader)
            Spacer()
            HStack {
                Text("\(entry.location)").accessibilityLabel("\(entry.location) location")
                Spacer()
                Label("\(entry.recordedDate())", systemImage: "clock")
                    .accessibilityLabel("\(entry.timestamp) recorded date")
                    .labelStyle(.trailingIcon)
            }
            .font(.caption)
        }
        .padding()
    }
    
}
