//
//  ShowGymDetailsOverlayAnimator.swift
//  Bouldering
//
//  Created by Po Sam on 27/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class ShowGymDetailsOverlayAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate let duration: TimeInterval = 0.3
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let presentingViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
            let presentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? ViewGymDetailsViewController else {
                return
        }
        
        containerView.addSubview(presentingViewController.view)
        containerView.addSubview(presentedViewController.view)
        
        let displacement = containerView.bounds.height - presentedViewController.detailsOverlayView.frame.minY
        let transform = CGAffineTransform(translationX: 0, y: displacement)
        presentedViewController.animatableViews.forEach { $0.transform = transform }
        
        presentedViewController.transparentOverlayView.alpha = 0
        
        UIView.animate(withDuration: self.duration, animations: {
            presentedViewController.transparentOverlayView.alpha = 1
            presentedViewController.animatableViews.forEach { $0.transform = CGAffineTransform.identity }
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
    
}
