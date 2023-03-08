//
//  ContentView.swift
//  GeoMap
//
//  Created by Drew Althage on 3/6/23.
//

import MapKit
import SwiftUI

struct ContentView: View {
    private let geoManager = GeoManager()

    @StateObject var mapState = MapState.instance

    @State var mapInfo: MapInfo?
    @State var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            Group {
                if let mapData = mapInfo {
                    MapView(
                        region: mapData.region,
                        lineCoordinates: mapData.coordinates,
                        pois: geoManager.getMapAnnotations(for: reachPOIS)
                    )
                    .edgesIgnoringSafeArea(.all)
                } else {
                    Text("no map data")
                }
            }.onAppear {
                mapInfo = geoManager.getMapInfo(from: reachGeom)
            }.navigationDestination(for: String.self) { path in
                Text(path)
            }.onChange(of: mapState.selectedPOI) { newValue in
                if let selectedPOIName = newValue {
                    navigationPath.append(selectedPOIName)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
