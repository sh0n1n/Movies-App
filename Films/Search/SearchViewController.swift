//
//  SearchViewController.swift
//  Films
//

import UIKit

final class SearchViewController: UIViewController {
    //MARK: - GUI Variables
    private lazy var collectionViewSearch: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    private lazy var seachBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.translatesAutoresizingMaskIntoConstraints = false
        searchBar.placeholder = "Search something"
         return searchBar
     }()
    
    
}
