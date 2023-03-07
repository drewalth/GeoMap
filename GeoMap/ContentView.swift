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

    @State var mapInfo: MapInfo?

    var body: some View {
        Group {
            if let mapData = mapInfo {
                MapView(
                    region: mapData.region,
                    lineCoordinates: mapData.coordinates
                )
                .edgesIgnoringSafeArea(.all)
            } else {
                Text("no map data")
            }
        }.onAppear {
            mapInfo = geoManager.getMapInfo(from: sourceData)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
