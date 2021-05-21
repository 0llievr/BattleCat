import 'dart:ui';

import 'package:battlecats/viewmodels/battle_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:battlecats/models/cat.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class BattleHomeView extends StatelessWidget {
  const BattleHomeView({Key key, this.cats}) : super(key: key);

  final List<Cat> cats;

  @override
  Widget build(BuildContext context) {
    User curUser = Provider.of(context);
    print("cats" + cats.toString());
    return curUser != null
        ? ViewModelBuilder<BattleHomeViewModel>.reactive(
            viewModelBuilder: () => BattleHomeViewModel(cats),
            disposeViewModel: false,
            builder: (context, model, child) {
              List catNames = <String>[];
              model.cats?.forEach((cat) {
                catNames.add(cat.name);
              });
              return Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DropdownButton<Cat>(
                    value: model.active,
                    items: model.cats?.map<DropdownMenuItem<Cat>>((cat) {
                      return DropdownMenuItem<Cat>(
                        value: cat,
                        child: Text(cat.name),
                      );
                    })?.toList(),
                    onChanged: (Cat newValue) {
                      print("updated: " + newValue.name);
                      model.setActiveCat(newValue);
                    },
                    icon: const Icon(Icons.arrow_downward),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(color: Colors.deepPurple),
                    underline: Container(
                      height: 2,
                      color: Colors.deepPurpleAccent,
                    ),
                  ),
                  Container(
                    child: model.active != null
                        ? Image.network(model.active.imageUrl)
                        : Container(),
                  ),
                  Center(
                      child: ElevatedButton(
                          onPressed: null, child: Text("Battle!")))
                ],
              );
            },
          )
        : CircularProgressIndicator();
  }
}

/*
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
*/
