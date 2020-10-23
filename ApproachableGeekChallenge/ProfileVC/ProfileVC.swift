//
//  ProfileVC.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/13/20.
//

import UIKit
import PhotosUI

class ProfileVC: UIViewController, ImageProfileDelegate, UIImagePickerControllerDelegate, PHPickerViewControllerDelegate, UINavigationControllerDelegate, UITableViewDelegate {
    
    private var user = User()
    internal var imageProfile : ImageProfile
    internal var infoTableView : InfoTableView
    private lazy var imagePickerController = UIImagePickerController()
    private var pHPickerConfiguration : PHPickerConfiguration {
        var configuration = PHPickerConfiguration()
        configuration.filter = .images
        return configuration
    }

    init() {
        self.imageProfile = ImageProfile(frame: CGRect.zero, imageName: nil)
        self.infoTableView = InfoTableView(frame: CGRect.zero, user: self.user)
        super.init(nibName: nil, bundle: nil)
        self.title = "My Profile"
        self.imageProfile.imageDelegate = self
        self.infoTableView.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
        
    override func loadView() {
        super.loadView()
        self.viewsSetUp()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let selectedRowPath = self.infoTableView.indexPathForSelectedRow else { return }
        self.infoTableView.reloadRows(at: [selectedRowPath], with: .fade)
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
    
    
    //Mark: Profile Image
    private func selectImageFromLibrary() {
        let imagePicker = PHPickerViewController(configuration: self.pHPickerConfiguration)
        imagePicker.delegate = self
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        picker.dismiss(animated: true) {
            if !results.isEmpty {
                results[0].itemProvider.loadObject(ofClass: UIImage.self) { (imageObj, error) in
                    if let image = imageObj as? UIImage {
                        DispatchQueue.main.async {
                            self.imageProfile.updateImageProfile(newImage: image)
                        }
                    } else {
                        print("Failed to get image from library")
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
        }
    }
    
    //MARK: info table view
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tableView.deselectRow(at: indexPath, animated: true)
        
        var infoToEdit : ProfileInfo = .name
        switch indexPath.row {
        case 0: infoToEdit = .name
        case 1: infoToEdit = .phone
        case 2: infoToEdit = .email
        case 3: infoToEdit = .about
        default:infoToEdit = .name
        }
        self.navigationController?.pushViewController(FormVC(user: self.user, infoToEdit: infoToEdit), animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 3 && self.user.about != nil {
            return 130
        } else {
            return 70
        }
    }
}


