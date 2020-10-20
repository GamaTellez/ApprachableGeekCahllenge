//
//  ProfileVCHelper.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/15/20.
//

import Foundation
import UIKit

extension ProfileVC {
    internal func editProfileImageAlert(takeNewFunction: @escaping ()-> Void, selectFromLibraryFunction: @escaping ()-> Void) -> UIAlertController {
        let editProfileImageAlert = UIAlertController(title: "Edit Profile Image", message: "Would you like to take a new picture or select one from your library?", preferredStyle: .actionSheet)
        editProfileImageAlert.addAction(UIAlertAction(title: "New Picture", style: .default, handler: { action in
            takeNewFunction()
        }))
        editProfileImageAlert.addAction(UIAlertAction(title: "Select From Library", style: .default, handler: { action in
            selectFromLibraryFunction()
        }))
        editProfileImageAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        return editProfileImageAlert
    }
    
    internal func imagePickerControllerSorceAlert() -> UIAlertController {
        let imageSourceAlert = UIAlertController(title: "Oops!", message: "It looks like we don't have access to your camera or photos", preferredStyle: .alert)
        imageSourceAlert.addAction(UIAlertAction(title: "App Settings", style: .default, handler: { (action) in
            guard let settingsURL = URL(string: UIApplication.openSettingsURLString) else {
                print("Failed to get app settings URL")
                return
            }
            UIApplication.shared.open(settingsURL, options: [:], completionHandler: nil)
        }))
        imageSourceAlert.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        return imageSourceAlert
    }
    
    internal func viewsSetUp() {
        self.view.backgroundColor = UIColor.white
        self.imageProfile.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.imageProfile)
        NSLayoutConstraint.activate([self.imageProfile.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
                                     self.imageProfile.heightAnchor.constraint(equalToConstant: self.imageProfile.width),
                                     self.imageProfile.widthAnchor.constraint(equalToConstant: self.imageProfile.width),
                                     self.imageProfile.centerXAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerXAnchor)])
        
        
        self.infoTableView.translatesAutoresizingMaskIntoConstraints = false
        self.infoTableView.isScrollEnabled = false
        self.view.addSubview(self.infoTableView)
        NSLayoutConstraint.activate([self.infoTableView.topAnchor.constraint(equalTo: self.imageProfile.safeAreaLayoutGuide.bottomAnchor, constant: 10),
                                     self.infoTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
                                     self.infoTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -30),
                                     self.infoTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)])
    }
    
}
