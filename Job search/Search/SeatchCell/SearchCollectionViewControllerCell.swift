//
//  SearchCollectionViewController.swift
//  Job search
//
//  Created by Максим Зыкин on 02.06.2024.
//

import UIKit

class SearchCollectionViewControllerCell: UICollectionViewCell {
    
    static let cellID = "VacancyCell"
    
    private var viewC: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 8
        view.backgroundColor = UIColor(red: 34/255, green: 35/255, blue: 37/255, alpha: 255/255)
        return view
    }()
    
    var lookingNumber = CustomLabel(text: "", size: 14, color: .green, font: .regular)
    
    var title = CustomLabel(text: "", size: 18, color: .white, font: .medium)
    
    var salary = CustomLabel(text: "", size: 22, color: .white, font: .bold)
    
    var address = CustomLabel(text: "",size: 14, color: .white, font: .regular)
    
    var company = CustomLabel(text: "", size: 14, color: .white, font: .regular)
    
    var confirmedImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "confirmed")
        return image
    }()
    
    var experienceImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "experience")
        return image
    }()
    
    var experience = CustomLabel(text: "", size: 14, color: .white, font: .regular)
    
    var viewModel: SearchCollectionCellViewModelProtocol! {
        didSet {
            self.lookingNumber.text = "Сейчас просматривает " + String(viewModel.lookingNumber) + " человек"
            self.title.text = viewModel.title
            self.salary.text = viewModel.salary
            self.address.text = viewModel.address
            self.company.text = viewModel.company
            self.experience.text = viewModel.experience
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupUI() {
        contentView.addSubview(viewC)
        contentView.addSubview(lookingNumber)
        contentView.addSubview(title)
        contentView.addSubview(salary)
        contentView.addSubview(address)
        contentView.addSubview(company)
        contentView.addSubview(confirmedImage)
        contentView.addSubview(experienceImage)
        contentView.addSubview(experience)
        
        viewC.translatesAutoresizingMaskIntoConstraints = false
        lookingNumber.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        salary.translatesAutoresizingMaskIntoConstraints = false
        address.translatesAutoresizingMaskIntoConstraints = false
        company.translatesAutoresizingMaskIntoConstraints = false
        confirmedImage.translatesAutoresizingMaskIntoConstraints = false
        experienceImage.translatesAutoresizingMaskIntoConstraints = false
        experience.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            viewC.leadingAnchor.constraint(equalTo: leadingAnchor),
            viewC.trailingAnchor.constraint(equalTo: trailingAnchor),
            viewC.topAnchor.constraint(equalTo: topAnchor),
            viewC.heightAnchor.constraint(equalTo: heightAnchor),
            
            lookingNumber.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            lookingNumber.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            lookingNumber.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            
            title.topAnchor.constraint(equalTo: lookingNumber.bottomAnchor, constant: 10),
            title.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            title.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -30),
            
            salary.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 10),
            salary.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            address.topAnchor.constraint(equalTo: salary.bottomAnchor, constant: 10),
            address.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            company.topAnchor.constraint(equalTo: address.bottomAnchor, constant: 10),
            company.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
            confirmedImage.centerYAnchor.constraint(equalTo: company.centerYAnchor),
            confirmedImage.leadingAnchor.constraint(equalTo: company.trailingAnchor, constant: 5),
            confirmedImage.widthAnchor.constraint(equalToConstant: 14),
            confirmedImage.heightAnchor.constraint(equalToConstant: 14),
            
            experience.topAnchor.constraint(equalTo: company.bottomAnchor, constant: 10),
            experience.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            
            experienceImage.centerYAnchor.constraint(equalTo: experience.centerYAnchor),
            experienceImage.leadingAnchor.constraint(equalTo: experience.leadingAnchor, constant: -20),
            experienceImage.widthAnchor.constraint(equalToConstant: 12),
            experienceImage.heightAnchor.constraint(equalToConstant: 10),
            
            ])
    }
    
}
