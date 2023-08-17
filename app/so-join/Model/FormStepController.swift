//
//  FormStepController.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/30.
//

import Foundation

class FormStepController: ObservableObject {
    @Published var step: Int = 1
    
    private var formStepName: [String]
    
    public var currentStepName: String {
        get {
//            guard let name = formStepName[step] else {
//                return "empty_name"
//            }
//            return name
            
            return formStepName[step - 1]
        }
    }
    
    init(formStepName: [String]) {
        self.formStepName = formStepName
    }
    
    func goNextStep () {
        step = step + 1
    }
    
    func goPrevStep () {
        step = step - 1
    }
}
