//
//  LocationViewController.swift
//  iosSchoolHH
//
//

import UIKit

class LocationViewController<View: LocationView>: BaseViewControoler<View> {

    var selectLocation: ((LocationCellData) -> Void)?
    private let dataProvider: LocationDataProvider

    init(dataProvider: LocationDataProvider) {
        self.dataProvider = dataProvider
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        setupBar()
        rootView.setView()
        rootView.selectLocation = selectLocation
        getListOfLocation()
    }

    // MARK: - Private methods

    private func setupBar() {
        title = "Выбор планеты"
        navigationController?.navigationBar.titleTextAttributes = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        /* navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .refresh,
            target: self,
            action: #selector(reload)
        ) */
    }

    private func getListOfLocation() {
        dataProvider.location { [weak self] locationList, error in
            guard let locationList else {
                print(error ?? "no error")
                return
            }
            self?.rootView.update(data: LocationViewData(list: locationList))
        }
    }
}
