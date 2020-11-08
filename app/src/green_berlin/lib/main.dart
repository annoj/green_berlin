import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'src/companies.dart' as locations;

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final companies = await locations.getCompanies();
    setState(() {
      _markers.clear();
      for (final company in companies.companies) {
        final marker = Marker(
          markerId: MarkerId(company.name),
          position: LatLng(company.latitude, company.longitude),
          infoWindow: InfoWindow(
            title: company.name,
            snippet: company.category,
          ),
        );
        _markers[company.name] = marker;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Eco Companies'),
          backgroundColor: Colors.green[700],
        ),
        body: GoogleMap(
          onMapCreated: _onMapCreated,
          initialCameraPosition: CameraPosition(
            target: const LatLng(52.5166, 13.4090),
            zoom: 2,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
