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
        
        var transform = CGAffineTransform(translationX: 0, y: containerView.bounds.maxY)
        
        presentedViewController.transparentOverlayView.alpha = 0
        presentedViewController.detailsOverlayView.transform = transform
        
        UIView.animate(withDuration: self.duration, animations: {
            presentedViewController.transparentOverlayView.alpha = 1
            presentedViewController.detailsOverlayView.transform = CGAffineTransform.identity
        }, completion: { finished in
            transitionContext.completeTransition(finished)
        })
    }
    
}

