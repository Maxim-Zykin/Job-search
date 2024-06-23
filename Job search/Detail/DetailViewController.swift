//
//  DetailViewController.swift
//  Job search
//
//  Created by Максим Зыкин on 06.06.2024.
//

import UIKit

class DetailViewController: UIViewController {
    
    var titleLabel = CustomLabel(text: "", size: 18, color: .white, font: .medium)
    
    var salaryLabel = CustomLabel(text: "", size: 22, color: .white, font: .regular)
    
    var experienceLabel = CustomLabel(text: "", size: 22, color: .white, font: .regular)
    
    var typeOfEmployment = CustomLabel(text: "", size: 22, color: .white, font: .regular)
    
    var addressLabel = CustomLabel(text: "",size: 14, color: .white, font: .regular)
    
    var companyLabel = CustomLabel(text: "", size: 14, color: .white, font: .regular)
    
    var descriptionLabel = CustomLabel(text: "", size: 14, color: .white, font: .regular)
    
    var viewModel: DetailViewModelProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        setupUI()
    }
    
    
    func setupUI() {
        view.addSubview(titleLabel)
        view.addSubview(salaryLabel)
        view.addSubview(experienceLabel)
        view.addSubview(typeOfEmployment)
        view.addSubview(addressLabel)
        view.addSubview(companyLabel)
        view.addSubview(descriptionLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        salaryLabel.translatesAutoresizingMaskIntoConstraints = false
        experienceLabel.translatesAutoresizingMaskIntoConstraints = false
        typeOfEmployment.translatesAutoresizingMaskIntoConstraints = false
        addressLabel.translatesAutoresizingMaskIntoConstraints = false
        companyLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false 
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 130),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            
        ])
    }
}

