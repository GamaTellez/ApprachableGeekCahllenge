//
//  FormView.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/20/20.
//

import UIKit




class FormView: UIView, UITextFieldDelegate, UITextViewDelegate {

    private var infoType : ProfileInfo
    private var inputOne : String?
    private var inputTwo : String?
    
    private lazy var inputTextFieldOne : UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        return textField
    }()
    
    private lazy var inputTextFieldTwo : UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        return textField
    }()
    
    private lazy var aboutYouTextView : UITextView = {
        let textView = UITextView(frame: CGRect.zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    private lazy var validationLabel :  ValidationLabel = {
        let label = ValidationLabel(frame: CGRect.zero)
        return label
    }()
    
    private var saveButton : UIButton = {
        let button = UIButton(frame: CGRect.zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor.blue
        return button
    }()
    
    init(frame:CGRect, infoType:ProfileInfo) {
        self.infoType = infoType
        super.init(frame: frame)
        
        
        if self.infoType == .email || self.infoType == .phone {
            self.inputTextFieldOne.keyboardType = self.infoType == ProfileInfo.email ? UIKeyboardType.emailAddress : UIKeyboardType.phonePad
            self.inputTextFieldOne.placeholder = self.infoType == ProfileInfo.email ? "Email" : "Phone (just numbers)."
            self.inputTextFieldOne.delegate = self
            self.addSubview(self.inputTextFieldOne)
            self.layoutNextView(view: self.inputTextFieldOne, below: self.safeAreaLayoutGuide.topAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
            self.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.inputTextFieldOne.bottomAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
        }
        
        if self.infoType == .name {
            self.inputTextFieldOne.keyboardType = .namePhonePad
            self.inputTextFieldOne.placeholder = "Fist Name"
            self.inputTextFieldOne.delegate = self
            self.addSubview(self.inputTextFieldOne)
            self.layoutNextView(view: self.inputTextFieldOne, below: self.safeAreaLayoutGuide.topAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
            self.inputTextFieldTwo.keyboardType = .namePhonePad
            self.inputTextFieldTwo.placeholder = "Last Name"
            self.inputTextFieldTwo.delegate = self
            self.addSubview(self.inputTextFieldTwo)
            self.layoutNextView(view: self.inputTextFieldTwo, below: self.inputTextFieldOne.bottomAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
            self.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.inputTextFieldTwo.bottomAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
        }
        
        if self.infoType == .about {
            self.addSubview(self.aboutYouTextView)
            self.aboutYouTextView.delegate = self
            self.layoutNextView(view: self.aboutYouTextView, below: self.safeAreaLayoutGuide.topAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
            self.addSubview(self.validationLabel)
            self.layoutNextView(view: self.validationLabel, below: self.aboutYouTextView.bottomAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
        }
        
        self.addSubview(self.saveButton)
        self.layoutNextView(view: self.saveButton, below: self.validationLabel.bottomAnchor, centerXAnchor: self.safeAreaLayoutGuide.centerXAnchor)
        self.saveButton.addTarget(self, action: #selector(self.saveInfoButtonTapped), for: .touchUpInside)
    }
    
    private func layoutNextView(view: UIView, below yAxisAnchor:NSLayoutYAxisAnchor, centerXAnchor:NSLayoutXAxisAnchor) {
        let height : CGFloat = view == self.aboutYouTextView ? 200 : 50
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: yAxisAnchor, constant: 10),
                                     view.widthAnchor.constraint(equalToConstant: 300),
                                     view.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     view.heightAnchor.constraint(equalToConstant: height)])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        self.validationLabel.clear()
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.saveInfoButtonTapped()
        return true
    }
    
    func textViewDidChange(_ textView: UITextView) {
        self.validationLabel.clear()
    }
    
    @objc func saveInfoButtonTapped() {
        if self.infoType == .name {
            self.inputOne = self.inputTextFieldOne.text
            self.inputTwo = self.inputTextFieldTwo.text
        }
        
        if self.infoType == .about {
            self.inputOne = self.aboutYouTextView.text
        }
        
        if self.infoType == .phone || self.infoType == .email {
            self.inputOne = self.inputTextFieldOne.text
        }
        if  self.validationLabel.validateInput(inputOne: self.inputOne, inputTwo: self.inputTwo, for: self.infoType) {
            
        }
    }
}
