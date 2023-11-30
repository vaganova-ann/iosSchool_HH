//
//  LocationCellData.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 27.11.2023.
//

import Foundation

struct LocationCellData {
    let name: String
    let type: String

    init(location: Location) {
        name = location.name
        type = location.type
    }
}
