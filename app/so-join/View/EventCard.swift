//
//  EventCard.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/8.
//

import SwiftUI

enum EvnetCardVariants {
    case SMALL
    case MEDIUM
}

struct EventCard: View {
    var name: String
    var timeInterval: String
    var dates: [String]
    var variant: EvnetCardVariants
    
    private var height: CGFloat {
        get {
            switch variant {
            case .SMALL: return 206
            case .MEDIUM: return 270
            }
        }
    }
    
    init() {
        self.variant = .SMALL
        self.name = "<blank>"
        self.timeInterval = "<blank>"
        self.dates = ["<blank>"]
    }
    
    init(variant: EvnetCardVariants) {
        self.variant = variant
        self.name = "<blank>"
        self.timeInterval = "<blank>"
        self.dates = ["<blank>"]
    }
    
    init(event: Event) {
        self.variant = .SMALL
        self.name = event.name
        self.timeInterval = event.timeInterval
        self.dates = event.dates
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            
            variant == .MEDIUM ? Text(timeInterval).font(.custom("NotoSansTC-Bold", size: 12)).foregroundColor(.white.opacity(0.8)).padding(.bottom, 4) : nil
            
            switch variant {
            case .SMALL:
                Text(name).font(.custom("NotoSansTC-Medium", size: 24))
            case .MEDIUM:
                Text(name).font(.custom("NotoSansTC-Bold", size: 32)).padding(.bottom, 4)
            }
            
           
            variant == .MEDIUM ? nil : Spacer()
            variant == .SMALL ? Text(timeInterval).font(.custom("NotoSansTC-Bold", size: 12)).foregroundColor(.white.opacity(0.8)) : nil
            variant == .MEDIUM ? nil : Spacer()
            
            Text("3月").font(.custom("NotoSansTC-Medium", size: 18)).kerning(0.72)
            
            Text("20 22 23").font(.custom("NotoSansTC-Medium", size: 18)).kerning(0.72)
            
            Spacer()
            
            HStack {
                HStack(alignment: .center) {
                    Text("統計中").font(.custom("NotoSansTC-Regular", size: 14)).foregroundColor(.white)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color("blue.500"))
                .cornerRadius(5)
                
                HStack(alignment: .center) {
                    Text("1人填寫").font(.custom("NotoSansTC-Regular", size: 14)).foregroundColor(.white)
                }
                .padding(.horizontal, 12)
                .padding(.vertical, 4)
                .background(Color("gray.700"))
                .cornerRadius(5)
                
                Text("查看統計")
                    .font(.custom("NotoSansTC-Regular", size: 16))
                    .kerning(0.64)
                    .foregroundColor(.white.opacity(0.9))
                    .frame(minWidth: 0, maxWidth: .infinity,alignment: .trailing)
            }
        }
        .padding(.vertical, 20)
        .padding(.horizontal, 16)
        .frame(width: .infinity, height: height, alignment: .topLeading)
        .background(Color("surface"))
        .foregroundColor(.white)
        .cornerRadius(16)
        .overlay {
            VStack {
                Image(systemName: "ellipsis")
                    .frame(minWidth:0, maxWidth: .infinity,minHeight: 0, maxHeight: .infinity ,alignment: .topTrailing)
                    .padding(.top, 28)
                    .padding(.trailing, 24)
                    .font(.system(size: 16))
                    .foregroundColor(.white)
            }
        }

    }
}

struct EventCard_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            VStack {
                EventCard()
                EventCard(variant: .MEDIUM)
            }
        }
    }
}
