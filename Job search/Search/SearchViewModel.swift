//
//  SearchViewModel.swift
//  Job search
//
//  Created by Максим Зыкин on 29.05.2024.
//

import Foundation

protocol SearchViewModelProtocol {
    var vacancies: [Vacancy] { get }
    func fetchVacancies(completion: @escaping() -> Void)
    func numberOfRows() -> Int
    func cellViewModel(at indexPath: IndexPath) -> SearchCollectionCellViewModelProtocol
}

class SearchViewModel: SearchViewModelProtocol {
    
    private let url = "https://run.mocky.io/v3/d67a278f-ddcb-438c-bf56-3194c529b12b"
    
    var vacancies: [Vacancy] = []
    
    func fetchVacancies(completion: @escaping () -> Void) {
        NetworkManager<Welcome>.fetchData(urlJson: url) { [weak self] (result) in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                self.vacancies = response.vacancies
                completion()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        vacancies.count
    }
    
    func cellViewModel(at indexPath: IndexPath) -> any SearchCollectionCellViewModelProtocol {
        let vacancies = vacancies[indexPath.row]
        return SearchCollectionCellViewModel(vacancies: vacancies)
    }
    
    
}
