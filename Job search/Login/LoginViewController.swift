//
//  LoginViewController.swift
//  Job search
//
//  Created by Максим Зыкин on 29.05.2024.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {

   private let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Вход в личный кабинет"
        label.font = .systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let workLabel: UILabel = {
        let label = UILabel()
        label.text = "Поиск работы"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let employeeSearchLabel: UILabel = {
        let label = UILabel()
        label.text = "Поиск сотрудников"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let baseLabel: UILabel = {
        let label = UILabel()
        label.text = "Размещение вакансий и доступ к базе резюме"
        label.font = .systemFont(ofSize: 14, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    private let errorLabel: UILabel = {
         let label = UILabel()
         label.text = "Вы ввели неверный e-mail"
         label.font = .systemFont(ofSize: 16, weight: .medium)
         label.textColor = .red
         return label
     }()
    
    private let viewCustom: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 255/255)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let viewCustom2: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 255/255)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let emailTextField: UITextField = {
        let text = UITextField()
        text.placeholder = "Электронная почта или телефон"
        text.keyboardType = .emailAddress
        text.backgroundColor = UIColor(red: 49/255, green: 50/255, blue: 52/255, alpha: 255/255)
        text.layer.cornerRadius = 5
        text.textColor = .white
        text.setupImage(imageName: "Responses")
        return text
    }()
    
    private let signInEmailButton = CustomButtons(title: "Продолжить", hasBakground: true, fontSize: .big)
    
    private let singInPassButton = CustomButtons(title: "Войти с паролем", fontSize: .big)
    
    private let searchWorker = CustomButtons(title: "Я ищу сотрудника", hasBakground: true, fontSize: .big)
    
    private let button: UIButton = {
        let buttton = UIButton()
        buttton.setTitle("Войти", for: .normal)
        buttton.backgroundColor = .lightGray
        buttton.titleLabel?.font = .systemFont(ofSize: 22, weight: .bold)
        return buttton
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        emailTextField.delegate = self
        setupUI()
        signInEmailButton.addTarget(self, action: #selector(tap), for: .touchUpInside)
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            self.view.endEditing(true);
        }
    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(viewCustom)
        viewCustom.addSubview(workLabel)
        viewCustom.addSubview(emailTextField)
        viewCustom.addSubview(signInEmailButton)
        viewCustom.addSubview(singInPassButton)
        viewCustom.addSubview(errorLabel)
        view.addSubview(viewCustom2)
        viewCustom2.addSubview(employeeSearchLabel)
        viewCustom2.addSubview(baseLabel)
        viewCustom2.addSubview(searchWorker)
        
        searchWorker.backgroundColor = UIColor(red: 89/255, green: 165/255, blue: 90/255, alpha: 255/255)
        searchWorker.layer.cornerRadius = 10
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        viewCustom.translatesAutoresizingMaskIntoConstraints = false
        workLabel.translatesAutoresizingMaskIntoConstraints = false
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        signInEmailButton.translatesAutoresizingMaskIntoConstraints = false
        singInPassButton.translatesAutoresizingMaskIntoConstraints = false
        errorLabel.translatesAutoresizingMaskIntoConstraints = false
        viewCustom2.translatesAutoresizingMaskIntoConstraints = false
        employeeSearchLabel.translatesAutoresizingMaskIntoConstraints = false
        baseLabel.translatesAutoresizingMaskIntoConstraints = false
        searchWorker.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            
            viewCustom.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 120),
            viewCustom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            viewCustom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            viewCustom.heightAnchor.constraint(equalToConstant: 220),
            
            workLabel.topAnchor.constraint(equalTo: viewCustom.topAnchor, constant: 30),
            workLabel.leadingAnchor.constraint(equalTo: viewCustom.leadingAnchor, constant: 20),
            
            emailTextField.topAnchor.constraint(equalTo: workLabel.bottomAnchor, constant: 20),
            emailTextField.leadingAnchor.constraint(equalTo: viewCustom.leadingAnchor, constant: 20),
            emailTextField.trailingAnchor.constraint(equalTo: viewCustom.trailingAnchor, constant: -20),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            signInEmailButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 26),
            signInEmailButton.leadingAnchor.constraint(equalTo: viewCustom.leadingAnchor, constant: 20),
            signInEmailButton.heightAnchor.constraint(equalToConstant: 50),
            signInEmailButton.widthAnchor.constraint(equalToConstant: 167),
            
            singInPassButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 22),
            singInPassButton.leadingAnchor.constraint(equalTo: signInEmailButton.trailingAnchor, constant: 10),
            singInPassButton.heightAnchor.constraint(equalToConstant: 50),
            singInPassButton.widthAnchor.constraint(equalToConstant: 167),
            
            errorLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 4),
            errorLabel.leadingAnchor.constraint(equalTo: viewCustom.leadingAnchor, constant: 24),
            
            viewCustom2.topAnchor.constraint(equalTo: viewCustom.bottomAnchor, constant: 30),
            viewCustom2.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            viewCustom2.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -10),
            viewCustom2.heightAnchor.constraint(equalToConstant: 170),
            
            employeeSearchLabel.topAnchor.constraint(equalTo: viewCustom2.topAnchor, constant: 30),
            employeeSearchLabel.leadingAnchor.constraint(equalTo: viewCustom2.leadingAnchor, constant: 20),
            
            baseLabel.topAnchor.constraint(equalTo: employeeSearchLabel.bottomAnchor, constant: 10),
            baseLabel.leadingAnchor.constraint(equalTo: viewCustom2.leadingAnchor, constant: 20),
            
            searchWorker.topAnchor.constraint(equalTo: baseLabel.bottomAnchor, constant: 22),
            searchWorker.leadingAnchor.constraint(equalTo: viewCustom2.leadingAnchor, constant: 20),
            searchWorker.trailingAnchor.constraint(equalTo: viewCustom2.trailingAnchor, constant: -20),
            searchWorker.heightAnchor.constraint(equalToConstant: 50),
            ])
        
        errorLabel.isHidden = true
    }
    
    @objc func tap() {
        print("тест")
        if !Validator.isValidEmail(for: emailTextField.text ?? "") {
            errorLabel.isHidden = false
            return
        }
        let tabBar = LoginConfirmationViewController()
        tabBar.emailUser = emailTextField.text ?? ""
        tabBar.modalPresentationStyle = .fullScreen
        present(tabBar, animated: false)
    }
}
