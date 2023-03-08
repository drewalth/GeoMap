//
//  MapView.swift
//  GeoMap
//
//  Created by Drew Althage on 3/7/23.
//

import MapKit
import SwiftUI

struct MapView: UIViewRepresentable {
    let region: MKCoordinateRegion
    let lineCoordinates: [CLLocationCoordinate2D]
    let pois: [MKAnnotation]?

    init(region: MKCoordinateRegion,
         lineCoordinates: [CLLocationCoordinate2D],
         pois: [MKAnnotation]? = nil)
    {
        self.region = region
        self.lineCoordinates = lineCoordinates
        self.pois = pois
    }

    func makeUIView(context: Context) -> MKMapView {
        let mapView = MKMapView()
        mapView.delegate = context.coordinator
        mapView.region = region

        let polyline = MKPolyline(coordinates: lineCoordinates,
                                  count: lineCoordinates.count)
        mapView.addOverlay(polyline)

        if let annotations = pois {
            mapView.register(MKMarkerAnnotationView.self,
                             forAnnotationViewWithReuseIdentifier: NSStringFromClass(POI.self))
            mapView.addAnnotations(annotations)
        }

        return mapView
    }

    func updateUIView(_: MKMapView, context _: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapView

    init(_ parent: MapView) {
        self.parent = parent
    }

    func mapView(_: MKMapView,
                 rendererFor overlay: MKOverlay) -> MKOverlayRenderer
    {
        if let routePolyline = overlay as? MKPolyline {
            let renderer = MKPolylineRenderer(polyline: routePolyline)
            renderer.strokeColor = UIColor.systemRed
            renderer.lineWidth = 4
            return renderer
        }
        return MKOverlayRenderer()
    }
}

extension Coordinator {
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !annotation.isKind(of: MKUserLocation.self) else {
            // Make a fast exit if the annotation is the `MKUserLocation`, as it's not an annotation view we wish to customize.
            return nil
        }

        var annotationView: MKAnnotationView?

        if let annotation = annotation as? POI {
            annotationView = setupBridgeAnnotationView(for: annotation, on: mapView)
        }

        return annotationView
    }

    func mapView(_: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped _: UIControl) {
        MapState.instance.selectedPOI = view.annotation?.title ?? "--"
    }

    private func setupBridgeAnnotationView(for annotation: POI, on mapView: MKMapView) -> MKAnnotationView {
        let identifier = NSStringFromClass(POI.self)
        let view = mapView.dequeueReusableAnnotationView(withIdentifier: identifier, for: annotation)
        if let markerAnnotationView = view as? MKMarkerAnnotationView {
            markerAnnotationView.animatesWhenAdded = true
            markerAnnotationView.canShowCallout = true
            markerAnnotationView.markerTintColor = UIColor(named: "internationalOrange")

            /*
             Add a detail disclosure button to the callout, which will open a new view controller or a popover.
             When the detail disclosure button is tapped, use mapView(_:annotationView:calloutAccessoryControlTapped:)
             to determine which annotation was tapped.
             If you need to handle additional UIControl events, such as `.touchUpOutside`, you can call
             `addTarget(_:action:for:)` on the button to add those events.
             */
            let rightButton = UIButton(type: .detailDisclosure)

            markerAnnotationView.rightCalloutAccessoryView = rightButton
        }

        return view
    }
}
