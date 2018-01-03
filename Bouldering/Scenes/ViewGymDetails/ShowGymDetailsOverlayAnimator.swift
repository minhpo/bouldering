//
//  ShowGymDetailsOverlayAnimator.swift
//  Bouldering
//
//  Created by Po Sam on 27/12/2017.
//  Copyright © 2017 Mobairu. All rights reserved.
//

import UIKit

class ShowGymDetailsOverlayAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    fileprivate let duration: TimeInterval = ViewGymsOnMapViewController.animationDuration
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        guard let presentingViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from) as? ViewGymsOnMapViewController,
            let presentedViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) as? ViewGymDetailsViewController else {
                return
        }
        
        containerView.addSubview(presentingViewController.view)
        containerView.addSubview(presentedViewController.view)
        
        let displacement = containerView.bounds.height - presentedViewController.detailsOverlayView.frame.minY
        let transform = CGAffineTransform(translationX: 0, y: displacement)
        presentedViewController.animatableViews.forEach { $0.transform = transform }
        
        presentedViewController.transparentOverlayView.alpha = 0
        
        UIView.animate(withDuration: duration, animations: {
            let mapViewDisplacement = self.getMapViewDisplacement(containerView: containerView, presentingViewController: presentingViewController, presentedViewController: presentedViewController)
            presentingViewController.mapView.transform = CGAffineTransform(translationX: 0, y: -mapViewDisplacement)
            
            presentedViewController.animatableViews.forEach { $0.transform = CGAffineTransform.identity }
            presentedViewController.transparentOverlayView.alpha = 1
        }, completion: { _ in
            if !transitionContext.transitionWasCancelled {
                if let snapshot = presentingViewController.mapView.snapshotView(afterScreenUpdates: false) {
                    snapshot.frame = presentingViewController.mapView.frame
                    presentedViewController.view.insertSubview(snapshot, at: 0)
                }
                
                transitionContext.completeTransition(true)
            } else {
                transitionContext.completeTransition(false)
            }
        })
    }
    
    private func getMapViewDisplacement(containerView: UIView, presentingViewController: ViewGymsOnMapViewController, presentedViewController: ViewGymDetailsViewController) -> CGFloat {
        let newHeight = containerView.bounds.height - presentedViewController.detailsOverlayView.bounds.height
        let newCenterPosition = newHeight/2
        
        let displacement = containerView.bounds.midY - newCenterPosition
        
        return displacement
    }
    
}
