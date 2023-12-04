//
//  ImageService.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 30.11.2023.
//

import UIKit

protocol ImageService {
    func getImage(url: String, completion: @escaping (UIImage?) -> Void)
}

class ImageSerciveImp: ImageService {

    private var imageDict: [String: UIImage] = [:]

    private let apiClient: ApiClient
    private let updateQueue = DispatchQueue(label: "ImageServiceQueue")

    init(apiClient: ApiClient) {
        self.apiClient = apiClient
    }

    func getImage(url: String, completion: @escaping (UIImage?) -> Void) {
    }
}
