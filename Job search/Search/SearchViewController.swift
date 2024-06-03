//
//  SearchViewController.swift
//  Job search
//
//  Created by Максим Зыкин on 29.05.2024.
//

import UIKit

class SearchViewController: UIViewController {
    
    lazy var collectionView = UICollectionView(
         frame: .zero,
         collectionViewLayout: makeLayout()
     )
    
    private var viewModel: SearchViewModelProtocol! {
        didSet {
            viewModel.fetchVacancies {
                DispatchQueue.main.async {
                    print("УСПЕХ")
                    self.collectionView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = SearchViewModel()
        view.backgroundColor = .black
        setup()
        collectionView.dataSource = self
    }
    
    private func makeLayout() -> UICollectionViewLayout {
        let spacing: CGFloat = 20
        let itemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalHeight(1.5),
            heightDimension: .fractionalHeight(1.0))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        
        let groupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1.0),
            heightDimension: .absolute(233))
        
       let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, repeatingSubitem: item, count: 1)
        group.interItemSpacing = .fixed(spacing)
        
        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = .init(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
        section.interGroupSpacing = spacing
        
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
        }

    private func setup() {
        collectionView.register(SearchCollectionViewControllerCell.self, forCellWithReuseIdentifier: SearchCollectionViewControllerCell.cellID)
        collectionView.backgroundColor = .black
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}

extension SearchViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.numberOfRows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SearchCollectionViewControllerCell.cellID, for: indexPath) as! SearchCollectionViewControllerCell
        cell.viewModel = viewModel.cellViewModel(at: indexPath)
        return cell
    }
}
