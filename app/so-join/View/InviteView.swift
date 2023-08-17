//
//  InviteView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/24.
//

import SwiftUI

struct InviteView: View {
    @Environment(\.dismiss) var dismiss
    var onDismiss: () -> Void
    var body: some View {
        ZStack {
            Color("gray.800").ignoresSafeArea()
            VStack(spacing: 15) {
                Group {
                    Button(action: {
                        dismiss()
                        onDismiss()
                    }) {
                        Text("略過")
                            .font(.custom("NotoSansTC-medium", size: 16))
                            .kerning(0.64)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                            .padding(.bottom, 30)
                    }
                    Text("邀請好友來填寫")
                        .font(.custom("NotoSansTC-medium", size: 24))
                    Text("分享連結即可讓朋友完成填寫")
                        .font(.custom("NotoSansTC-medium", size: 13))
                        .foregroundColor(Color("white.alpha.500"))
                    HStack {
                        Text("http://so-join.com/event/123456")
                            .accentColor(.white)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Image(systemName: "link")
                    }
                    
                    .frame(maxWidth: .infinity)
                    .frame(height: 52)
                    .padding(.horizontal, 15)
                    .background(Color("gray.900"))
                    .cornerRadius(7)
                    
                    Button(action: {}) {
                        HStack {
                            Image(systemName: "square.and.arrow.up")
                            Text("分享連結")
                        }
                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 48)
                    .background(Color("blue.600"))
                    .cornerRadius(8)
                    
                }
                .foregroundColor(.white)
                Spacer()
            }
            .padding(.horizontal, 32)
        }
    }
}

struct InviteView_Previews: PreviewProvider {
    static var previews: some View {
        InviteView(onDismiss: {})
    }
}
