//
//  ExtensionTextField.swift
//  Job search
//
//  Created by Максим Зыкин on 30.05.2024.
//

import UIKit

extension UITextField {
    
    func setupImage(imageName: String) {
        let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 30, height: 24))
        imageView.image = UIImage(named: imageName)
        let imageVC = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
        imageVC.addSubview(imageView)
        leftView = imageVC
        leftViewMode = .always
        self.tintColor = UIColor(named: "9F9F9F")
    }
}
