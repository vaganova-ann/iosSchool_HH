//
//  Assembly.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 26.10.2023.
//

import UIKit

class Assembly {

    lazy var imageService: ImageService = ImageSerciveImp(apiClient: apiClient)
    lazy var storageManager: StorageManager = StorageManagerImp()

    var apiClient: ApiClient {
        ApiClient()
    }

    func colorGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: CoordinatorContext())
        // AppCoordinator(assembly: self, context: .init())
    }

    func rootTabBarController() -> UITabBarController {
        TabBarController()
    }

    func rootNavigationController() -> UINavigationController {
        let controller = BaseNavigationController()
        controller.modalPresentationStyle = .fullScreen
        return controller
    }
}
