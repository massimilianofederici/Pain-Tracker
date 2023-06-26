//
//  Entry.swift
//  Pain Tracker
//
//  Created by massi on 24/06/2023.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class Entry: Identifiable {
    let id: UUID
    var timestamp: Date
    var location: String
    var movement: String
    var tags: [String]
    var notes: String
    var intensity: Int
    
    var painLevel: PainLevel {
        PainLevel(rawValue: self.intensity)!
    }
    
    var theme: Theme {
        Theme(painLevel: self.painLevel)
    }
    
    func recordedDate() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: timestamp)
    }
    
    init(id: UUID = UUID(), timestamp: Date = Date(), location: String, movement: String, tags: [String], notes: String, intensity: Int) {
        self.timestamp = timestamp
        self.location = location
        self.movement = movement
        self.id = id
        self.tags = tags
        self.notes = notes
        self.intensity = intensity
    }
}

class Theme {
    var painLevel: PainLevel
    
    init(painLevel: PainLevel) {
        self.painLevel = painLevel
    }
    
    var accentColor: Color {
        switch painLevel {
        case .noPain, .minimal, .mild: return .green
        case .uncomfortable, .moderate, .distracting: return .yellow
        case .distressing, .unmanageable, .intense : return .orange
        case .severe, .unableToMove : return .poppy
        }
    }
    
    var backgroundColor: Color {
        return .black
    }
}

enum PainLevel: Int {
    case noPain = 0
    case minimal = 1
    case mild = 2
    case uncomfortable = 3
    case moderate = 4
    case distracting = 5
    case distressing = 6
    case unmanageable = 7
    case intense = 8
    case severe = 9
    case unableToMove = 10
    
    var name: String {
        "\(self)".camelCaseToWords().capitalized
    }
    
    var description: String {
        "\(name) - \(rawValue)"
    }
}

extension String {
    func camelCaseToWords() -> String {
        return unicodeScalars.dropFirst().reduce(String(prefix(1))) {
            return CharacterSet.uppercaseLetters.contains($1)
            ? $0 + " " + String($1)
            : $0 + String($1)
        }
    }
}

extension Entry {
    static func sample() -> Entry {
        let intensity = Int.random(in: PainLevel.noPain.rawValue...PainLevel.unableToMove.rawValue)
        return Entry(location: "Hip flexors", movement: "Squat", tags: [], notes: "", intensity: intensity)
    }
    
    static func empty() -> Entry {
        return Entry(location: "", movement: "", tags: [], notes: "", intensity: 0)
    }
}
