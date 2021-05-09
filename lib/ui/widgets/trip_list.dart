/*
import 'package:grampacker/models/battle.dart';
import 'package:flutter/material.dart';
import 'package:grampacker/ui/widgets/trip_item.dart';
import 'package:grampacker/viewmodels/home_view_model.dart';

class TripsList extends StatelessWidget {
  final HomeViewModel model;
  const TripsList({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Trip> trips = model.trips;
    return trips != null
        ? ListView.builder(
            itemCount: trips.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => model.navigateToTripDetailsView(index),
              child: TripItem(
                trip: trips[index],
                onDeleteItem: () => model.deleteTrip(index),
                //onTap: () => model.navigateToTripDetailsView(index)),
              ),
            ),
          )
        : Center(
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation(Theme.of(context).primaryColor),
            ),
          );
  }
}
*/