//
//  TabBarController.swift
//  Films
//


import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let movieService: MovieService = APIManager()
        let viewModel = MovieViewModel(movieService: movieService)

        
        let searchVC = SearchViewController(viewModel: viewModel)
            searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        self.viewControllers = [searchVC]

        }
    }

