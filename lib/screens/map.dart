import 'package:favorite_places/models/place.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

const defaultGoogleLocation = PlaceLocation(
  latitude: 37.505,
  longitude: 127.056,
  address: 'posco center samsung',
);

class MapScreen extends StatefulWidget {
  const MapScreen({
    super.key,
    this.location = defaultGoogleLocation,
    this.isSelecting = true,
  });

  final PlaceLocation location;
  final bool isSelecting;

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  LatLng? _pickedLocation;
  @override
  Widget build(BuildContext context) {
    print('isSelecting: ${widget.isSelecting}');
    return Scaffold(
      appBar: AppBar(
        title:
            Text(widget.isSelecting ? 'Pick your Location' : 'Your Location'),
        actions: [
          if (widget.isSelecting)
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () {
                Navigator.of(context).pop(_pickedLocation);
              },
            )
        ],
      ),
      body: GoogleMap(
        onTap: (position) {
          if (!widget.isSelecting) {
            return;
          }
          setState(() {
            _pickedLocation = position;
          });
        },
        initialCameraPosition: CameraPosition(
          target: _pickedLocation ??
              LatLng(
                widget.location.latitude,
                widget.location.longitude,
              ),
          zoom: 16,
        ),
        markers: (_pickedLocation == null && widget.isSelecting)
            ? {}
            : {
                Marker(
                  markerId: const MarkerId('m1'),
                  position: LatLng(
                    _pickedLocation?.latitude ?? widget.location.latitude,
                    _pickedLocation?.longitude ?? widget.location.longitude,
                  ),
                ),
              },
      ),
    );
  }
}
