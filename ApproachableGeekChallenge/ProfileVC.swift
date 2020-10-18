//
//  ProfileVC.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/13/20.
//

import UIKit
import PhotosUI

class ProfileVC: UIViewController, ImageProfileDelegate, UIImagePickerControllerDelegate, PHPickerViewControllerDelegate, UINavigationControllerDelegate {
    
    private var user : User?
    private var imageProfile : ImageProfile
    private lazy var imagePickerController = UIImagePickerController()
    private var pHPickerConfiguration : PHPickerConfiguration {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        return configuration
    }

    init() {
        self.imageProfile = ImageProfile(frame: CGRect.zero, imageName: nil)
        super.init(nibName: nil, bundle: nil)
        self.imageProfile.imageDelegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewSetUP()
    }
    
    
    internal func editProfileImageButtonTapped() {
        self.present(self.editProfileImageAlert(takeNewFunction: self.takeNewImage,
                                                selectFromLibraryFunction: self.selectImageFromLibrary),
                                                animated: true,
                                                completion: nil)
    }
    
    private func takeNewImage() {
        self.imagePickerController.delegate = self
        if (UIImagePickerController.isSourceTypeAvailable(.camera)) {
            self.imagePickerController.sourceType = .camera
            self.imagePickerController.allowsEditing = true
            self.present(self.imagePickerController, animated: true, completion: nil)
        } else {
            self.present(self.imagePickerControllerSorceAlert(), animated: true, completion: nil)
        }
    }
    
    private func selectImageFromLibrary() {
        let imagePicker = PHPickerViewController(configuration: self.pHPickerConfiguration)
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) {
            if !results.isEmpty {
                results[0].itemProvider.loadObject(ofClass: UIImage.self) { (imageObj, errir) in
                    if let image = imageObj as? UIImage {
                        DispatchQueue.main.async {
                            self.imageProfile.updateImageProfile(newImage: image)
                        }
                    }
                }
            }
        }
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true) {
            guard let imagedPicked = info[.originalImage] as? UIImage else {
                print("Failed to get image taken")
                return
            }
            self.imageProfile.updateImageProfile(newImage: imagedPicked)
            if (picker.sourceType == .camera) {
                self.savedPhotoTakenToLibraryAlert(imageToSave: imagedPicked)
            }
        }
    }
    
    private func viewSetUP() {
        self.view.backgroundColor = UIColor.white
        self.imageProfile.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.imageProfile)
        NSLayoutConstraint.activate([self.imageProfile.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
                                     self.imageProfile.heightAnchor.constraint(equalToConstant: self.imageProfile.width),
                                     self.imageProfile.widthAnchor.constraint(equalToConstant: self.imageProfile.width),
                                     self.imageProfile.centerXAnchor.constraint(equalTo:self.view.safeAreaLayoutGuide.centerXAnchor)])
    }
}


