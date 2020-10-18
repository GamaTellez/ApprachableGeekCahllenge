//
//  ProfileImage.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/13/20.
//

import Foundation
import UIKit

protocol ImageProfileDelegate {
    func editProfileImageButtonTapped()
}

class ImageProfile : UIView {
    private var imageName : String?
    internal var width : CGFloat = 250
    private var editImageButton : UIButton?
    internal var imageDelegate : ImageProfileDelegate?
    private var profileImageView = UIImageView()
    
    
    convenience init(frame: CGRect, imageName: String?) { //How to force use this init?
        self.init(frame:frame)
        self.imageName = imageName
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setUp()
        
    }
    
    private func setUp() {
        self.profileImageView.image = UIImage(named: self.imageName ?? "silhouette")
        self.profileImageView.frame = CGRect(x: 0, y: 0, width: self.width, height: self.width)
        self.profileImageView.layer.cornerRadius = self.width / 2
        self.profileImageView.isUserInteractionEnabled = true
        self.profileImageView.clipsToBounds = true
        self.profileImageView.layer.borderWidth = 5
        self.profileImageView.contentMode = .scaleAspectFill
        self.profileImageView.layer.borderColor = UIColor.blue.cgColor
        self.addSubview(self.profileImageView)
        
        let editImageButton = UIButton(frame: CGRect(x: self.width - 60, y: 20, width: 40, height: 40))
        editImageButton.backgroundColor = UIColor.white
        editImageButton.tintColor = UIColor.blue
        editImageButton.layer.cornerRadius = editImageButton.frame.width / 2
        editImageButton.clipsToBounds = true
        editImageButton.layer.borderColor = UIColor.blue.cgColor
        editImageButton.layer.borderWidth = 1
        editImageButton.setImage(UIImage(named: "edit")?.withRenderingMode(.alwaysTemplate), for: .normal)
        editImageButton.addTarget(self, action: #selector(self.editImageButtonTapped), for: .touchUpInside)
        self.addSubview(editImageButton)
        self.editImageButton = editImageButton
    }
    
    @objc func editImageButtonTapped() {
        guard let delegate = self.imageDelegate else {
            print("Image deleagate is nil")
            return
        }
        delegate.editProfileImageButtonTapped()
    }
    
    internal func updateImageProfile(newImage:UIImage) {
        self.profileImageView.image = newImage
    }
}

