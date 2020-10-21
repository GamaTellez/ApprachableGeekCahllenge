//
//  FormVC.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/20/20.
//

import UIKit

class FormVC: UIViewController {
    var form : FormView
    var user : User
    init(user:User, infoToEdit: ProfileInfo) {
        self.form = FormView(frame: CGRect.zero, infoType: infoToEdit)
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
        self.form.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.form)
        NSLayoutConstraint.activate([self.form.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 10),
                                     self.form.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
                                     self.form.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
                                     self.form.heightAnchor.constraint(equalToConstant: 400)])
    }
}
