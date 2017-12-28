//
//  HideGymDetailsOverlayAnimator.swift
//  Bouldering
//
//  Created by Po Sam on 27/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class HideGymDetailsOverlayAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate let duration: TimeInterval = 0.3
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let presentingViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ViewGymDetailsViewController,
            let presentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
                return
        }
        
        containerView.addSubview(presentedViewController.view)
        containerView.addSubview(presentingViewController.view)
        
        let transform = CGAffineTransform(translationX: 0, y: containerView.bounds.maxY)
        
        UIView.animate(withDuration: self.duration, animations: {
            presentingViewController.transparentOverlayView.alpha = 0
            presentingViewController.detailsOverlayView.transform = transform
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
    
}
