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
    
    private let url = "https://run.mocky.io/v3/61468d08-12d5-411d-8bdc-30c810506b4e"
    
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
