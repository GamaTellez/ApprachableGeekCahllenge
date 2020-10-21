//
//  User.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/13/20.
//

import Foundation
import UIKit

class User {
    private(set) var name : String?
    private(set) var phone : String?
    private(set) var email : String?
    private(set) var about : String?
    private(set) var profileImage : UIImage?
    
    init(name: String?, phone: String?, email: String?, intro: String?, profileImage: UIImage?) {
        self.name = name
        self.phone = phone
        self.email = email
        self.about = intro
        self.profileImage = profileImage
    }
    
}
