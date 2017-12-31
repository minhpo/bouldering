//
//  UIViewController+Navigation.swift
//  Bouldering
//
//  Created by Po Sam on 27/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func navigate(to navigation: Navigation, sender: Any? = nil) {
        self.performSegue(withIdentifier: navigation.rawValue, sender: sender)
    }
    
}
