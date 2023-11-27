//
//  BaseViewController.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 16.11.2023.
//

import UIKit

protocol CoreViewController: AnyObject {
    associatedtype View

    var rootView: View { get }
}

class BaseViewControoler<View: UIView>: UIViewController, CoreViewController {

    var rootView: View = {
        let nibName = String(describing: View.self)
        let bundle = Bundle(for: View.self)

        if bundle.path(forResource: nibName, ofType: "nib") == nil {
            return View(frame: UIScreen.main.bounds)
        } else {
            let nib = UINib(nibName: nibName, bundle: bundle)

            if let view = nib.instantiate(withOwner: nil, options: nil).first as? View {
                return view
            } else {
                fatalError("Not load view \(nibName) from nib")
            }
        }
    }()

    override func loadView() {
        view = rootView
    }
}
