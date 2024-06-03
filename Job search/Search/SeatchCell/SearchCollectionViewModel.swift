//
//  SearchCollectionViewModel.swift
//  Job search
//
//  Created by Максим Зыкин on 02.06.2024.
//

import Foundation

protocol SearchCollectionCellViewModelProtocol {
    var lookingNumber: Int { get }
    var title: String { get }
    var salary: String { get }
    var address: String { get }
    var company: String { get }
    var experience: String { get }
    init(vacancies: Vacancy)
}

class SearchCollectionCellViewModel: SearchCollectionCellViewModelProtocol {
   
    private var vacancies: Vacancy
    
    required init(vacancies: Vacancy) {
        self.vacancies = vacancies
    }
    
    var lookingNumber: Int {
        vacancies.lookingNumber ?? 0
    }
    
    var title: String {
        vacancies.title
    }
    
    var salary: String {
        vacancies.salary.short ?? ""
    }
    
    var address: String {
        vacancies.address.town
    }
    
    var company: String {
        vacancies.company
    }
    
    var experience: String {
        vacancies.experience.previewText
    }
    
}
