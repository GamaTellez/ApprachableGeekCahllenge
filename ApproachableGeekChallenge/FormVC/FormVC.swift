//
//  FormVC.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/20/20.
//

import UIKit

class FormVC: UIViewController, UITextViewDelegate, UITextFieldDelegate {
    var user : User

    internal var infoType : ProfileInfo
    private var inputOne : String?
    private var inputTwo : String?
        
    
    internal lazy var inputTextFieldOne : UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        return textField
    }()
    
    internal lazy var inputTextFieldTwo : UITextField = {
        let textField = UITextField(frame: CGRect.zero)
        textField.borderStyle = .roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.returnKeyType = .done
        return textField
    }()
    
    internal lazy var aboutYouTextView : UITextView = {
        let textView = UITextView(frame: CGRect.zero)
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.layer.borderColor = UIColor.lightGray.cgColor
        textView.layer.borderWidth = 1
        textView.layer.cornerRadius = 5
        return textView
    }()
    
    internal lazy var validationLabel :  ValidationLabel = {
        let label = ValidationLabel(frame: CGRect.zero)
        return label
    }()
    
    internal var saveButton : ActivityButton = {
        let button = ActivityButton(frame: CGRect.zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Save", for: .normal)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 5
        return button
    }()
    
    init(user:User, infoToEdit: ProfileInfo) {
        self.infoType = infoToEdit
        self.user = user
        super.init(nibName: nil, bundle: nil)
        self.view.backgroundColor = .white
        self.title = infoToEdit.infoType
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        self.setUpViews()
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
        
        if  self.validationLabel.isInputValidated(inputOne: self.inputOne, inputTwo: self.inputTwo, for: self.infoType) {
            self.resignFirstResponder()
            self.saveButton.showActivity()
            self.saveButton.removeActivity {
                self.user.updateInfo(infoType: self.infoType, inputOne: self.inputOne, inputTwo: self.inputTwo)
                    self.navigationController?.popViewController(animated: true)
            }
        }
    }
}
