
# GeoMap (RiverMap)

![banner](/docs/demo-01.png)

A proof-of-concept for building out a river map similar to American Whitewater's using SwiftUI.

---

For a while now I've been working on an app that provides similar services/functionality to [American Whitewater](https://www.americanwhitewater.org/) (AW). These days however, I am more interested in collaborating with AW than competing against them. So I have started refactoring my app to fit their data model. This POC app, GeoMap, is a first crack at building AW's river map in a more "SwiftUI way"... yes, I am using `UIViewRepresentable` so UIKit is still involved, but the MapView's surroundings and the navigation are SwiftUI.

This app uses the data for the [Arkansas River, The Numbers](https://www.americanwhitewater.org/content/River/view/river-detail/356/map) section that was copied using Google Devtools and is hardcoded in [MockData.swift](/GeoMap/MockData.swift).

## Goals

### Fill in the Functionality Gaps

AW's webapp uses [MapBox](https://www.mapbox.com/) for it's river detail maps and the mobile app uses MapKit. The webapp draws the river section and adds river features like rapids, as points on the map. As far as I could tell, (didn't look very long), the mobile app does neither and both are possible with MapKit.

## Comparisons

### GeoMap

![demo-01](/docs/demo-01.png)
![demo-02](/docs/demo-02.png)
![demo-03](/docs/demo-03.png)

### AW

<img alt="aw-web-01" height="350" src="/docs/aw-web-01.png" width="auto"/>
<img alt="aw-mobile-01" height="250" src="/docs/aw-mobile-01.PNG" width="auto"/>
<img alt="aw-mobile-02" height="250" src="/docs/aw-mobile-02.PNG" width="auto"/>
<img alt="aw-mobile-03" height="250" src="/docs/aw-mobile-03.PNG" width="auto"/>

## ToDo

- [ ] Different map annotation views for different types of river features. 
