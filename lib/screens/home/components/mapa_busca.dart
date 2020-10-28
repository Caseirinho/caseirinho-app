import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaBusca extends StatefulWidget {
  @override
  _MapaBuscaState createState() => _MapaBuscaState();
}

class _MapaBuscaState extends State<MapaBusca> {
  var lat = -24.0795018;
  var long = -46.5896982;
  var zoom = 16.0;

  GoogleMapController controller;
  Set<Marker> markers = {
    Marker(
      markerId: MarkerId("maria-doces"),
      position: LatLng(-24.0791042, -46.5916632),
      infoWindow: InfoWindow(
        title: "Maria doces e bolos",
        snippet: "Bolos - 5.0 ⭐",
      ),
    ),
    Marker(
      markerId: MarkerId("brigaderia-vila-maria"),
      position: LatLng(-24.0780099, -46.5884233),
      infoWindow: InfoWindow(
        title: "Brigaderia Vila Maria",
        snippet: "Bolos - 4.8 ⭐",
      ),
    ),
    Marker(
      markerId: MarkerId("brigadeiros-da-vo"),
      position: LatLng(-24.0797496,-46.5924123),
      infoWindow: InfoWindow(
        title: "Brigadeiros da vó",
        snippet: "Bolos - 4.55 ⭐",
      ),
    ),
  };

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GoogleMap(
        initialCameraPosition: CameraPosition(
          target: LatLng(lat, long),
          zoom: zoom,
        ),
        onMapCreated: _onMapCreated,
        markers: markers,
        myLocationEnabled: true,
        buildingsEnabled: false,
      ),
    );
  }

  void _onMapCreated(GoogleMapController controller) {
    this.controller = controller;
  }
}
