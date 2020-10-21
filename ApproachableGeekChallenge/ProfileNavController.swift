//
//  ProfileNavController.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/17/20.
//

import Foundation
import UIKit

class ProfileNavController : UINavigationController {
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.setUp()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        //self.navigationController?.navigationBar.barTintColor = UIColor.white
        self.navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
    }
}
