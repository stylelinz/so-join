//
//  MainView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/6.
//

import SwiftUI



struct MainView: View {
    var body: some View {
        TabView {
            WrapWithBackground {
                OverView()
            }.tabItem {
                Label(String(localized: "Overview", comment: "Overview"), systemImage: "chart.bar.fill")
            }
            WrapWithBackground {
                SecondView()
            }.tabItem {
                Label(String(localized: "Create", comment: "Create"), systemImage: "plus")
            }
            WrapWithBackground {
                ThirdView()
            }.tabItem {
                Label(String(localized: "Record", comment: "Record"), systemImage: "list.bullet.rectangle.portrait.fill")
            }
        }.tint(.white)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
