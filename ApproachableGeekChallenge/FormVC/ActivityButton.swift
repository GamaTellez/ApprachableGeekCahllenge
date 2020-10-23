//
//  ActivityButton.swift
//  ApproachableGeekChallenge
//
//  Created by Gamaliel Tellez on 10/22/20.
//

import UIKit

class ActivityButton: UIButton {
    private lazy var activityView : UIActivityIndicatorView = {
        let activityView = UIActivityIndicatorView(style: .medium)
        activityView.translatesAutoresizingMaskIntoConstraints = false
        activityView.color = .white
        return activityView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    internal func showActivity() {
        UIView.transition(with: self, duration: 0.5, options: .transitionCrossDissolve, animations: {
            self.setTitle("Saving...", for: .normal)
            self.addSubview(self.activityView)
        }, completion: nil)
        NSLayoutConstraint.activate([self.activityView.centerYAnchor.constraint(equalTo: self.safeAreaLayoutGuide.centerYAnchor),
                                     self.activityView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -10)])
        self.activityView.startAnimating()
    }
    
    internal func removeActivity(competion: @escaping ()-> Void) {
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.activityView.stopAnimating()
            self.activityView.removeFromSuperview()
            competion()
        }
    }
}
