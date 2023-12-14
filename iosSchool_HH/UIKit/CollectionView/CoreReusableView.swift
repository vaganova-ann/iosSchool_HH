//
//  CoreReusableView.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 07.12.2023.
//

import UIKit

protocol CoreReusableView: UICollectionReusableView, CoreNibReusable {
    associatedtype InputData

    static func layoutItem() -> NSCollectionLayoutBoundarySupplementaryItem?
    func update(with inputData: InputData) -> Self
}
