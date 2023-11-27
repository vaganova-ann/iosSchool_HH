//
//  AppCoordinator.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 06.11.2023.
//

import UIKit

struct CoordinatorContext {}

class AppCoordinator: BaseCoordinator<CoordinatorContext> {

    private var window: UIWindow?

    func start(window: UIWindow?) {
        self.window = window
        let coordinator = assembly.splashCoordinator { [weak self] in
            self?.authBootstrap()
        }
        setRoot(
            viewController: coordinator.make()
        )
    }

    private func authBootstrap() {
        let authCoordinator = assembly.authCoordinator { [weak self] in
            DispatchQueue.main.async {
                self?.setTabVC()
            }
        }
        setRoot(viewController: authCoordinator.make())
    }

    private func setTabVC() {
        let tabVC = assembly.rootTabBarController()

        /* let locationsCoord = assembly.locationsCoordinator()
        // let cabinetCoord = assembly.cabinetCoodrinator()
        guard let locationsVC = locationsCoord.make(), let cabinetVC = cabinetCoord.make() else {
            return
        }
        let navVC = assembly.rootNavigationController()
        navVC.setViewControllers([locationsVC], animated: false)
        navVC.tabBarItem = RootTab.locations.tabBarItem

        // cabinetVC.tabBarItem = RootTab.cabinet.tabBarItem
        tabVC.setViewControllers([navVC, cabinetVC], animated: false)
        setRoot(viewController: tabVC) */
    }

    private func setRoot(viewController: UIViewController?) {
        guard let window, let viewController else {
            return
        }
        window.rootViewController = viewController
        window.makeKeyAndVisible()
    }
}
