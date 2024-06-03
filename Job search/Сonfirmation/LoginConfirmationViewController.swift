//
//  LoginConfirmationViewController.swift
//  Job search
//
//  Created by Максим Зыкин on 01.06.2024.
//

import UIKit

class LoginConfirmationViewController: UIViewController {
    
    var emailUser = ""
    
    private let infoLable: UILabel = {
        let label = UILabel()
        label.text = "Отправили код"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()

    private let descriptionLable: UILabel = {
        let label = UILabel()
        label.text = "Напишите его, чтобы подтвердить, что это вы, а не кто-то другой входит в личный кабинет"
        label.numberOfLines = 0
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.textColor = .white
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
        infoLable.text = "Отправили код на \(emailUser)"
        
        oneTextField.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        twoTextField.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        threeTextField.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        fourTextField.addTarget(self, action: #selector(self.textDidChange(textField:)), for: UIControl.Event.editingChanged)
        
        continueButton.addTarget(self, action: #selector(tabContinue), for: .touchUpInside)
    }
    
    private let oneTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "*"
        text.textAlignment = .center
        text.keyboardType = .numberPad
        text.backgroundColor = UIColor(red: 49/255, green: 50/255, blue: 52/255, alpha: 255/255)
        text.layer.cornerRadius = 5
        text.textColor = .white
        return text
    }()
    
    private let twoTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "*"
        text.textAlignment = .center
        text.keyboardType = .numberPad
        text.backgroundColor = UIColor(red: 49/255, green: 50/255, blue: 52/255, alpha: 255/255)
        text.layer.cornerRadius = 5
        text.textColor = .white
        return text
    }()
    
    private let threeTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "*"
        text.textAlignment = .center
        text.keyboardType = .numberPad
        text.backgroundColor = UIColor(red: 49/255, green: 50/255, blue: 52/255, alpha: 255/255)
        text.layer.cornerRadius = 5
        text.textColor = .white
        return text
    }()
    
    private let fourTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "*"
        text.textAlignment = .center
        text.keyboardType = .numberPad
        text.backgroundColor = UIColor(red: 49/255, green: 50/255, blue: 52/255, alpha: 255/255)
        text.layer.cornerRadius = 5
        text.textColor = .white
        return text
    }()
    
    private let continueButton = CustomButtons(title: "Продолжить", hasBakground: true, fontSize: .big)
    
    private func setupUI() {
        view.addSubview(infoLable)
        view.addSubview(descriptionLable)
        view.addSubview(oneTextField)
        view.addSubview(twoTextField)
        view.addSubview(threeTextField)
        view.addSubview(fourTextField)
        view.addSubview(continueButton)
        
        infoLable.translatesAutoresizingMaskIntoConstraints = false
        descriptionLable.translatesAutoresizingMaskIntoConstraints = false
        oneTextField.translatesAutoresizingMaskIntoConstraints = false
        twoTextField.translatesAutoresizingMaskIntoConstraints = false
        threeTextField.translatesAutoresizingMaskIntoConstraints = false
        fourTextField.translatesAutoresizingMaskIntoConstraints = false
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            
        infoLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
        infoLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        
        descriptionLable.topAnchor.constraint(equalTo: infoLable.topAnchor, constant: 40),
        descriptionLable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        descriptionLable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        
        oneTextField.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 30),
        oneTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        oneTextField.heightAnchor.constraint(equalToConstant: 48),
        oneTextField.widthAnchor.constraint(equalToConstant: 48),
        
        twoTextField.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 30),
        twoTextField.leadingAnchor.constraint(equalTo: oneTextField.trailingAnchor, constant: 8),
        twoTextField.heightAnchor.constraint(equalToConstant: 48),
        twoTextField.widthAnchor.constraint(equalToConstant: 48),
        
        threeTextField.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 30),
        threeTextField.leadingAnchor.constraint(equalTo: twoTextField.trailingAnchor, constant: 8),
        threeTextField.heightAnchor.constraint(equalToConstant: 48),
        threeTextField.widthAnchor.constraint(equalToConstant: 48),
        
        fourTextField.topAnchor.constraint(equalTo: descriptionLable.bottomAnchor, constant: 30),
        fourTextField.leadingAnchor.constraint(equalTo: threeTextField.trailingAnchor, constant: 8),
        fourTextField.heightAnchor.constraint(equalToConstant: 48),
        fourTextField.widthAnchor.constraint(equalToConstant: 48),
        
        continueButton.topAnchor.constraint(equalTo: fourTextField.bottomAnchor, constant: 30),
        continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
        continueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        continueButton.heightAnchor.constraint(equalToConstant: 50),
        ])
    }
    
    @objc private func textDidChange(textField: UITextField) {
        let text = textField.text
         
        if text?.utf16.count == 1 {
            
            switch textField {
            case oneTextField:
                twoTextField.becomeFirstResponder()
                break
            case twoTextField:
                threeTextField.becomeFirstResponder()
                break
            case threeTextField:
                fourTextField.becomeFirstResponder()
                break
            case fourTextField:
                fourTextField.resignFirstResponder()
                break
            default:
                break
            }
        }
    }
    
    @objc func tabContinue() {
        guard let textOne = oneTextField.text, !textOne.isEmpty else { return }
        guard let textTwo = twoTextField.text, !textTwo.isEmpty else { return }
        guard let textThree = threeTextField.text, !textThree.isEmpty else { return }
        guard let textFour = fourTextField.text, !textFour.isEmpty else { return }

        let tabBar = TabBar()
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: false)
    }
}
