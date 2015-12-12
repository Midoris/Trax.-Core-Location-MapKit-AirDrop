//
//  WaypointImageViewController.swift
//  Trax
//
//  Created by тигренок  on 12/12/15.
//  Copyright (c) 2015 Midori.s. All rights reserved.
//

import UIKit

class WaypointImageViewController: ImageViewController {

    var waypoint: GPX.Waypoint? {
        didSet {
            imageURL = waypoint?.imageURL // my super's Model
            title = waypoint?.name
            updateEmbeddedMap()
        }
    }
    
    // I "prepare" for the embed segue
    // by grabbing the MVC that is embedded
    // I can then update it whenever it might need it
    
    var smvc: SimpleMapViewController?
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "Embed Map" {
            smvc = segue.destinationViewController as? SimpleMapViewController
            updateEmbeddedMap()
        }
    }
    
    
    func updateEmbeddedMap()
    {
        if let mapView = smvc?.mapView {
            mapView.mapType = .Hybrid
            mapView.removeAnnotations(mapView.annotations)
            mapView.addAnnotation(waypoint)
            mapView.showAnnotations(mapView.annotations, animated: true)
        }
    }

    
}
