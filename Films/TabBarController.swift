//
//  TabBarController.swift
//  Films
//


import UIKit

final class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.tintColor = .systemGray4
        setupViewContollers()
    }
    
    private func setupViewContollers() {
        
        viewControllers = [
            setupNavigationController(rootViewController: ViewController(), title: "Home", image: UIImage(systemName: "house.fill") ?? UIImage.add),
            setupNavigationController(rootViewController: ViewController(), title: "Search", image: UIImage(systemName: "magnifyingglass") ?? UIImage.add),
            setupNavigationController(rootViewController: ViewController(), title: "Favorite", image: UIImage(systemName: "heart.fill") ?? UIImage.add),
            ]
    }
    
    private func setupNavigationController(rootViewController: UIViewController,
                                           title: String,
                                           image: UIImage) -> UINavigationController {
        
        let navigationController = UINavigationController(rootViewController:
                                                            rootViewController)
        
        navigationController.tabBarItem.title = title
        navigationController.tabBarItem.image = image
        rootViewController.navigationItem.title = title
        navigationController.navigationBar.prefersLargeTitles = true
        
        return navigationController
    }
}
