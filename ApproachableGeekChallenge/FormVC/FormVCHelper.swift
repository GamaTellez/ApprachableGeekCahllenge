//
//  FormVCHelper.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/21/20.
//

import Foundation
import UIKit

extension FormVC {
    internal func setUpViews() {
        self.saveButton.addTarget(self, action: #selector(self.saveInfoButtonTapped), for: .touchUpInside)
        
        if self.infoType == .email || self.infoType == .phone {
            self.inputTextFieldOne.keyboardType = self.infoType == ProfileInfo.email ? UIKeyboardType.emailAddress : UIKeyboardType.phonePad
            self.inputTextFieldOne.delegate = self
            self.inputTextFieldOne.inputAccessoryView = self.saveButton
            self.inputTextFieldOne.text = self.infoType == ProfileInfo.email ? self.user.email ?? "" : self.user.phone?.toPlainNumber()
            self.inputTextFieldOne.becomeFirstResponder()
            self.view.addSubview(self.inputTextFieldOne)
            self.layoutNextView(view: self.inputTextFieldOne, below: self.view.safeAreaLayoutGuide.topAnchor, parentView: self.view, infoType: self.infoType)
            self.view.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.inputTextFieldOne.bottomAnchor, parentView: self.view, infoType: self.infoType)
        }
        
        if self.infoType == .name {
            self.inputTextFieldOne.keyboardType = .namePhonePad
            self.inputTextFieldOne.delegate = self
            self.inputTextFieldOne.inputAccessoryView = self.saveButton
            self.inputTextFieldOne.text = self.user.firstName ?? ""
            self.inputTextFieldOne.becomeFirstResponder()
            self.view.addSubview(self.inputTextFieldOne)
            self.layoutNextView(view: self.inputTextFieldOne, below: self.view.safeAreaLayoutGuide.topAnchor, parentView: self.view, infoType: self.infoType)
            self.inputTextFieldTwo.keyboardType = .namePhonePad
            self.inputTextFieldTwo.delegate = self
            self.inputTextFieldTwo.inputAccessoryView = self.saveButton
            self.inputTextFieldTwo.text = self.user.lastName ?? ""
            self.view.addSubview(self.inputTextFieldTwo)
            self.layoutNextView(view: self.inputTextFieldTwo, below: self.inputTextFieldOne.bottomAnchor, parentView: self.view, infoType: self.infoType)
            self.view.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.inputTextFieldTwo.bottomAnchor, parentView: self.view, infoType: self.infoType)
        }
        
        if self.infoType == .about {
            self.view.addSubview(self.aboutYouTextView)
            self.aboutYouTextView.delegate = self
            self.aboutYouTextView.layer.borderWidth = 0
            self.aboutYouTextView.inputAccessoryView = self.saveButton
            self.aboutYouTextView.becomeFirstResponder()
            self.aboutYouTextView.text = self.user.about ?? ""
            self.layoutNextView(view: self.aboutYouTextView, below: self.view.safeAreaLayoutGuide.topAnchor, parentView: self.view, infoType: self.infoType)
            self.view.addSubview(self.validationLabel)
            
            self.layoutNextView(view: self.validationLabel, below: self.aboutYouTextView.bottomAnchor, parentView: self.view, infoType: self.infoType)
        }
    }
    private func layoutNextView(view: UIView, below yAxisAnchor:NSLayoutYAxisAnchor, parentView: UIView, infoType: ProfileInfo) {
        var height:CGFloat = 0
        
        if view == self.inputTextFieldOne || view == self.inputTextFieldTwo {
            height = 40
        }
        
        if view == self.validationLabel {
            height = 40
        }
        if view == self.aboutYouTextView {
            height = 200
        }
        if view == self.saveButton {
            height = 50
        }
    
        
        if view != self.validationLabel && view != self.saveButton {
            let label = UILabel(frame: CGRect.zero)
            label.translatesAutoresizingMaskIntoConstraints = false
            
            label.text = infoType == ProfileInfo.name ? view == self.inputTextFieldOne ? "First Name" : "Last Name" : infoType.type
            label.font = UIFont.systemFont(ofSize: 10)
            self.view.addSubview(label)
            
            NSLayoutConstraint.activate([label.topAnchor.constraint(equalTo: yAxisAnchor, constant: 1),
                                         label.leadingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                                         label.widthAnchor.constraint(equalToConstant: 300),
                                         label.heightAnchor.constraint(equalToConstant: 50)])
        }
        
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: yAxisAnchor, constant: 30),
                                     view.widthAnchor.constraint(equalToConstant: 300),
                                     view.centerXAnchor.constraint(equalTo: parentView.centerXAnchor),
                                     view.heightAnchor.constraint(equalToConstant: height)])
        
        if view != self.validationLabel && view != self.saveButton {
            let line = UIView(frame: CGRect.zero)
            line.translatesAutoresizingMaskIntoConstraints = false
            line.backgroundColor = UIColor.lightGray
            self.view.addSubview(line)
            NSLayoutConstraint.activate([line.leadingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.leadingAnchor, constant: 10),
                                         line.trailingAnchor.constraint(equalTo: parentView.safeAreaLayoutGuide.trailingAnchor, constant: -10),
                                         line.heightAnchor.constraint(equalToConstant: 0.5),
                                         line.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 2)])
        }
    }
}


