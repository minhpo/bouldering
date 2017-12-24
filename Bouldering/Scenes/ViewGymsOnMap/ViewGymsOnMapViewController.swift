//
//  ViewGymsOnMapViewController.swift
//  Bouldering
//
//  Created by Po Sam on 23/12/2017.
//  Copyright (c) 2017 Mobairu. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit
import MapKit

protocol ViewGymsOnMapDisplayLogic: class {
    func display(viewModels: [GymPoiViewModel])
}

class ViewGymsOnMapViewController: UIViewController, ViewGymsOnMapDisplayLogic {
    
    @IBInspectable var poiImage: UIImage!
    @IBOutlet weak var mapView: MKMapView! {
        didSet {
            mapView.delegate = self
        }
    }
    
    var interactor: ViewGymsOnMapBusinessLogic?
    var router: (NSObjectProtocol & ViewGymsOnMapRoutingLogic & ViewGymsOnMapDataPassing)?
    
    // MARK: Object lifecycle
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    // MARK: Setup
    
    private func setup() {
        let viewController = self
        let interactor = ViewGymsOnMapInteractor(gymsRepository: ServiceLocator.default.gymsRepository)
        let presenter = ViewGymsOnMapPresenter()
        let router = ViewGymsOnMapRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        interactor?.start()
    }
    
    // MARK: Do something
    
    func display(viewModels: [GymPoiViewModel]) {
        let annotations = viewModels.map { viewModel -> MKAnnotation in
            let title = viewModel.name
            let coordinate = CLLocationCoordinate2D(latitude: viewModel.latitude, longitude: viewModel.longitude)
            
            return GymPoiAnnotation(title: title, coordinate: coordinate)
        }
        
        self.mapView.addAnnotations(annotations)
    }
    
}

extension ViewGymsOnMapViewController: MKMapViewDelegate {
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard let gymPoiAnnotation = annotation as? GymPoiAnnotation else { return nil }
        
        let identifier = "marker"
        let annotationView = mapView.dequeueReusableAnnotationView(withIdentifier: identifier)
            ?? MKAnnotationView(annotation: gymPoiAnnotation, reuseIdentifier: identifier)
        annotationView.image = poiImage
        annotationView.annotation = gymPoiAnnotation
        
        annotationView.bounds.size = CGSize(width: 30, height: 33)
        annotationView.centerOffset = CGPoint(x: 0, y: -annotationView.bounds.midY)
        
        return annotationView
    }
    
}
