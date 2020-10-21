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
        if self.infoType == .email || self.infoType == .phone {
            self.inputTextFieldOne.keyboardType = self.infoType == ProfileInfo.email ? UIKeyboardType.emailAddress : UIKeyboardType.phonePad
            self.inputTextFieldOne.placeholder = self.infoType == ProfileInfo.email ? "Email" : "Phone (just numbers)."
            self.inputTextFieldOne.delegate = self
            self.view.addSubview(self.inputTextFieldOne)
            self.layoutNextView(view: self.inputTextFieldOne, below: self.view.safeAreaLayoutGuide.topAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
            self.view.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.inputTextFieldOne.bottomAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
        }
        
        if self.infoType == .name {
            self.inputTextFieldOne.keyboardType = .namePhonePad
            self.inputTextFieldOne.placeholder = "Fist Name"
            self.inputTextFieldOne.delegate = self
            self.view.addSubview(self.inputTextFieldOne)
            self.layoutNextView(view: self.inputTextFieldOne, below: self.view.safeAreaLayoutGuide.topAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
            self.inputTextFieldTwo.keyboardType = .namePhonePad
            self.inputTextFieldTwo.placeholder = "Last Name"
            self.inputTextFieldTwo.delegate = self
            self.view.addSubview(self.inputTextFieldTwo)
            self.layoutNextView(view: self.inputTextFieldTwo, below: self.inputTextFieldOne.bottomAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
            self.view.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.inputTextFieldTwo.bottomAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
        }
        
        if self.infoType == .about {
            self.view.addSubview(self.aboutYouTextView)
            self.aboutYouTextView.delegate = self
            self.layoutNextView(view: self.aboutYouTextView, below: self.view.safeAreaLayoutGuide.topAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
            self.view.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.aboutYouTextView.bottomAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
        }
        
        self.view.addSubview(self.saveButton)
        self.layoutNextView(view: self.saveButton, below: self.validationLabel.bottomAnchor, centerXAnchor: self.view.safeAreaLayoutGuide.centerXAnchor)
        self.saveButton.addTarget(self, action: #selector(self.saveInfoButtonTapped), for: .touchUpInside)
        
        
    }
    private func layoutNextView(view: UIView, below yAxisAnchor:NSLayoutYAxisAnchor, centerXAnchor:NSLayoutXAxisAnchor) {
        let height : CGFloat = view == self.aboutYouTextView ? 200 : 50
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: yAxisAnchor, constant: 10),
                                     view.widthAnchor.constraint(equalToConstant: 300),
                                     view.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     view.heightAnchor.constraint(equalToConstant: height)])
    }
}


