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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.font = self.font.withSize(10)
        self.numberOfLines = 0
        self.textAlignment = .center
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    internal func validateInput(inputOne: String?, inputTwo: String?, for type:ProfileInfo) -> Bool {
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
            self.updateText(message: "Oops, either your first or last name are missing...")
            return false
        }
        if !self.containsWhites(text: fName) && !self.containsWhites(text: lName) {
            self.updateText(message: "Great, we are good to go!")
            return true
        } else {
            self.updateText(message: "Oops, either your first or last name are missing...")
            return false
        }
    }
    
    private func validateEmail(email: String?) -> Bool {
        guard let eMail = email else {
            self.updateText(message: "Oops, there is something wrong with your email!")
            return false
        }
        if self.isEmailValid(email: eMail) {
            self.updateText(message: "Sweet!, looks good to me!")
            return true
        } else {
            self.updateText(message: "Oops, there is something wrong with your email!")
            return false
        }
        
    }
    
    private func validatePhone(phone: String?) -> Bool {
        guard let pNumber = phone else {
            self.updateText(message: "Oops, could you check the number again?")
            return false
        }
        if pNumber.isEmpty {
            self.updateText(message: "We really need your number!")
            return false
        }
        if isPhoneNumberValid(phone: pNumber) {
            self.updateText(message: "It looks right to us!")
            return true
        } else {
            self.updateText(message: "Oops, could you check the number again?")
            return false
        }
    }
    
    private func validateAbout(about: String?) -> Bool {
        guard let intro = about else {
            self.updateText(message: "Oops, make sure to write something about your self!")
            return false
        }
        if !self.containsWhites(text: intro) {
            self.updateText(message: "Awesome, thank you for sharing a little about you!")
            return true
        } else {
            self.updateText(message: "Oops, we really want to know a little about you!")
            return false
        }
    }
    
    private func updateText(message: String) {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.text = message
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
        self.updateText(message: "")
    }
}




