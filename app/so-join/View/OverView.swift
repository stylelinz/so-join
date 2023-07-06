//
//  OverView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/6.
//

import SwiftUI

struct OverView: View {
    var body: some View {
        NavigationStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationTitle(String(localized: "Overview", comment: "Overview"))
        }
        
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        OverView()
    }
}
