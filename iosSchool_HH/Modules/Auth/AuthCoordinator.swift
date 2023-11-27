//
//  AuthCoordinator.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 06.11.2023.
//

import UIKit

class AuthCoordinator: BaseCoordinator<AuthCoordinator.Context> {

    struct Context {
        let onOpenLogin: (() -> Void)?
    }

    override func make() -> UIViewController? {
        let controller = assembly.authVC(onOpenLogin: context.onOpenLogin)
//        controller.onOpenRegistration = { [weak controller] in
//            let coordinator = self.assembly.registrationCoodrinator {}
//            guard let registrationVC = coordinator.make() else {
//                return
//            }
//            registrationVC.modalPresentationStyle = .fullScreen
//            controller?.present(registrationVC, animated: true)
//        }
        return controller
    }
}
