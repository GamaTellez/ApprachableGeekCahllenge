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
    
    internal func savedPhotoTakenToLibraryAlert(imageToSave: UIImage) {
        let savePhotoAlert = UIAlertController(title: "New Photo Taken", message: "Would you like to save the new photo to your library?", preferredStyle: .alert)
        savePhotoAlert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { action in
            
        }))
        savePhotoAlert.addAction(UIAlertAction(title: "No", style: .default, handler: { action in
            UIImageWriteToSavedPhotosAlbum(imageToSave, nil, nil, nil)
        }))
    }
}
