//
//  EventView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/25.
//

import SwiftUI

struct EventView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack  {
            VStack(spacing: 22) {
                EventCard(variant: .MEDIUM)
                
                VStack(spacing: 16) {
                    Group {
                        Button(action: {}) {
                            Text("填寫可參與時段")
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 46)
                        .background(Color("blue.600"))
                        .foregroundColor(.white)
                        
                        Button(action: {}) {
                            Text("邀請成員填寫")
                        }
                        .frame(maxWidth: .infinity)
                        .frame(height: 46)
                        .background(Color(red: 0.17, green: 0.17, blue: 0.18))
                        .foregroundColor(.white)
                    }
                    .cornerRadius(10)
                }
                
                Spacer()
                Spacer()
            }
            .padding(.horizontal, 20)
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button(action: {
                        dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem (placement: .principal) {
                    Text("Event Name").font(.custom("NotoSansTC-medium", size: 18)).kerning(0.72)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            EventView().preferredColorScheme(.dark)
        }
    }
}
