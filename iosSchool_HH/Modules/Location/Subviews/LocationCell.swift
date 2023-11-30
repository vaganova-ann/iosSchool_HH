//
//  LocationCell.swift
//  iosSchool_HH
//
//  Created by Анна Ваганова on 27.11.2023.
//

import UIKit

class LocationCell: UITableViewCell {

    var data: LocationCellData? {
        didSet {
            guard let data else {
                return
            }
            update(data: data)
        }
    }

    @IBOutlet private weak var nameLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    // MARK: - Private methods

    private func update(data: LocationCellData) {
        nameLabel.text = data.name
    }
}
