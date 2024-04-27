import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../../app/utils/app_colors.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../main.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key, required this.lat, required this.long});
  final double lat;
  final double long;

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late GoogleMapController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(),
      body:  GoogleMap(
        initialCameraPosition:  CameraPosition(
          target: LatLng(widget.lat, widget.long),
          zoom: 10.4746,
          bearing: 2,
          tilt: 5
        ),
        onMapCreated: (con) {
          controller = con;
        },
        markers: {
          Marker(
            markerId: const MarkerId("1"),
            position: LatLng(widget.lat, widget.long),
          ),
          Marker(
            markerId: const MarkerId("2"),
            position: LatLng(myPosition!.latitude, myPosition!.longitude),
          ),
        },
        polylines: {
          Polyline(
              polylineId: const PolylineId("1"),
              color: AppColors.green
              ,
              points: [
                LatLng(widget.lat, widget.long),
                LatLng(myPosition!.latitude, myPosition!.longitude),
              ]
          )
        },
      ),
    );
  }
}
