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
    
    internal func updateInfo(infoType: ProfileInfo, inputOne: String?, inputTwo: String?) {
        switch infoType {
        case .name:
            self.firstName = inputOne
            self.lastName = inputTwo
        case .phone: self.phone = inputOne?.toPhoneFormat()
        case .email: self.email = inputOne
        case .about: self.about = inputOne
        }
    }

    internal func updateImage(image: UIImage) {
        self.profileImage = image
    }
}

extension String {
    public func toPhoneFormat() -> String {
         return self.replacingOccurrences(of: "(\\d{3})(\\d{3})(\\d+)", with: "($1) $2-$3", options: .regularExpression, range: nil)
    }
    
    public func toPlainNumber() -> String {
        return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}
