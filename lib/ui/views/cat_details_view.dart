/**
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:grampacker/core/models/item.dart';
import 'package:grampacker/core/viewmodels/inventory_details_view_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stacked/stacked.dart';

class InventoryDetailsView extends StatelessWidget {
  final Cat cat;
  CatDetailsView({Key key, this.cat}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("InventoryDetailsView (build): item name: " + cat.name);
    return ViewModelBuilder<CatDetailsViewModel>.reactive(
        viewModelBuilder: () => CatDetailsViewModel(),
        disposeViewModel: false,
        onModelReady: (model) => model.listenToGearItemDetails(
            gearItemId: cat.documentId,
            userId: Provider.of<User>(context).uid),
        builder: (context, model, child) {
          return Scaffold(
              body: Stack(
            children: [
              //note: handle null case further up
              cat.imageUrl != null
                  ? Image.network(cat.imageUrl)
                  : Image.asset("lib/assets/camera.png"),
              CustomScrollView(
                slivers: [
                  SliverAppBar(
                    elevation: 0,
                    expandedHeight: 300,
                    backgroundColor: Colors.transparent,
                    leading: NeumorphicButton(
                      margin: EdgeInsets.only(top: 12),
                      onPressed: () => model.back(),
                      style: NeumorphicStyle(
                        shape: NeumorphicShape.flat,
                        boxShape: NeumorphicBoxShape.circle(),
                        color: Colors.white,
                        //border: NeumorphicBorder()
                      ),
                      padding: const EdgeInsets.only(right: 5.0),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.black,
                      ),
                    ),
                    actions: [
                      NeumorphicButton(
                        margin: EdgeInsets.only(top: 12),
                        onPressed: () => model.navigateToCreateInventoryView(),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.circle(),
                          color: Colors.white,
                          //border: NeumorphicBorder()
                        ),
                        child: Icon(
                          Icons.edit,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(20),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 20),
                          Center(
                            child: Container(
                              width: 100,
                              height: 5,
                              decoration: BoxDecoration(
                                color: Colors.grey[300],
                                borderRadius: BorderRadius.circular(20),
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Row(
                            children: [
                              Expanded(
                                child: Text(
                                  item.name,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 25,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 10),
                            ],
                          ),
                          InkWell(
                            onTap: () {},
                            child: Text(
                              item.category.toString(),
                              style: TextStyle(
                                color: Theme.of(context).accentColor,
                                fontSize: 12.5,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            "Weight: " + item.weight.toString() + " oz",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 25),
                          Text(
                            'Notes:',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 500),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ));
        });
  }
}
*/