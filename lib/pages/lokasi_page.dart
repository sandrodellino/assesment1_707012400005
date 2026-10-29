import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LokasiPage extends StatelessWidget {
  const LokasiPage({super.key});

  static const LatLng lokasiGreenLife = LatLng(-6.914744, 107.609810);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lokasi Komunitas '),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              'Lokasi simulasi Komunitas ecomart',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Expanded(
            child: GoogleMap(
              initialCameraPosition: const CameraPosition(
                target: lokasiGreenLife,
                zoom: 15,
              ),
              markers: {
                const Marker(
                  markerId: MarkerId('ecomart'),
                  position: lokasiGreenLife,
                  infoWindow: InfoWindow(
                    title: 'EcoMart Bandung',
                    snippet: 'Lokasi simulasi komunitas',
                  ),
                ),
              },
            ),
          ),
        ],
      ),
    );
  }
}
