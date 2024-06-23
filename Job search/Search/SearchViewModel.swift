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
    func viewModelForSelectedRow(at indexPath: IndexPath) -> DetailViewModelProtocol
}

class SearchViewModel: SearchViewModelProtocol {
    
    private let url = "https://run.mocky.io/v3/c6a5026f-0c42-451d-ad62-a24c6356b4bc"
    
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
    
    func viewModelForSelectedRow(at indexPath: IndexPath) -> any DetailViewModelProtocol {
        let work = vacancies[indexPath.row]
        return DetailViewModel(vacancies: work)
    }
}
