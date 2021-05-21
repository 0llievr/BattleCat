import 'dart:io';

import 'package:battlecats/models/battle.dart';
import 'package:battlecats/ui/views/captured_view.dart';
import 'package:battlecats/ui/views/home_view.dart';
import 'package:flutter/material.dart';
import 'package:battlecats/constants/route_names.dart';
import 'package:battlecats/ui/views/login_view.dart';
import 'package:battlecats/ui/views/signup_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  switch (settings.name) {
    case LoginViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: LoginView(),
      );
    case SignUpViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: SignUpView(),
      );
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case CaptureViewRoute:
      var imageFile = settings.arguments as File;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CaptureView(imageFile: imageFile),
      );
    /*
    case CreateListViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateListView(),
      );
    case CreateInventoryViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: CreateInventoryView(),
      );
    case TripDetailsViewRoute:
      var tripDocumentId = settings.arguments as String;
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: TripDetailsView(tripDocumentId: tripDocumentId),
      );
      */
    default:
      return MaterialPageRoute(
          builder: (_) => Scaffold(
                body: Center(
                    child: Text('No route defined for ${settings.name}')),
              ));
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
      settings: RouteSettings(
        name: routeName,
      ),
      builder: (_) => viewToShow);
}
