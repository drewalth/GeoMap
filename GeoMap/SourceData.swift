//
//  SourceData.swift
//  GeoMap
//
//  Created by Drew Althage on 3/6/23.
//

import Foundation

/// this is what the AW API returns
///
/// we need to convert it into something usable: https://github.com/AmericanWhitewater/wh2o-vue/blob/development/src/app/views/river-detail/components/map-banner.vue#L74
/// with the turf swift package LineString() https://github.com/mapbox/turf-swift
let sourceData = "-106.219851 38.995059,-106.21982 38.994982,-106.219595 38.994735,-106.219405 38.994499,-106.219271 38.994175,-106.219144 38.993906,-106.218975 38.993769,-106.218757 38.993626,-106.218468 38.993379,-106.218208 38.993033,-106.217989 38.992791,-106.217644 38.992522,-106.217194 38.992231,-106.216497 38.991622,-106.216032 38.991155,-106.215912 38.990996,-106.215609 38.990062,-106.215433 38.989733,-106.214503 38.988096,-106.214384 38.98775,-106.214271 38.987223,-106.214292 38.986816,-106.214552 38.986141,-106.21477 38.985416,-106.214798 38.985207,-106.214643 38.984438,-106.214333 38.983691,-106.214276 38.98346,-106.21422 38.982917,-106.214163 38.982532,-106.213945 38.981824,-106.213804 38.98156,-106.21353 38.981296,-106.213297 38.981011,-106.213107 38.980615,-106.213037 38.980066,-106.212769 38.979149,-106.212811 38.978935,-106.212902 38.978666,-106.21312 38.97833,-106.21331 38.978039,-106.21338 38.977853,-106.21338 38.977556,-106.213429 38.977226,-106.213535 38.976908,-106.213556 38.976765,-106.213514 38.976529,-106.213464 38.976408,-106.213028 38.975837,-106.212859 38.975645,-106.212577 38.975403,-106.212331 38.975052,-106.211923 38.974469,-106.211099 38.973563,-106.210494 38.973031,-106.210022 38.972723,-106.209769 38.972586,-106.209551 38.972531,-106.209255 38.972504,-106.208903 38.972355,-106.208594 38.972179,-106.208537 38.972147,-106.208361 38.97196,-106.20808 38.971576,-106.20777 38.971317,-106.207566 38.971158,-106.206982 38.970763,-106.206672 38.97045,-106.20651 38.970181,-106.206362 38.969752,-106.206207 38.969434,-106.205877 38.968874,-106.20568 38.968621,-106.205454 38.968473,-106.205102 38.968275,-106.204828 38.968105,-106.204596 38.967836,-106.204392 38.967435,-106.204033 38.966798,-106.203829 38.966545,-106.203287 38.965952,-106.202731 38.965205,-106.201921 38.964414,-106.201147 38.963305,-106.200732 38.962849,-106.20057 38.962536,-106.200211 38.961899,-106.199831 38.961509,-106.19943 38.961003,-106.19905 38.960663,-106.198874 38.960482,-106.198818 38.960295,-106.198818 38.960009,-106.198825 38.959954,-106.198839 38.959828,-106.198853 38.959674,-106.198818 38.959499,-106.198733 38.95935,-106.198466 38.95912,-106.198037 38.958856,-106.197059 38.958098,-106.196348 38.957444,-106.195638 38.956747,-106.195138 38.956225,-106.194772 38.955769,-106.194294 38.954989,-106.193851 38.954512,-106.193492 38.954089,-106.193302 38.953809,-106.192971 38.953155,-106.192915 38.952825,-106.192894 38.952446,-106.192676 38.951908,-106.192586 38.951696,-106.192352 38.951145,-106.192106 38.950436,-106.192014 38.950041,-106.191423 38.948766,-106.191198 38.948129,-106.190495 38.946718,-106.190016 38.946333,-106.18906 38.945751,-106.188216 38.945339,-106.188124 38.945268,-106.187773 38.944987,-106.187238 38.944482,-106.186823 38.94412,-106.18657 38.943834,-106.186352 38.943554,-106.186183 38.943208,-106.186092 38.943109,-106.185887 38.94301,-106.18574 38.942955,-106.185627 38.942911,-106.185367 38.942746,-106.185079 38.942543,-106.184797 38.942351,-106.184418 38.942219,-106.183693 38.942098,-106.183447 38.942038,-106.183229 38.941983,-106.183088 38.941901,-106.18287 38.941725,-106.182617 38.941456,-106.18204 38.941033,-106.18159 38.940747,-106.18126 38.940582,-106.180964 38.940505,-106.180655 38.940384,-106.180528 38.940264,-106.180451 38.940192,-106.180198 38.93983,-106.179776 38.939236,-106.179494 38.938824,-106.179185 38.938506,-106.178714 38.938055,-106.17825 38.937523,-106.177554 38.9366,-106.177237 38.93616,-106.177174 38.936045,-106.176963 38.935644,-106.176365 38.934589,-106.176197 38.934282,-106.176098 38.934095,-106.175824 38.933771,-106.175177 38.93321,-106.174727 38.932936,-106.174235 38.932562,-106.174073 38.932375,-106.173834 38.931909,-106.173679 38.931771,-106.173665 38.931755,-106.173342 38.931354,-106.172772 38.930623,-106.172196 38.930222,-106.171542 38.929711,-106.170874 38.929178,-106.170698 38.928942,-106.170171 38.927805,-106.169981 38.927311,-106.169932 38.926921,-106.169764 38.92664,-106.169532 38.926009,-106.169398 38.925179,-106.169455 38.92485,-106.169638 38.924724,-106.170024 38.924432,-106.170299 38.924059,-106.170636 38.923598,-106.170677 38.923547"
