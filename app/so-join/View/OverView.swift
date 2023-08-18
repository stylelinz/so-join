//
//  OverView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/6.
//

import SwiftUI

let data: [Event] = [
    Event(name:"JOJO 展覽", timeInterval: "09:00 - 18:00", dates: ["2023-06-21", "2023-06-22", "2023-06-23"]),
    Event(name:"桌遊@中山", timeInterval: "09:00 - 18:00", dates: ["2023-07-21", "2023-07-22", "2023-07-23"]),
    Event(name:"讀書會", timeInterval: "18:00 - 22:00", dates: ["2023-06-21", "2023-08-22", "2023-08-23"])
]

struct OverView: View {
    @EnvironmentObject var globalState: GlobalState
    @State private var showModal = false
    var body: some View {
        GeometryReader { gp in
            NavigationStack {
                WrapWithBackground {
                    VStack(alignment: .leading) {
                        Text(String(localized: "Activities schedule", comment: "Activities schedule"))
                            .font(.custom("NotoSansTC-Medium", size: 18))
                            .kerning(0.72)
                            .padding(.leading, 20)
                        List {
                            ForEach(data.indices, id: \.self) { index in
                                ZStack(alignment: .leading) {
                                    EventCard(event: data[index], onMoreClick: {
                                        showModal.toggle()
                                    })
                                    NavigationLink(destination: EventView()) {

                                    }
                                    .opacity(0)
                                }
                            }
                            .listRowSeparator(.hidden)
                        }
                        .listStyle(.plain)
                        .frame(minWidth: 0, maxWidth: .infinity)

                        Spacer()
                        Spacer()
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
            .sheet(isPresented: $showModal) {
                SharePanelView(gp: gp)
            }
        }
    }
}

struct EmptyView: View {
    @EnvironmentObject var globalState: GlobalState
    
    var body: some View {
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
            
            Button(action: {
                globalState.isCreate.toggle()
            }, label: {
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
}

struct OverView_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            OverView().preferredColorScheme(.dark)
        }
    }
}
