//
//  Item.swift
//  triplycount
//
//  Created by Paul Martinez on 13/04/2025.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
