//
//  Event.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/25.
//

import Foundation

class Event: ObservableObject {
    @Published var name: String
    @Published var timeInterval: String
    @Published var dates: [String]
    
    init(name: String, timeInterval: String, dates: [String]) {
        self.name = name
        self.timeInterval = timeInterval
        self.dates = dates
    }
}
