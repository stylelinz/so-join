//
//  Date.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/15.
//

import Foundation

public extension Date {
    static var weekdaysSymbols: [String] {
        var calendar = Calendar.autoupdatingCurrent
        let locale = Locale(identifier: Locale.current.identifier) //TODO to set user's locale
        calendar.locale = locale
        return calendar.veryShortWeekdaySymbols
    }
    
    static func isPastFromNow (_ compareDate: Date) -> Bool {
        let today = Date()
        return today <= compareDate
    }
    
    func toDay (day: Int) -> Date {
        let currentDate = self
        let calendar = Calendar.current
        let year = calendar.component(.year, from: currentDate)
        let month = calendar.component(.month, from: currentDate)
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        
        let newDate = calendar.date(from: dateComponents)!
        return newDate
    }
    
    var firstWeekdayOfTheMonth: Int {
        let dateComponents = Calendar.autoupdatingCurrent.dateComponents([.calendar, .year, .month], from: self)
        let firstDate = dateComponents.date!
        let firstWeekday = Calendar.current.component(.weekday, from: firstDate)
        return firstWeekday
    }
    
    func add (days: Double) -> Date {
        let seconds = Double(days) * 60 * 60 * 24
        return addingTimeInterval(seconds)
    }
    
    func add (months: Int) -> Date {
        let calendar = Calendar.current
        return calendar.date(byAdding: .month, value: months, to: self)!
    }
    
    func getTotalDaysRange() -> Range<Int> {
        let calendar = Calendar.autoupdatingCurrent
        let range = calendar.range(of: .day, in: .month, for: self)!
        return range
    }
    
    func getDay() -> Int {
        let calendar = Calendar.current
        let components = calendar.dateComponents([.day], from: self)
        return components.day!
    }
    
}
