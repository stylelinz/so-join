//
//  MainView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/6.
//

import SwiftUI

class GlobalState: ObservableObject {
  @Published var isCreate = false
}


struct MainView: View {
  @ObservedObject var globalState = GlobalState()

  @State private var selectedTab = 1
  @State private var prevSelectedTab = 1

  var body: some View {
    WrapWithBackground {
      TabView(selection: $selectedTab) {
        OverView().tabItem {
          Label(String(localized: "Overview", comment: "Overview"), systemImage: "chart.bar.fill")
        }.tag(1)
        Text("").tabItem {
          Label(String(localized: "Create", comment: "Create"), systemImage: "plus")
        }.tag(2)
        ThirdView().tabItem {
          Label(String(localized: "Record", comment: "Record"), systemImage: "list.bullet.rectangle.portrait.fill")
        }.tag(3)
      }
        .onChange(of: selectedTab) {
        if 2 == $0 {
          globalState.isCreate.toggle()
          selectedTab = prevSelectedTab
        } else {
          prevSelectedTab = $0
        }
      }
        .tint(.white)
        .fullScreenCover(isPresented: $globalState.isCreate) {
        WrapWithBackground {
          CreateView()
        }
      }
    }.environmentObject(globalState)
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView().preferredColorScheme(.dark)
  }
}
