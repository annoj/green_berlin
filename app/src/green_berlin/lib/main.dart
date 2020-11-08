import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;


void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

List<Company> parseCompanies(String responseBody) {
  final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Company>((json) => Company.fromJson(json))
      .toList();
}

Future<List<Company>> fetchCompanies(http.Client client) async {
  final response = await client.get('https://wa5p.xyz/api/companies/all');
  return compute(parseCompanies, response.body);
}

class Company {
  final double lat;
  final double lng;
  final String name;
  final String companyCategory;
  final String addrStreet;
  final String addrExtra;
  final String addrStreetNumber;
  final String addrZipCode;
  final String addrCity;
  final String contactEmail;
  final String contactPhone;
  final String contactPerson;
  final String contactWebsite;
  final String openingHours;

  Company({
      this.lat,
      this.lng,
      this.name,
      this.companyCategory,
      this.addrStreet,
      this.addrExtra,
      this.addrStreetNumber,
      this.addrZipCode,
      this.addrCity,
      this.contactEmail,
      this.contactPhone,
      this.contactPerson,
      this.contactWebsite,
      this.openingHours});

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      lat: json['latitude'] as double,
      lng: json['longitude'] as double,
      name: json['company_name'] as String,
      companyCategory: json['company_category'] as String,
      addrStreet: json['addr_street'] as String,
      addrExtra: json['addr_extra'] as String,
      addrStreetNumber: json['addr_street_number'] as String,
      addrZipCode: json['addr_zip_code'] as String,
      addrCity: json['addr_city'] as String,
      contactEmail: json['contact_email'] as String,
      contactPhone: json['contact_phone'] as String,
      contactPerson: json['contact_person'] as String,
      contactWebsite: json['contact_website'] as String,
      openingHours: json['opening_hours'] as String
    );
  }
}


class _MyAppState extends State<MyApp> {
  final Map<String, Marker> _markers = {};
  Future<void> _onMapCreated(GoogleMapController controller) async {
    final companies = await fetchCompanies(http.Client());
    setState(() {
      _markers.clear();
      for (final company in companies) {
        if (company.lat != null && company.lng != null) {
          final marker = Marker(
            markerId: MarkerId(company.name),
            position: LatLng(company.lat, company.lng),
            infoWindow: InfoWindow(
              title: company.name,
              snippet: company.companyCategory,
            ),
          );
          _markers[company.name] = marker;
        }
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
            zoom: 14,
          ),
          markers: _markers.values.toSet(),
        ),
      ),
    );
  }
}
