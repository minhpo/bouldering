//
//  HideGymDetailsOverlayAnimator.swift
//  Bouldering
//
//  Created by Po Sam on 27/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class HideGymDetailsOverlayAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate let duration: TimeInterval = ViewGymsOnMapViewController.animationDuration
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let presentingViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ViewGymDetailsViewController,
            let presentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? ViewGymsOnMapViewController,
            let snapshot = presentingViewController.view.subviews.first else {
                return
        }
        
        containerView.addSubview(presentedViewController.view)
        containerView.addSubview(presentingViewController.view)
        
        let displacement = containerView.bounds.height - presentingViewController.detailsOverlayView.frame.minY
        let transform = CGAffineTransform(translationX: 0, y: displacement)
        
        UIView.animate(withDuration: duration, animations: {
            presentingViewController.transparentOverlayView.alpha = 0
            presentingViewController.animatableViews.forEach { $0.transform = transform }
            
            let displacement = abs(snapshot.frame.minY)
            snapshot.transform = CGAffineTransform(translationX: 0, y: displacement)
        }, completion: { _ in
            presentedViewController.mapView.transform = CGAffineTransform.identity
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        })
    }
    
}
