//
//  AuthAssembly.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 06.11.2023.
//

import Foundation

protocol AuthAssembly {
    func authVC() -> AuthViewController
    func authDataProvider() -> AuthDataProvider
    func authCoordinator() -> AuthCoordinator
}

extension Assembly: AuthAssembly {

    func authVC() -> AuthViewController {
        // AuthViewController(dataProvider: authDataProvider())
        .init(dataProvider: authDataProvider())
    }

    func authDataProvider() -> AuthDataProvider {
        AuthDataProviderImp()
    }

    func authCoordinator() -> AuthCoordinator {
        AuthCoordinator(assembly: self, context: .init())
    }
}
