//
//  CoreNibReusable.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 07.12.2023.
//

import UIKit

protocol CoreNibReusable {
    static var nib: UINib? { get }
}

extension CoreNibReusable where Self: UIView {
    static var nib: UINib? {
        UINib(nibName: String(describing: Self.self), bundle: Bundle(for: self))
    }
}

extension CoreNibReusable {
    static var nib: UINib? {
        nil
    }
}
