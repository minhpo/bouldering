//
//  HideGymDetailsInteractionController.swift
//  Bouldering
//
//  Created by Po Sam on 31/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class HideGymDetailsInteractionController: UIPercentDrivenInteractiveTransition {
    
    var interactionInProgress = false
    
    private var view: UIView
    private var callback: (() -> Void)
    
    init(view: UIView, callback: @escaping () -> Void) {
        self.view = view
        self.callback = callback
        
        super.init()
        
        setupGestureRecognizer(in: view)
    }
    
    private func setupGestureRecognizer(in view: UIView) {
        let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(panGestureRecognized(_:)))
        view.addGestureRecognizer(panGestureRecognizer)
    }
    
    @objc private func panGestureRecognized(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        var progress = (translation.y / view.bounds.height)
        progress = CGFloat(fminf(fmaxf(Float(progress), 0.0), 1.0))
        
        switch sender.state {
        case .began:
            interactionInProgress = true
            callback()
        case .changed:
            update(progress)
        case .cancelled:
            interactionInProgress = false
            cancel()
        case .ended:
            interactionInProgress = false
            if progress > 0.5 {
                finish()
            } else {
                cancel()
            }
        default:
            break
        }
    }

}
