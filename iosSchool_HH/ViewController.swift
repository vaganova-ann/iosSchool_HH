//
//  ViewController.swift
//  iosSchool_HH
//
//  Created by Анна on 30.09.2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("hello world")
    }

    func createRedView() -> UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }

    func createGreenView() -> UIView {
        let view = UIView()
        view.backgroundColor = .green
        return view
    }

    func createBlueView() -> UIView {
        let view = UIView()
        view.backgroundColor = .blue
        return view
    }
}

