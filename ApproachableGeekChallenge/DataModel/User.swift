//
//  User.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/13/20.
//

import Foundation
import UIKit

class User {
    private(set) var firstName : String?
    private(set) var lastName : String?
    private(set) var phone : String?
    private(set) var email : String?
    private(set) var about : String?
    private(set) var profileImage : UIImage?
    
    init(name: String?, phone: String?, email: String?, intro: String?, profileImage: UIImage?) {
        self.firstName = name
        self.phone = phone
        self.email = email
        self.about = intro
        self.profileImage = profileImage
    }
    
    internal func updateInfo(infoType: ProfileInfo, inputOne: String?, inputTwo: String?) {
        switch infoType {
        case .name:
            self.firstName = inputOne
            self.lastName = inputTwo
        case .phone: self.phone = inputOne
        case .email: self.email = inputOne
        case .about: self.about = inputOne
        }
    }
}
