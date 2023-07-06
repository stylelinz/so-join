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
            WrapWithBackground {
                VStack(alignment: .leading) {
                    Text(String(localized: "Activities schedule", comment: "Activities schedule"))
                        .font(Font.custom("Noto Sans TC", size: 18).weight(.medium))
                        .kerning(0.72)
                    VStack(alignment: .center, spacing: 40) {
                        Spacer()
                        Image("helicopter")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 229, height: 161)
                        VStack {
                            Group {
                                Text(String(localized: "You have not join any activites", comment: "You have not join any activites"))
                                Text(String(localized: "Create one by just a click", comment: "Create one by just a click"))
                            }
                            .font(Font.custom("Noto Sans TC", size: 18))
                            .kerning(0.72)
                        }
                        Button(action: {}, label: {
                            Label(String(localized: "Create", comment: "Create "), systemImage: "plus")
                                .font(Font.custom("Noto Sans TC", size: 18))
                                .kerning(0.72)
                        })
                        .foregroundColor(.white)
                        .frame(width: 181, height: 46)
                        .background(Color("blue.600"))
                        .cornerRadius(10)
                        
                            

                        Spacer()
                        Spacer()
                    }.frame(maxWidth: .infinity, alignment: .center)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 18)
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Text(String(localized: "Overview", comment: "Overview"))
                        .font(Font.custom("Noto Sans TC", size: 32).weight(.medium))
                        .kerning(0.72)
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Image(systemName: "gearshape.fill").padding(.top, 13)
                }
            }
        }.padding(.vertical, 5)
    }
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            OverView()
        }
    }
}
