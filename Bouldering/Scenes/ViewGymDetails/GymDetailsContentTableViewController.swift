//
//  GymDetailsContentTableViewController.swift
//  Bouldering
//
//  Created by Po Sam on 28/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class GymDetailsContentTableViewController: UITableViewController {

    @IBOutlet weak var generalDetailsCell: GymGeneralDetailsTableViewCell!
    @IBOutlet weak var openingHoursCell: GymOpeningHoursTableViewCell!
    
    func configure(viewModel: GymDetailsViewModel) {
        generalDetailsCell.configure(viewModel: viewModel)
        openingHoursCell.configure(viewModel: viewModel)
    }

}
