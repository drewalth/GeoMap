//
//  MapState.swift
//  GeoMap
//
//  Created by Andrew Althage on 3/7/23.
//

import Foundation

class MapState: ObservableObject {
    static let instance = MapState()

    @Published var selectedPOI: String?
}
