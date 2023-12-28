import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesScreen extends StatelessWidget {
  const PlacesScreen({super.key});

  void _addPlace(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => AddPlaceScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Places'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              _addPlace(context);
            },
          ),
        ],
      ),
      body: PlacesList(
        places: [],
      ),
    );
  }
}
