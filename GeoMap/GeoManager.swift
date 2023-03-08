//
//  GeoManager.swift
//  GeoMap
//
//  Created by Drew Althage on 3/6/23.
//

import Foundation
import MapKit
import os

struct GeoManager {
    private var logger = Logger()

    func getMapAnnotations(for reachPOIS: [POI]) -> [MKAnnotation] {
        reachPOIS.filter { $0.rloc != nil }
    }

    func getMapInfo(from geomString: String) -> MapInfo {
        let zoom: CLLocationDistance = 5000 * 2

        let coords = getCoordinates(geomString: geomString)
        let center = coords[(coords.count / 2) - 1]
        let region = MKCoordinateRegion(
            center: center,
            latitudinalMeters: zoom, longitudinalMeters: zoom
        )

        return MapInfo(region: region, coordinates: coords)
    }

    private func getCoordinates(geomString: String) -> [CLLocationCoordinate2D] {
        var result: [CLLocationCoordinate2D] = []
        let coords = geomString.split(separator: ",")

        for coord in coords {
            let val = coord.split(separator: " ")
            guard let lat = Double(val[1]),
                  let lon = Double(val[0])
            else {
                print("error with lat lon")
                continue
            }

            let locVal = CLLocationCoordinate2D(latitude: lat, longitude: lon)
            result.append(locVal)
        }

        return result
    }
}

struct MapInfo {
    var region: MKCoordinateRegion
    var coordinates: [CLLocationCoordinate2D]
}
