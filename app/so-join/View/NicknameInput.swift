//
//  NicknameInput.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/30.
//

import SwiftUI

struct NicknameInput: View {
    @FocusState private var show: Bool
    @Binding var nickname: String
    var confirmAction: () -> Void

    var body: some View {
        VStack(alignment: .center, spacing: 39) {
            VStack(alignment: .leading) {
                TextField("輸入暱稱", text: $nickname)
                    .font(.custom("NotoSansTC-medium", size: 24))
                    .focused($show)
                Divider()
                    .frame(maxWidth: .infinity, maxHeight: 1)
                    .background(Color(.white).opacity(0.7), alignment: .bottom)
                    .padding(.top, 2)
                    .padding(.bottom, 6)
                Text("你可以設定要在活動中使用的暱稱")
                    .foregroundColor(.white.opacity(0.8))
                    .font(.custom("NotoSansTC-regular", size: 16))
                    .padding(.leading, 6)
            }.padding(.top, 24)

            Button(action: confirmAction) {
                Text("確定").font(.custom("NotoSansTC-Medium", size: 18)).kerning(0.72)
            }
            .frame(width: 96, height: 48)
            .background(nickname.isEmpty ? Color("white.alpha.200") : Color("blue.600"))
            .foregroundColor(nickname.isEmpty ? .white.opacity(0.2) : .white)
            .cornerRadius(50)
            .disabled(nickname.isEmpty)

            Spacer()
        }
    }
}

struct NicknameInput_Previews: PreviewProvider {
    @State static var name = ""
    static private func action () {
        
    }
    
    static var previews: some View {
        NicknameInput(nickname: $name, confirmAction: action).preferredColorScheme(.dark)
    }
}
