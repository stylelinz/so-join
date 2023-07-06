//
//  WrapBackground.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/7.
//

import SwiftUI

struct WrapWithBackground<Content>: View where Content: View {
    var content: Content
    
    init (@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        ZStack {
            Color("Screen").ignoresSafeArea(.all)
            content
        }
    }
}

struct WrapWithBackground_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            Text("Hello")
        }
    }
}
