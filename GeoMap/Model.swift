//
//  Model.swift
//  GeoMap
//
//  Created by Drew Althage on 3/7/23.
//

import Foundation
import MapKit

/// River, stream, or creek
struct Reach: Identifiable {
    let id = UUID()
    var name: String
    var section: String
    var geom: String?
    var pois: [POI]?
}

/// Point-of-interest like a rapid, access point, a portage, etc. The majority of POIs are rapids.
class POI: NSObject, MKAnnotation {
    let id = UUID()
    var name: String
    var grade: String?
    var rloc: String?

    init(name: String, grade: String? = nil, rloc: String? = nil) {
        self.name = name
        self.grade = grade
        self.rloc = rloc
    }

    var title: String? {
        NSLocalizedString(name, comment: "POI name: \(name)")
    }

    var subtitle: String? {
        if let grade = grade {
            return NSLocalizedString("Difficulty: \(grade)", comment: "difficulty")
        }
        return NSLocalizedString("-", comment: "difficulty")
    }

    var coordinate: CLLocationCoordinate2D {
        var result: CLLocationCoordinate2D = .init()

        guard let relativeLocation = rloc else { return result }

        let val = relativeLocation.split(separator: " ")

        if let longitude = Double(val[0]),
           let latitude = Double(val[1])
        {
            result = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        }

        return result
    }
}

struct MapInfo {
    var region: MKCoordinateRegion
    var coordinates: [CLLocationCoordinate2D]
}
