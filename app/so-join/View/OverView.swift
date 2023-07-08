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
                        .font(.custom("NotoSansTC-Medium", size: 18))
                        .kerning(0.72)
                        .padding(.leading, 20)
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
                            .font(.custom("NotoSansTC-Regular", size: 18))
                            .kerning(0.72)
                        }
                        Button(action: {}, label: {
                            Label(String(localized: "Create", comment: "Create "), systemImage: "plus")
                                .font(.custom("NotoSansTC-Regular", size: 18))
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
            }
            .toolbar {
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

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            OverView()
        }
    }
}
