import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_important/core/constant_methods.dart';
import 'package:flutter_important/presentation/widgets/default_map.dart';
import 'package:flutter_important/presentation/widgets/default_text.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/constants.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({Key? key}) : super(key: key);

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {

  LatLng? pickedLocation;
  Position? myLocation;

  @override
  void initState() {
    determinePosition().then((value) {
      setState(() {
        myLocation = value;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const DefaultText(text: 'Map Screen',)),
      body: SafeArea(
          child: DefaultMap(
              initialCameraPosition: initialCameraPosition,
            onTap: (location){
                setState(() {
                  pickedLocation = location;
                  if (kDebugMode) {
                    print('pickedLat: ${pickedLocation!.latitude}, pickedLng: ${pickedLocation!.longitude}');
                  }
                });
            },
            markers: pickedLocation != null
            ? {
                if(myLocation != null)
                Marker(
                  markerId: const MarkerId('My Location'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
                  position: LatLng(myLocation!.latitude, myLocation!.longitude)
                ),
              Marker(
                  markerId: const MarkerId('Picked Location'),
                  position: pickedLocation!
                ),
            }
            : {
              if(myLocation != null)
                Marker(
                    markerId: const MarkerId('My Location'),
                    icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
                    position: LatLng(myLocation!.latitude, myLocation!.longitude)
                ),
              Marker(
                  markerId: const MarkerId('Initial Location'),
                  position: initialCameraPosition.target,
              ),
            },
            circles: pickedLocation != null
                ? {
                if(myLocation != null)
              Circle(
                  circleId: const CircleId('My Location'),
                  center: LatLng(myLocation!.latitude, myLocation!.longitude),
                  radius: 20 * 1000,
                  fillColor: Colors.red.withOpacity(0.3),
                  strokeColor: Colors.blue,
                  strokeWidth: 2
              ),
              Circle(
                  circleId: const CircleId('Picked Location'),
                  center: pickedLocation!,
                  radius: 20 * 1000,
                  fillColor: Colors.blue.withOpacity(0.3),
                  strokeColor: Colors.red,
                  strokeWidth: 2
              ),
            }
                : {
              if(myLocation != null)
                Circle(
                    circleId: const CircleId('My Location'),
                    center: LatLng(myLocation!.latitude, myLocation!.longitude),
                    radius: 20 * 1000,
                    fillColor: Colors.red.withOpacity(0.3),
                    strokeColor: Colors.blue,
                    strokeWidth: 2
                ),
              Circle(
                  circleId: const CircleId('Initial Location'),
                  center: initialCameraPosition.target,
                  radius: 20 * 1000,
                  fillColor: Colors.blue.withOpacity(0.3),
                  strokeColor: Colors.red,
                  strokeWidth: 1
              ),
            },
          ),
      ),
    );
  }
}
