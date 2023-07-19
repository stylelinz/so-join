//
//  CreateView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/9.
//

import SwiftUI

class FormStepController: ObservableObject {
    @Published var step: Int = 1
    
    func goNextStep () {
        step = step + 1
    }
    
    func goPrevStep () {
        step = step - 1
    }
}

let Duration = ["30", "60", "90", "120", "180"]

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var formStepController = FormStepController()
    @ObservedObject private var eventFormViewModel = EventFormViewModel()
    
    private var goNextAvailable: Bool {
        get {
            if formStepController.step == 1 {
                return !eventFormViewModel.nickname.isEmpty
            } else {
                return false
            }
        }
    }
    
    private var currentStepName: String {
        get {
            if formStepController.step == 1 {
                return "暱稱"
            }
            
            if formStepController.step == 2 {
                return "建立活動"
            }
            
            return ""
        }
    }
    
    var body: some View {
        NavigationStack {
            ScrollView(.vertical, showsIndicators: false) {
                FormSwitcherView(step: formStepController.step)
                .padding(.top, 0)
                .padding(.horizontal, 20)
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
                        Text(currentStepName).font(.custom("NotoSansTC-medium", size: 18)).kerning(0.72)
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
            }.id(formStepController.step)
        }
        .environmentObject(eventFormViewModel)
        .environmentObject(formStepController)
    }
}

struct FormSwitcherView: View {
    var step: Int
    var body: some View {
        switch step {
        case 1:
            NicknameInput()
        case 2:
            TimeInput()
        default:
            Text("Error")
        }
    }
}

struct NicknameInput: View {
    @EnvironmentObject var eventFormViewModel: EventFormViewModel
    @EnvironmentObject var formStepController: FormStepController
    @FocusState private var show: Bool
    var body: some View {
        VStack(alignment: .center, spacing: 39) {
            VStack(alignment: .leading) {
                TextField("輸入暱稱", text: $eventFormViewModel.nickname)
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
            
            Button(action: formStepController.goNextStep) {
                Text("確定").font(.custom("NotoSansTC-Medium", size: 18)).kerning(0.72)
            }
            .frame(width: 96, height: 48)
            .background(eventFormViewModel.nickname.isEmpty ? Color("white.alpha.200") : Color("blue.600"))
            .foregroundColor(eventFormViewModel.nickname.isEmpty ? .white.opacity(0.2) : .white)
            .cornerRadius(50)
            .disabled(eventFormViewModel.nickname.isEmpty)
            
            Spacer()
        }
    }
}

struct TimeInput: View {
    @State private var test = ""
    @State private var choosenDates: Set<Date> = []
    @State private var timeStart: Date = Date()
    @State private var timeEnd: Date = Date()
    @State private var time: String = "30"
    @State private var dates: Set<DateComponents> = []
    
    var body: some View {
        VStack(spacing: 26) {
            VStack(alignment: .leading, spacing: 12) {
                Text("活動名稱")
                    .font(.custom("NotoSansTC-medium", size: 18))
                    .kerning(0.72)
                    .foregroundColor(.white.opacity(0.9))
                TextField("", text: $test)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 17)
                    .frame(height: 46)
                    .background(Color("gray.800"))
                    .cornerRadius(7)
            }
            
            VStack(alignment: .leading, spacing: 18) {
                Text("選擇日期")
                    .font(.custom("NotoSansTC-medium", size: 18))
                    .kerning(0.72)
                    .foregroundColor(.white.opacity(0.9))

                CalendarPickerView(choosenDates: $choosenDates)
            }
            VStack(alignment: .leading, spacing: 28) {
                Text("時間區間")
                    .font(.custom("NotoSansTC-medium", size: 18))
                    .kerning(0.72)
                    .foregroundColor(.white.opacity(0.9))
                
                HStack(spacing: 20) {
                    Text("從")
                        .font(.custom("NotoSansTC-medium", size: 18))
                        .foregroundColor(.white.opacity(0.9))
                            
                    ZStack {
                        DatePicker("", selection: $timeStart,  displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .frame(maxWidth: .infinity)
                            .scaleEffect(x:5,y:1)
                            .clipped()
                           
                        Text(timeStart.formatted(date: .omitted, time: .shortened))
                            .font(.custom("NotoSansTC-medium", size: 18))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("gray.800"))
                            .allowsHitTesting(false)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 17)
                    .frame(maxWidth: .infinity, maxHeight: 46)
                    .background(Color("gray.800"))
                    .cornerRadius(7)
                    
                }
                

                HStack(spacing: 20) {
                    Text("到")
                        .font(.custom("NotoSansTC-medium", size: 18))
                        .foregroundColor(.white.opacity(0.9))
                    
                    ZStack {
                        DatePicker("", selection: $timeEnd,  displayedComponents: .hourAndMinute)
                            .labelsHidden()
                            .frame(maxWidth: .infinity)
                            .scaleEffect(x:5,y:1)
                            .clipped()
                        
                        Text(timeEnd.formatted(date: .omitted, time: .shortened))
                            .font(.custom("NotoSansTC-medium", size: 18))
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .background(Color("gray.800"))
                            .allowsHitTesting(false)
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 17)
                    .frame(maxWidth: .infinity, maxHeight: 46)
                    .background(Color("gray.800"))
                    .cornerRadius(7)
                    
                }
            }
            
            VStack(alignment: .leading, spacing: 12) {
                Text("時間長度")
                    .font(.custom("NotoSansTC-medium", size: 18))
                    .kerning(0.72)
                    .foregroundColor(.white.opacity(0.9))

                ZStack {
                    Picker("Flavor", selection: $time) {
                        ForEach(Duration, id: \.self) {
                            Text("\($0)mins")
                        }
                    }
                    .pickerStyle(.menu)
                    .labelsHidden()
                    .frame(maxWidth: .infinity)
                    .scaleEffect(x:5,y:1)
                    .clipped()
                    
                    HStack {
                        Text("\(time)mins")
                            .font(.custom("NotoSansTC-medium", size: 18))
                        Spacer()
                        Image(systemName: "chevron.down")
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color("gray.800"))
                    .allowsHitTesting(false)


                }
                .padding(.vertical, 10)
                .padding(.horizontal, 17)
                .frame(maxWidth: .infinity, maxHeight: 46)
                .background(Color("gray.800"))
                .cornerRadius(7)
            }
            
            Spacer()
        }
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            CreateView().preferredColorScheme(.dark)
        }
    }
}
