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
            Group {
                FormSwitcherView(step: formStepController.step)
            }
            .padding(.horizontal, 20)
            .toolbar {
                ToolbarItem (placement: .navigationBarLeading) {
                    Button(action: formStepController.goPrevStep) {
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
            .environmentObject(eventFormViewModel)
            .environmentObject(formStepController)
        }
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
    var body: some View {
        Text("TEST")
    }
}

struct CreateView_Previews: PreviewProvider {
    static var previews: some View {
        WrapWithBackground {
            CreateView()
        }
    }
}
