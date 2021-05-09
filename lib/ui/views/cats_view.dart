import 'package:grampacker/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:grampacker/ui/widgets/cat_item.dart';
import 'package:grampacker/viewmodels/home_view_model.dart';

class CatList extends StatelessWidget {
  final HomeViewModel model;
  const CatList({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Cat> cats = model.cats;
    return cats != null
        ? ListView.builder(
            itemCount: cats.length,
            itemBuilder: (context, index) => GestureDetector(
              //onTap: () => model.editTrip(index),
              child: CatItem(
                cat: cats[index],
                onDeleteItem: () => model.deleteCat(index),
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
