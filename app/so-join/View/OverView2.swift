//
//  OverView2.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/8.
//

import SwiftUI

struct OverView2: View {
    var body: some View {
        NavigationStack {
            WrapWithBackground {
                VStack(alignment: .leading) {
                    Text(String(localized: "Activities schedule", comment: "Activities schedule"))
                        .font(.custom("NotoSansTC-Medium", size: 18))
                        .kerning(0.72)
                        .padding(.leading, 20)
                    List {
                        EventCard().listRowSeparator(.hidden)
                        EventCard().listRowSeparator(.hidden)
                        EventCard().listRowSeparator(.hidden)
                        EventCard().listRowSeparator(.hidden)
                    }.listStyle(.plain)
                    .frame(minWidth: 0,maxWidth: .infinity)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
            }
            .toolbar() {
                ToolbarItem(placement: .navigationBarLeading) {
                        Text(String(localized: "Overview", comment: "Overview"))
                            .font(.custom("NotoSansTC-Medium", size: 32))
                            .kerning(0.72)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gearshape.fill").padding(.top, 13)
                }
            }
        }
    }
}

struct OverView2_Previews: PreviewProvider {
    static var previews: some View {
        OverView2()
    }
}
