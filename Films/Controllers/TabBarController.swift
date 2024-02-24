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
        
        let homeVC = HomeViewController(viewModel: viewModel)
        homeVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "house.fill"), tag: 0)
        let searchVC = SearchViewController(viewModel: viewModel)
        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass"), tag: 1)
        self.viewControllers = [homeVC, searchVC]
    }
}
