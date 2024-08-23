import 'package:camionesm/app/widgets/images/image_assets.widget.dart';
import 'package:camionesm/core/values/globals.dart';
import 'package:camionesm/core/values/paths.dart';
import 'package:camionesm/data/models/items/map_controller.item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';


class CustomFlutterMap extends StatelessWidget{
  final MapControllerItem mapControllerItem;
  final bool haveIntermediary ;
  const CustomFlutterMap(this.mapControllerItem, {super.key, this.haveIntermediary=false});
  @override
  Widget build(BuildContext context) {
    return FlutterMap(
        mapController: mapControllerItem.mapController,
        options: const MapOptions(minZoom: 5, maxZoom: 16),
        children: [
          TileLayer(urlTemplate: Globals.templateURL,
              userAgentPackageName: Globals.packageName,
              maxNativeZoom: 19),
           MarkerLayer(markers: [
            Marker(
                width: 60.0,
                height: 60.0,
                rotate: true,
                point: mapControllerItem.startLocation,
                child: const CircleAvatar(
                    backgroundColor: Globals.principalColor,
                    child: Icon(Icons.location_on_outlined,
                        color: Colors.black, size: 40.0))),
             if(haveIntermediary)
             Marker(
                 width: 60.0,
                 height: 60.0,
                 rotate: true,
                 point: mapControllerItem.intermediaryLocation,
                 child: const CircleAvatar(
                     backgroundColor: Globals.principalColor,
                     child: CustomImageAssets(url:Paths.aerialTruck,width: 50,height: 50,))),
            Marker(
                width: 60.0,
                height: 60.0,
                rotate: true,
                point: mapControllerItem.endLocation,
                child: const CircleAvatar(
                    backgroundColor: Globals.principalColor,
                    child: Icon(Icons.location_on,
                        color: Colors.black, size: 40.0)))
          ]),
          PolylineLayer(polylines: [
            Polyline(points: [
              mapControllerItem.startLocation,
              mapControllerItem.endLocation
            ], strokeWidth: 3.0, color: Colors.black)
          ])
        ]);
  }


}