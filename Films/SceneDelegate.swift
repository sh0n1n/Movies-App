//
//  SceneDelegate.swift
//  Films
//


import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }

        window = UIWindow(windowScene: windowScene)



        let mainTabBarController = TabBarController()

        

        let movieService: MovieService = APIManager()

        let viewModel = MovieViewModel(movieService: movieService)



        let homeVC = HomeViewController(viewModel: viewModel)

        homeVC.tabBarItem = UITabBarItem(title: "Movies", image: UIImage(systemName: "house.fill"), tag: 0)

        let homeNavVC = UINavigationController(rootViewController: homeVC)

        let searchVC = SearchViewController(viewModel: viewModel)

        searchVC.tabBarItem = UITabBarItem(title: "Search", image: UIImage(systemName: "magnifyingglass.circle"), tag: 1)

        let searchNavVC = UINavigationController(rootViewController: searchVC)

        mainTabBarController.viewControllers = [homeNavVC, searchNavVC]

        window?.rootViewController = mainTabBarController

        window?.makeKeyAndVisible()

    }

    func sceneDidDisconnect(_ scene: UIScene) {

    }



    func sceneDidBecomeActive(_ scene: UIScene) {

    }

    func sceneWillResignActive(_ scene: UIScene) {

    }



    func sceneWillEnterForeground(_ scene: UIScene) {

    }

    func sceneDidEnterBackground(_ scene: UIScene) {

    }
}
