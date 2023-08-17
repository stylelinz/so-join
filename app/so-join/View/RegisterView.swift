//
//  RegisterView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/30.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var formStepController = FormStepController(formStepName: ["活動使用暱稱", "填寫時段"])
    @ObservedObject private var eventFormViewModel = RegisterEventFormViewModel()
    
    private var goNextAvailable: Bool {
        get {
            if formStepController.step == 1 {
                return !eventFormViewModel.nickname.isEmpty
            } else {
                return false
            }
        }
    }
    
    var body: some View {
        NavigationStack {
            FormSwitcherView(step: formStepController.step)
            .padding(.top, 20)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button(action: {
                        formStepController.step == 1 ? dismiss() : formStepController.goPrevStep()
                    }) {
                        Image(systemName: "xmark")
                            .font(.system(size: 16))
                            .foregroundColor(.white)
                    }
                }
                ToolbarItem (placement: .principal) {
                    Text(formStepController.currentStepName).font(.custom("NotoSansTC-medium", size: 18)).kerning(0.72)
                }
                ToolbarItem (placement: .navigationBarTrailing) {
                    Button(action: formStepController.goNextStep) {
                        Text("下一步")
                            .font(.custom("NotoSansTC-regular", size: 16))
                            .kerning(0.64)
                            .foregroundColor(goNextAvailable ? .white : .white.opacity(0.3))
                    }
                    .disabled(!goNextAvailable)
                }
            }
        }
        .environmentObject(eventFormViewModel)
        .environmentObject(formStepController)
    }
}

private struct FormSwitcherView: View {
    @EnvironmentObject var eventFormViewModel: RegisterEventFormViewModel
    @EnvironmentObject var formStepController: FormStepController
    
    var step: Int
    var body: some View {
        switch step {
        case 1:
            NicknameInput(nickname: $eventFormViewModel.nickname, confirmAction: formStepController.goNextStep)
                .padding(.horizontal, 20)
        case 2:
            TimeInput()
        default:
            Text("Error")
        }
    }
}

// Grid View

//private struct TimeInput: View {
//    var body: some View {
//        VStack {
//            ScrollView (.horizontal, showsIndicators: false) {
//                HStack(spacing: 11) {
//                    ForEach(1...10, id: \.self) { _ in
//                        ZStack {
//                            Text("12/30")
//
//                                .font(.custom("NotoSansTC-Regular", size: 16))
//                                .kerning(0.64)
//                                .padding(.horizontal, 12)
//
//
//                        }
//                        .frame(maxHeight: .infinity)
//                        .overlay(
//                            Rectangle()
//                            .foregroundColor(.clear)
//                            .frame(height: 3)
//                            .background(Color("blue.600"))
//                            ,alignment: .bottom)
//                    }
//                }
//                .padding(.horizontal, 29)
//                .frame(height: 65)
//                .background(Color("gray.800"))
//            }
//
//            Grid(horizontalSpacing: 10, verticalSpacing: 10) {
//                GridRow {
//                    TimeButton(index: 1)
//                    TimeButton(index: 1)
//                    TimeButton(index: 1)
//                }
//
//                GridRow {
//                    TimeButton(index: 1)
//                    TimeButton(index: 1)
//                    TimeButton(index: 1)
//                }
//
//                GridRow {
//                    TimeButton(index: 1)
//                    TimeButton(index: 1)
//                    TimeButton(index: 1)
//                }
//            }
//            .padding(.top, 26)
//            .padding(.horizontal, 27)
//
//
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
//        .background(Color(red: 0.09, green: 0.09, blue: 0.09))
//
//    }
//}

struct PodData: Equatable, Hashable {
    let index: Int
    let bounds: CGRect
    
    static func == (lhs: PodData, rhs: PodData) -> Bool {
        return lhs.index == rhs.index
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(index)
    }
}

var podsData: Set<PodData> = []

// Pod View

private struct TimeInput: View {
    @GestureState var isDoing: Int = 0
    @State var selectedDate: Int = 1691769600
    
    @State var selected: Set<Int> = []
    @State var visited: Set<Int> = []

    let dates = [1691769600, 1691856000, 1691942400, 1692028800]
    let timeRange = [946684800, 946728000]
    var timeSequence: [Int] {
        get {
            let (curY, curM, curD) = Date(timeIntervalSince1970: TimeInterval(selectedDate)).getDate()
            let (startH, startM, _) = Date(timeIntervalSince1970: TimeInterval(timeRange[0])).getTime()
            let (endH, endM, _) = Date(timeIntervalSince1970: TimeInterval(timeRange[1])).getTime()
            
            let fromTime = Calendar.current.date(from: DateComponents(year: curY, month: curM, day: curD, hour: startH, minute: startM))!.timeIntervalSince1970
            let endTime = Calendar.current.date(from: DateComponents(year: curY, month: curM, day: curD, hour: endH, minute: endM))!.timeIntervalSince1970
            
            return Array(stride(from: Int(fromTime), to: Int(endTime), by: 30 * 60))
        }
    }
    

    var body: some View {
        VStack {
            ZStack {
                Color("gray.800")
                ScrollView (.horizontal, showsIndicators: false) {
                    HStack(spacing: 11) {
                        ForEach(dates, id: \.self) { date in
                            ZStack {
                                Button(action: {
                                    selectedDate = date
                                }) {
                                    Text("\(Date(timeIntervalSince1970: TimeInterval(date)).format("MM/dd"))")
                                        .font(.custom("NotoSansTC-Regular", size: 16))
                                        .kerning(0.64)
                                        .padding(.horizontal, 12)
                                        .foregroundColor(.white)
                                }

                            }
                            .frame(maxHeight: .infinity)
                            .overlay(
                                Rectangle()
                                    .foregroundColor(.clear)
                                    .frame(height: selectedDate == date ? 3 : 0)
                                    .background(Color("blue.600"))
                                ,alignment: .bottom)
                        }
                    }
                    .padding(.horizontal, 29)
                }
            }.frame(height: 65)


            Grid {
                ForEach(Array(stride(from:0, to: timeSequence.count, by: 3)), id: \.self) { index in
                        GridRow {
                            ForEach(0...2, id: \.self) { subIndex in
                                TimeButton(timeInterval: Double(timeSequence[index + subIndex]), action: {
                                    let time = timeSequence[index + subIndex]
                                    if selected.contains(time) {
                                        selected.remove(time)
                                    } else {
                                        selected.insert(time)
                                    }
                                })
                                    .background(selected.contains(timeSequence[index + subIndex]) ? Color("blue.600") : .clear)
                            }
                        }
                    }
                
            }
            .padding(.top, 26)
            .padding(.horizontal, 27)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
        .background(Color(red: 0.09, green: 0.09, blue: 0.09))
        .gesture(
            DragGesture(minimumDistance: 30)
                .onChanged {drag in
                    if let data = podsData.first(where: {$0.bounds.contains(drag.location)}){

                        if !visited.contains(data.index) {
                            if selected.contains(data.index) {
                                selected.remove(data.index)
                            } else {
                                selected.insert(data.index)
                            }
                        }
                        visited.insert(data.index)
                    }
                }
                .onEnded { _ in
                    visited.removeAll()
                }
        )
        .coordinateSpace(name: "PodsContainer")
    }
}

private struct TimeButton: View {
    var timeInterval: TimeInterval
    var action: () -> Void
    var body: some View {
        Button(action: action) {
            Text("\(Date(timeIntervalSince1970: timeInterval).format("yyyy-MM-dd HH:mm"))")
                .font(.custom("NotoSansTC-Regular", size: 16))
                .kerning(0.64)
        }
        .foregroundColor(.white)
        .frame(width: 105, height: 40)
        .overlay(
            GeometryReader { g in
                RoundedRectangle(cornerRadius: 4)
                    .stroke(.white.opacity(0.3), lineWidth: 1)
                    .onAppear(perform: {
                        podsData.insert(PodData(index: Int(self.timeInterval), bounds: g.frame(in: .named("PodsContainer"))))
                    })
            }
        )
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView().preferredColorScheme(.dark)
    }
}
