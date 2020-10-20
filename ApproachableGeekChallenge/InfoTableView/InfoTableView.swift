//
//  InfoTableView.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/19/20.
//

import UIKit

enum ProfileInfo : CaseIterable {
    case name, phone,email,about
    var infoType : String {
        switch self {
        case .name: return "Name"
        case .phone: return "Phone"
        case .email: return "Email"
        case .about: return "Tell us about yourself"
        }
    }
}

class InfoTableView: UITableView, UITableViewDataSource {

    init(frame: CGRect) {
        super.init(frame: frame, style: .plain)
        self.dataSource = self
        self.register(InfoTableViewCell.self, forCellReuseIdentifier: InfoTableViewCell.infoCellIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        ProfileInfo.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoTableViewCell.infoCellIdentifier, for: indexPath) as! InfoTableViewCell
        switch indexPath.row {
        case 0:
            cell.updateInfoType(infoType: .name)
        case 1:
            cell.updateInfoType(infoType: .phone)
        case 2:
            cell.updateInfoType(infoType: .email)
        case 3:
            cell.updateInfoType(infoType: .about)
        default:
            break
        }
        
        return cell
    }
}
