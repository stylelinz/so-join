//
//  CreateView.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/9.
//

import SwiftUI

let Duration = ["30", "60", "90", "120", "180"]

struct CreateView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject private var formStepController = FormStepController(formStepName: ["暱稱", "建立活動"])
    @ObservedObject private var eventFormViewModel = CreateEventFormViewModel()
    
    private var goNextAvailable: Bool {
        get {
            if formStepController.step == 1 {
                return !eventFormViewModel.nickname.isEmpty
            } else if formStepController.step == 2  {
                //TODO
                return true
            } else {
                return false
            }
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
                        Text(formStepController.currentStepName).font(.custom("NotoSansTC-medium", size: 18)).kerning(0.72)
                    }
                    ToolbarItem (placement: .navigationBarTrailing) {
                        ZStack {
                            if formStepController.step == 2 {
                                NavigationLink(destination: InviteView(onDismiss: { dismiss() }).navigationBarBackButtonHidden(true)) {
                                    Text("下一步")
                                        .font(.custom("NotoSansTC-regular", size: 16))
                                        .kerning(0.64)
                                        .foregroundColor(goNextAvailable ? .white : .white.opacity(0.3))
                                }
                            } else {
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
                }
            }.id(formStepController.step)
        }
        .environmentObject(eventFormViewModel)
        .environmentObject(formStepController)
    }
}

private struct FormSwitcherView: View {
    @EnvironmentObject var eventFormViewModel: CreateEventFormViewModel
    @EnvironmentObject var formStepController: FormStepController
    
    var step: Int
    var body: some View {
        switch step {
        case 1:
            NicknameInput(nickname: $eventFormViewModel.nickname, confirmAction: formStepController.goNextStep)
        case 2:
            TimeInput()
        default:
            Text("Error")
        }
    }
}

private struct TimeInput: View {
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
