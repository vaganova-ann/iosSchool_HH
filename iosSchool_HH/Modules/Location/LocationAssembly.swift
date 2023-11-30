//
//  LocationAssembly.swift
//  iosSchoolHH
//
//

import Foundation

protocol LocationAssembly {
    func locationVC() -> LocationViewController<LocationViewImp>
    func locationDataProvider() -> LocationDataProvider
    func locationCoordinator() -> LocationCoordinator
}

extension Assembly: LocationAssembly {
    func locationVC() -> LocationViewController<LocationViewImp> {
        .init(dataProvider: locationDataProvider())
    }

    func locationDataProvider() -> LocationDataProvider {
        LocationDataProviderImp(apiClient: apiClient)
    }

    func locationCoordinator() -> LocationCoordinator {
        LocationCoordinator(assembly: self, context: .init())
    }
}
