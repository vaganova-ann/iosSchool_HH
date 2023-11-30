//
//  LocationDataProvider.swift
//  iosSchoolHH
//
//

import Foundation

protocol LocationDataProvider {
    func location(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void)
}

class LocationDataProviderImp: LocationDataProvider {
    private let apiClient: LocationApiClient

    init(apiClient: LocationApiClient) {
        self.apiClient = apiClient
    }

    func location(onRequestCompleted: @escaping (LocationsList?, ApiError?) -> Void) {
        apiClient.location(onRequestCompleted: onRequestCompleted)
    }
}
