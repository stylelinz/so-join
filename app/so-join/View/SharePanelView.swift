//
//  SharePanelView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/27.
//

import SwiftUI

struct SharePanelView: View {
    var gp: GeometryProxy
    var body: some View {
        VStack {
            Rectangle()
                .foregroundColor(Color("white.alpha.300"))
                .frame(width: 48, height: 4)
                .cornerRadius(4)
            Spacer()
            Spacer()
            VStack {
                Divider().frame(height: 1).background(.white.opacity(0))
                SharePanelButton(icon: "pencil", label: "編輯活動", action: {})
                Divider().frame(height: 1).background(.white.opacity(0.3))
                SharePanelButton(icon: "chart.bar.fill", label: "查看統計", action: {})
                Divider().frame(height: 1).background(.white.opacity(0.3))
                SharePanelButton(icon: "calendar.badge.clock", label: "填寫時段", action: {})
                Divider().frame(height: 1).background(.white.opacity(0.3))
                SharePanelButton(icon: "square.and.arrow.up", label: "發送邀請", action: {})
                Divider().frame(height: 1).background(.white.opacity(0))
            }
            .frame(maxWidth: .infinity)
            .background(Color("gray.700"))
            .cornerRadius(10)
            Spacer()
        }
        .presentationDetents([.height(gp.size.height * 0.42)])
        .presentationBackground(Color("gray.800"))
        .padding(.horizontal, 24)
        .padding(.top, 10)
    }
}

struct SharePanelButton: View {
    var icon: String
    var label: String
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            HStack(alignment: .bottom, spacing: 16) {
                Image(systemName: icon)
                    .frame(width: 20, height: 20)
                Text(label)
                    .font(.custom("NotoSansTC-Regular", size: 18))
                    .kerning(0.64)
                Spacer()
            }
            .foregroundColor(.white.opacity(0.8))
            .padding(.vertical, 6)
            .padding(.horizontal, 14)
            .frame(height: 50, alignment: .center)
        }
    }
}

struct SharePanelView_Previews2: View {
    @State private var showModal = false
    var body: some View {
        GeometryReader { gp in
            VStack {
                Text("123")
                Button(action: {
                    showModal.toggle()
                }) {
                    Text("Click!")
                }
            }.sheet(isPresented: $showModal) {
                SharePanelView(gp: gp)
            }
        }
    }
}

struct SharePanelView_Previews: PreviewProvider {
    static var previews: some View {
        SharePanelView_Previews2()
    }
}
