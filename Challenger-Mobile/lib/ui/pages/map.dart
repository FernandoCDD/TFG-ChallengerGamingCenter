import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MyMap extends StatefulWidget {
  const MyMap({super.key});

  @override
  State<MyMap> createState() => _MyMapState();
}

class _MyMapState extends State<MyMap> {
  late Set<Marker> set = {};

  @override
  initState() {
    super.initState();
    set.add(const Marker(
        markerId: MarkerId('Challenger Gaming Center'),
        position: LatLng(37.3749247, -6.0028253)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: 360,
      child: GoogleMap(
          markers: set,
          initialCameraPosition: const CameraPosition(
              target: LatLng(37.3748439, -6.0052547), zoom: 16)),
    );
  }
}
