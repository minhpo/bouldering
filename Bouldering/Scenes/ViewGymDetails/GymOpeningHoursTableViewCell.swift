//
//  GymOpeningHoursTableViewCell.swift
//  Bouldering
//
//  Created by Po Sam on 28/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class GymOpeningHoursTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hoursHeaderLabel: UILabel! {
        didSet {
            hoursHeaderLabel.text = NSLocalizedString("opening_hours_header", comment: "")
        }
    }
    
    @IBOutlet weak var mondayLabel: UILabel! {
        didSet {
            mondayLabel.text = NSLocalizedString("monday", comment: "")
        }
    }
    
    @IBOutlet weak var mondayOpeningHoursLabel: UILabel! {
        didSet {
            mondayOpeningHoursLabel.text = ""
        }
    }
    
    @IBOutlet weak var tuesdayLabel: UILabel! {
        didSet {
            tuesdayLabel.text = NSLocalizedString("tuesday", comment: "")
        }
    }
    
    @IBOutlet weak var tuesdayOpeningHoursLabel: UILabel! {
        didSet {
            tuesdayOpeningHoursLabel.text = ""
        }
    }
    
    @IBOutlet weak var wednesdayLabel: UILabel! {
        didSet {
            wednesdayLabel.text = NSLocalizedString("wednesday", comment: "")
        }
    }
    
    @IBOutlet weak var wednesdayOpeningHoursLabel: UILabel! {
        didSet {
            wednesdayOpeningHoursLabel.text = ""
        }
    }
    
    @IBOutlet weak var thursdayLabel: UILabel! {
        didSet {
            thursdayLabel.text = NSLocalizedString("thursday", comment: "")
        }
    }
    
    @IBOutlet weak var thursdayOpeningHoursLabel: UILabel! {
        didSet {
            thursdayOpeningHoursLabel.text = ""
        }
    }
    
    @IBOutlet weak var fridayLabel: UILabel! {
        didSet {
            fridayLabel.text = NSLocalizedString("friday", comment: "")
        }
    }
    
    @IBOutlet weak var fridayOpeningHoursLabel: UILabel! {
        didSet {
            fridayOpeningHoursLabel.text = ""
        }
    }
    
    @IBOutlet weak var saturdayLabel: UILabel! {
        didSet {
            saturdayLabel.text = NSLocalizedString("saturday", comment: "")
        }
    }
    
    @IBOutlet weak var saturdayOpeningHoursLabel: UILabel! {
        didSet {
            saturdayOpeningHoursLabel.text = ""
        }
    }
    
    @IBOutlet weak var sundayLabel: UILabel! {
        didSet {
            sundayLabel.text = NSLocalizedString("sunday", comment: "")
        }
    }
    
    @IBOutlet weak var sundayOpeningHoursLabel: UILabel! {
        didSet {
            sundayOpeningHoursLabel.text = ""
        }
    }
    
    func configure(viewModel: GymDetailsViewModel) {
        mondayOpeningHoursLabel.text = viewModel.openingHours[.monday]
        tuesdayOpeningHoursLabel.text = viewModel.openingHours[.tuesday]
        wednesdayOpeningHoursLabel.text = viewModel.openingHours[.wednesday]
        thursdayOpeningHoursLabel.text = viewModel.openingHours[.thursday]
        fridayOpeningHoursLabel.text = viewModel.openingHours[.friday]
        saturdayOpeningHoursLabel.text = viewModel.openingHours[.saturday]
        sundayOpeningHoursLabel.text = viewModel.openingHours[.sunday]
    }

}
