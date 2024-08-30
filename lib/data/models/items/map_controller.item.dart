import 'package:camionesm/core/common/settings_extern.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapControllerItem {
  late final MapController _mapController;
  final LatLng startLocation;
  final  LatLng endLocation;
  late final LatLng _intermediaryLocation;

  LatLng get intermediaryLocation => _intermediaryLocation;

  set changeIntermediaryLocation(double percentage) {
    _intermediaryLocation= SettingsExtern.getIntermediatePosition(startLocation, endLocation,percentage: percentage);
  }

  set setIntermediaryLocation(LatLng value) {
    _intermediaryLocation = value;
  }

  MapControllerItem.empty({this.startLocation=const LatLng(0,0), this.endLocation=const LatLng(0,0)});

  MapControllerItem(this.startLocation, this.endLocation){
    _intermediaryLocation=SettingsExtern.getIntermediatePosition(startLocation, endLocation);
    _mapController=MapController();
    _initController();
  }

  void _initController(){
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _mapController.fitCamera(
          CameraFit.bounds(
              padding:const EdgeInsets.all(20.0),
              minZoom: 5,
              forceIntegerZoomLevel: true,
              maxZoom: 100,
              bounds: LatLngBounds(startLocation, _intermediaryLocation)));
    });
  }

  MapController get mapController => _mapController;
}