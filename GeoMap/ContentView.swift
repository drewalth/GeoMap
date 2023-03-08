//
//  ContentView.swift
//  GeoMap
//
//  Created by Drew Althage on 3/6/23.
//

import MapKit
import os
import SwiftUI

struct ContentView: View {
    @StateObject var mapState = MapState.instance
    @StateObject var viewModel = ViewModel()

    @State var navigationPath = NavigationPath()

    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack(alignment: .topLeading) {
                if let mapData = viewModel.mapInfo {
                    MapView(
                        region: mapData.region,
                        lineCoordinates: mapData.coordinates,
                        pois: viewModel.mapAnnotations
                    )
                    .edgesIgnoringSafeArea(.all)
                } else {
                    Text("no map data")
                }
            }.navigationDestination(for: String.self) { path in
                VStack {
                    Text("feature detail")
                }.navigationTitle(path)
                    .navigationBarTitleDisplayMode(.large)
            }.onChange(of: mapState.selectedPOI) { newValue in
                if let selectedPOIName = newValue {
                    navigationPath.append(selectedPOIName)
                }
            }
        }
    }
}

extension ContentView {
    @MainActor
    class ViewModel: ObservableObject {
        private let logger = Logger()

        @Published var reach: Reach

        var mapInfo: MapInfo? {
            guard let geom = reach.geom else { return nil }

            // TODO: calculate based on reach length
            let zoom: CLLocationDistance = 5000 * 2

            let coords = getCoordinates(geomString: geom)
            let center = coords[(coords.count / 2) - 1]
            let region = MKCoordinateRegion(
                center: center,
                latitudinalMeters: zoom, longitudinalMeters: zoom
            )

            return MapInfo(region: region, coordinates: coords)
        }

        var mapAnnotations: [MKAnnotation] {
            guard let pois = reach.pois else { return [] }

            return pois.filter { $0.rloc != nil }
        }

        init(reach: Reach = MockData().reaches[0]) {
            self.reach = reach
        }

        private func getCoordinates(geomString: String) -> [CLLocationCoordinate2D] {
            var result: [CLLocationCoordinate2D] = []
            let coords = geomString.split(separator: ",")

            for coord in coords {
                let val = coord.split(separator: " ")
                guard let lat = Double(val[1]),
                      let lon = Double(val[0])
                else {
                    logger.debug("error parsing poi latitude and/or longitude")
                    continue
                }

                let locVal = CLLocationCoordinate2D(latitude: lat, longitude: lon)
                result.append(locVal)
            }

            return result
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
