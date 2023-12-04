//
//  LocationCoordinator.swift
//  iosSchoolHH
//
//

import UIKit

class LocationCoordinator: BaseCoordinator<LocationCoordinator.Context> {

    struct Context {}

    override func make() -> UIViewController? {
        let locationVC = assembly.locationVC()
        locationVC.selectLocation = { [weak locationVC] locationData in
            let coordinator = self.assembly.characterCoordinator(data: locationData)
            guard let characterVC = coordinator.make() else {
                return
            }
            locationVC?.navigationController?.pushViewController(characterVC, animated: true)
        }
        return locationVC
    }
}
