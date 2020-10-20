//
//  InfoTableViewCell.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/19/20.
//

import UIKit

class InfoTableViewCell: UITableViewCell {
    static let infoCellIdentifier = "inforCellIdentifier"
    
    private let titleLabel : UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor.gray
        label.font = UIFont.systemFont(ofSize: 10)
        return label
    }()
    
    private let infoLabel : UILabel = {
        let label = UILabel(frame: CGRect.zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let disclosureImage : UIImageView = {
        let imageView = UIImageView(frame: CGRect.zero)
        imageView.image = UIImage(named: "cellDisclosure")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor.gray
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.addSubview(self.titleLabel)
        NSLayoutConstraint.activate([self.titleLabel.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 5),
                                     self.titleLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 5),
                                     self.titleLabel.widthAnchor.constraint(equalToConstant: 150.0),
                                     self.titleLabel.heightAnchor.constraint(equalToConstant: 20)])
        self.addSubview(self.infoLabel)
        NSLayoutConstraint.activate([self.infoLabel.topAnchor.constraint(equalTo: self.titleLabel.bottomAnchor, constant: 10),
                                     self.infoLabel.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
                                     self.infoLabel.trailingAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -50),
                                     self.infoLabel.bottomAnchor.constraint(greaterThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -5)])
        
        self.addSubview(self.disclosureImage)
        NSLayoutConstraint.activate([self.disclosureImage.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
                                     self.disclosureImage.leadingAnchor.constraint(equalTo: self.infoLabel.safeAreaLayoutGuide.trailingAnchor, constant: 5)])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    internal func updateInfoType(infoType: ProfileInfo) {
        self.titleLabel.text = infoType.infoType
    }
}
