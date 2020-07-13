//
//  FirstViewController.swift
//  InfoDay2020
//
//  Created by Tsztung Wong on 13/7/2020.
//  Copyright © 2020 Tsztung Wong. All rights reserved.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    let campusLocation = CLLocation(latitude: 22.33787, longitude: 114.18131)

    @IBOutlet weak var mapView: MKMapView!
    @IBAction func resetPosition(_ sender: Any) {
        mapView.setCenterLocation(campusLocation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        mapView.setCenterLocation(campusLocation)

        for building in Building.campusBuildings {
            mapView.addAnnotation(building)
        }
        
        mapView.showsUserLocation = true
    }

}

private extension MKMapView {
    
    func setCenterLocation(_ location: CLLocation,
                           regionRadius: CLLocationDistance = 500) {
        
        let coordinateRegion = MKCoordinateRegion(
            center: location.coordinate,
            latitudinalMeters: regionRadius,
            longitudinalMeters: regionRadius)
        
        setRegion(coordinateRegion, animated: true)
    }
    
}

