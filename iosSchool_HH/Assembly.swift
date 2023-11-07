//
//  Assembly.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 26.10.2023.
//

import Foundation

class Assembly {

    func colorGenerator(alpha: Double) -> ColorGenerator {
        ColorGenerator(alpha: alpha)
    }

    func appCoordinator() -> AppCoordinator {
        AppCoordinator(assembly: self, context: CoordinatorContext())
        // AppCoordinator(assembly: self, context: .init())
    }
}
