//
//  DetailViewModel.swift
//  Job search
//
//  Created by Максим Зыкин on 14.06.2024.
//

import UIKit

protocol DetailViewModelProtocol {
    var title: String { get }
    var salary: String { get }
    var experience: String { get }
    var typeOfEmployment: String { get }
    var address: String { get }
    var company: String { get }
    var description: String { get }
    init(vacancies: Vacancy)
}

class DetailViewModel: DetailViewModelProtocol {
    
    var title: String {
        vacancies.title
    }
    
    var salary: String {
        vacancies.salary.full
    }
    
    var experience: String {
        vacancies.experience.previewText
    }
    
    var typeOfEmployment: String {
        "Полная занятость"
    }
    
    var address: String {
        vacancies.address.town
    }
    
    var company: String {
        vacancies.company
    }
    
    var description: String {
        vacancies.description?.description ?? ""
    }
    
    private var vacancies: Vacancy
    
    required init(vacancies: Vacancy) {
        self.vacancies = vacancies
    }
    
    
}
