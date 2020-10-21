//
//  FormView.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/20/20.
//

import UIKit




class FormView: UIView, UITextFieldDelegate, UITextViewDelegate {

    private var infoType : ProfileInfo
    private var name : String?
    private var number : String?
    private var aboutYou : String?
    private var email : String?
    
    private lazy var inputTextFieldOne : UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var inputTextFieldTwo : UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
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
    
    private lazy var validationLabel : UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.layer.borderWidth = 1
        label.layer.borderColor = UIColor.black.cgColor
        label.layer.cornerRadius = 5
        label.translatesAutoresizingMaskIntoConstraints = false
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
            self.inputTextFieldOne.keyboardType = self.infoType == ProfileInfo.email ? UIKeyboardType.emailAddress : UIKeyboardType.namePhonePad
            self.inputTextFieldOne.placeholder = self.infoType == ProfileInfo.email ? "Email" : "Phone"
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
        self.saveButton.addTarget(self, action: #selector(self.saveInfo), for: .touchUpInside)
    }
    
    private func layoutNextView(view: UIView, below yAxisAnchor:NSLayoutYAxisAnchor, centerXAnchor:NSLayoutXAxisAnchor) {
        let height : CGFloat = view == self.aboutYouTextView ? 200 : 30
        NSLayoutConstraint.activate([view.topAnchor.constraint(equalTo: yAxisAnchor, constant: 10),
                                     view.widthAnchor.constraint(equalToConstant: 300),
                                     view.centerXAnchor.constraint(equalTo: centerXAnchor),
                                     view.heightAnchor.constraint(equalToConstant: height)])
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func saveInfo() {
        
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        switch self.infoType {
        case .name:
            
        case .phone:
            
        case .email:
            
        case .about:
        }
    }
}
