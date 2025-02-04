import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsPage extends StatefulWidget {
  @override
  _GoogleMapsPageState createState() => _GoogleMapsPageState();
}

class _GoogleMapsPageState extends State<GoogleMapsPage> {
  // Coordinates for Cairo, Egypt
  static final LatLng _cairoLocation = LatLng(30.0444, 31.2357);

  // Google Maps Controller
  late GoogleMapController _mapController;

  // Set of markers
  Set<Marker> _markers = {};

  @override
  void initState() {
    super.initState();
    // Add marker for Cairo when the page initializes
    _addCairoMarker();
  }

  // Method to add marker for Cairo
  void _addCairoMarker() {
    _markers.add(
      Marker(
        markerId: MarkerId('cairo_marker'),
        position: _cairoLocation,
        infoWindow: InfoWindow(
          title: 'Cairo, Egypt',
          snippet: 'Capital City',
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    );
  }

  // Method to handle map created
  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Google Map'),
        centerTitle: true,
      ),
      body: GoogleMap(
        // Initial camera position (centered on Cairo)
        initialCameraPosition: CameraPosition(
          target: _cairoLocation,
          zoom: 10.0, // Zoom level
        ),
        // Enable map rotation and tilt
        rotateGesturesEnabled: true,
        scrollGesturesEnabled: true,
        zoomGesturesEnabled: true,

        // Add markers
        markers: _markers,

        // Callback when map is created
        onMapCreated: _onMapCreated,
      ),

      // Floating Action Buttons for map interactions
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(32),
        child: Align(
          alignment: Alignment.bottomLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Zoom In Button
              FloatingActionButton(
                heroTag: 'zoomIn',
                mini: true,
                child: Icon(Icons.add),
                onPressed: () {
                  _mapController.animateCamera(
                    CameraUpdate.zoomIn(),
                  );
                },
              ),

              // Zoom Out Button
              FloatingActionButton(
                heroTag: 'zoomOut',
                mini: true,
                child: Icon(Icons.remove),
                onPressed: () {
                  _mapController.animateCamera(
                    CameraUpdate.zoomOut(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}