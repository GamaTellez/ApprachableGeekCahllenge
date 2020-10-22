//
//  ValudationLabel.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/21/20.
//

import UIKit

class ValidationLabel: UILabel {
    private var infoType : ProfileInfo?
    private var stringToCheck : String?
    private var valid : Bool {
        didSet {
            self.textColor = self.valid == true ? UIColor(red: 0, green: 0.7373, blue: 0.1725, alpha: 1.0) : UIColor.red
        }
    }
    
    override init(frame: CGRect) {
        self.valid = false
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = self.font.withSize(13)
        self.numberOfLines = 0
        self.lineBreakMode = .byWordWrapping
        self.textAlignment = .center
        self.adjustsFontSizeToFitWidth = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    internal func isInputValidated(inputOne: String?, inputTwo: String?, for type:ProfileInfo) -> Bool {
        switch type {
        case .name:
            return self.validateName(firstName: inputOne, lastName: inputTwo)
        case .email:
            return self.validateEmail(email: inputOne)
        case .phone:
            return self.validatePhone(phone: inputOne)
        case .about:
            return self.validateAbout(about: inputOne)
        }
    }
    
    private func validateName(firstName: String?, lastName: String?) -> Bool {
        guard let fName = firstName, let lName = lastName else {
            self.update(message: "Oops, either your first or last name are missing.", valid: false)
            return false
        }
        if !self.containsWhites(text: fName) && !self.containsWhites(text: lName) {
            self.update(message: "Great, we are good to go!", valid: true)
            return true
        } else {
            self.update(message: "Oops, either your first or last name is missing.", valid: false)
            return false
        }
    }
    
    private func validateEmail(email: String?) -> Bool {
        guard let eMail = email else {
            self.update(message: "Oops, there is something wrong with your email!", valid: false)
            return false
        }
        if self.isEmailValid(email: eMail) {
            self.update(message: "Sweet!!", valid: true)
            return true
        } else {
            self.update(message: "Oops, there is something wrong with your email!", valid: false)
            return false
        }
        
    }
    
    private func validatePhone(phone: String?) -> Bool {
        guard let pNumber = phone else {
            self.update(message: "Oops, could you check the number again?", valid: false)
            return false
        }
        if pNumber.isEmpty {
            self.update(message: "We really need your number!", valid: false)
            return false
        }
        if isPhoneNumberValid(phone: pNumber) {
            self.update(message: "It looks good!", valid: true)
            return true
        } else {
            self.update(message: "Oops, could you check the number again?", valid: false)
            return false
        }
    }
    
    private func validateAbout(about: String?) -> Bool {
        guard let intro = about else {
            self.update(message: "Oops, make sure to write something about your self!", valid: false)
            return false
        }
        if !self.containsWhites(text: intro) {
            self.update(message: "Awesome, thank you for sharing a little about you!", valid: true)
            return true
        } else {
            self.update(message: "Oops, we really want to know a little about you!", valid: false)
            return false
        }
    }
    
    private func update(message: String, valid: Bool) {
        UIView.transition(with: self, duration: 0.1, options: .transitionCrossDissolve, animations: {
            self.text = message
            self.valid = valid
        }, completion: nil)
    }
    
    private func isEmailValid(email: String) -> Bool {
        let eRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let ePred = NSPredicate(format:"SELF MATCHES %@", eRegEx)
        return ePred.evaluate(with: email)
    }
    
    private func isPhoneNumberValid(phone: String) -> Bool {
                let pRegEx = "^\\d{3}\\d{3}\\d{4}$"
                let pPred = NSPredicate(format: "SELF MATCHES %@", pRegEx)
                return pPred.evaluate(with: phone)
                
            }
    
    private func containsWhites(text:String) -> Bool {
        text.allSatisfy ({ $0.isWhitespace })
    }
    
    internal func clear() {
        self.update(message: "", valid: false)
    }
}




