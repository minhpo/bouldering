//
//  GymGeneralDetailsTableViewCell.swift
//  Bouldering
//
//  Created by Po Sam on 28/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class GymGeneralDetailsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel! {
        didSet {
            nameLabel.text = ""
        }
    }
    @IBOutlet weak var topAddressLabel: UILabel! {
        didSet {
            topAddressLabel.text = ""
        }
    }
    @IBOutlet weak var bottomAddressLabel: UILabel! {
        didSet {
            bottomAddressLabel.text = ""
        }
    }
    
    weak var delegate: GymContactsDelegate?
    
    @IBAction func callButtonPressed(sender: UIButton) {
        delegate?.call()
    }
    
    @IBAction func mailButtonPressed(sender: UIButton) {
        delegate?.mail()
    }
    
    @IBAction func visitWebsiteButtonPressed(sender: UIButton) {
        delegate?.visitWebsite()
    }
    
    func configure(viewModel: GymDetailsViewModel) {
        nameLabel.text = viewModel.name
        topAddressLabel.text = viewModel.topAddress
        bottomAddressLabel.text = viewModel.bottomAddress
    }

}
