//
//  SplashViewController.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 09.11.2023.
//

import UIKit

class SplashViewController: UIViewController {

    private let dataProvider: SplashDataProvider
    private let onSuccess: (() -> Void)?

    init(dataProvider: SplashDataProvider, onSuccess: (() -> Void)?) {
        self.dataProvider = dataProvider
        self.onSuccess = onSuccess

        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { [weak self] timer in
            self?.onSuccess?()
            timer.invalidate()
        }
    }
}
