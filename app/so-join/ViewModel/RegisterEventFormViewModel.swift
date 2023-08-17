//
//  RegisterEventFormViewModel.swift
//  so-join
//
//  Created by Charlie Chiou on 2023/7/30.
//

import Foundation
import Combine
import UIKit
class RegisterEventFormViewModel: ObservableObject {
    @Published var nickname: String = ""
    
    //    init() {
    //        if let restaurant = restaurant {
    //            self.name = restaurant.name
    //            self.type = restaurant.type
    //            self.location = restaurant.location
    //            self.phone = restaurant.phone
    //            self.description = restaurant.summary
    //            self.image = UIImage(data: restaurant.image!) ?? UIImage()
    //        }
    //    }
}

