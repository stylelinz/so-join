//
//  CalendarPickerView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/15.
//

import SwiftUI
import Foundation

struct CalendarPickerView: View {
    private let weekdays = Date.weekdaysSymbols
    private let today = Date()
    @State private var date = Date()
    @Binding var choosenDates: Set<Date>
    
    private func getFormatDateString (_ date: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy 年 MM 月"
        return dateFormatter.string(from: date)
    }
    
    private var currentMonthTotalDaysRange: Range<Int> {
        get {
            let range = 1..<(date.getTotalDaysRange().upperBound + date.firstWeekdayOfTheMonth)
            return range
        }
    }

    private var currentMonthTotalRows: Int {
        get {
            let blocks = currentMonthTotalDaysRange.upperBound - 2
            var rows = blocks / 7
            
            if (blocks % 7 > 0) {
                rows += 1
            }
            
            return rows
        }
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Button(action: {
                    date = date.add(months: -1)
                }) {
                    Image(systemName: "chevron.left")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                }
                Spacer()
                Text(getFormatDateString(date))
                    .font(.custom("NotoSansTC-medium", size: 18))
                    .kerning(0.72)
                    .foregroundColor(Color("white.alpha.900"))
                Spacer()

                Button(action: {
                    date = date.add(months: 1)
                }) {
                    Image(systemName: "chevron.right")
                        .frame(width: 16, height: 16)
                        .foregroundColor(.white)
                }
            }
            .frame(minWidth: 0, maxWidth: .infinity)
            
            HStack {
                ForEach(weekdays, id: \.self) {
                    Text($0)
                        .font(.custom("NotoSansTC-medium", size: 16))
                        .frame(minWidth:0, maxWidth: .infinity)
                }
            }
            .padding(.top, 16)
            .padding(.bottom, 10)
            
            ForEach(1...currentMonthTotalRows, id: \.self) { row in
                HStack {
                    ForEach(1...7, id: \.self) { day in
                        let actualDay = day + ((row - 1) * 7) - date.firstWeekdayOfTheMonth + 1
                        Group {
                            ZStack {
                                Rectangle()
                                    .foregroundColor((choosenDates.contains { $0 == date.toDay(day: actualDay)}) ? Color("blue.600") : .white.opacity(0))
                                if actualDay > 0 && actualDay < date.getTotalDaysRange().upperBound {
                                    Button(action: {
                                        let res = choosenDates.insert(date.toDay(day: actualDay))
                                        if(!res.inserted) {
                                            choosenDates.remove(date.toDay(day: actualDay))
                                        }
                                    }) {
                                        RoundedRectangle(cornerRadius: 4)
                                            .inset(by: 0.5)
                                            .stroke(Color(red: 0.39, green: 0.39, blue: 0.39),
                                                    lineWidth: Date.isPastFromNow(date.toDay(day: actualDay)) ? 1 : 0)
                                            .overlay(
                                                Text("\(actualDay)")
                                                    .foregroundColor(.white)
                                                    .opacity(Date.isPastFromNow(date.toDay(day: actualDay)) ? 1 : 0.5)
                                            )
                                    }
                                }
                            }
                            .frame(width: 40, height: 40)
                            .cornerRadius(4)

                        }
                        .frame(minWidth:0, maxWidth: .infinity)

                    }
                }
            }
            
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .frame(height: 370)
    }
}

struct CalendarPickerView_Previews: PreviewProvider {
    static var previews: some View {
        @State var choosenDates: Set<Date> = []
        CalendarPickerView(choosenDates: $choosenDates)
//            .border(.white, width: 1)
            .padding(.horizontal, 30)
            .preferredColorScheme(.dark)
    }
}
