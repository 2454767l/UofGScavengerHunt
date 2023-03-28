import 'dart:async';
import 'dart:core';
import 'dart:math';
import 'package:U_of_G_Treasure_Hunt/screens/challenges/cloistersChallenge/cloistersChallenge.dart';
import 'package:U_of_G_Treasure_Hunt/screens/home/stevensonPopUpCard.dart';
import 'package:U_of_G_Treasure_Hunt/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:flutter/material.dart';
import '../../services/database.dart';
import '../../style.dart';
import '../challenges/QMUChallenge/QMUChallengeWelcome.dart';
import 'cloistersPopUpCard.dart';
import 'QMUPopUpCard.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  final Completer<GoogleMapController> _controller = Completer();

  /*
  late AnimationController _animationController;
  late final Animation<double> _animation = CurvedAnimation(
    parent: _animationController,
    curve: Curves.easeIn,
  );
  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }*/

  bool? QMUCompletionstatus;
  bool? CloistersCompletionstatus;
  bool? StevensonCompletionstatus;

  void getUserQMUCompletionStatus() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User _firebaseUser = await _auth.currentUser!;

    QMUCompletionstatus =
        await OurDatabase().getQMUChallengeCompletionStatus(_firebaseUser.uid);
  }

  void getUserCloistersCompletionStatus() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User _firebaseUser = await _auth.currentUser!;

    CloistersCompletionstatus = await OurDatabase()
        .getCloistersChallengeCompletionStatus(_firebaseUser.uid);
  }

  void getUserStevensonCompletionStatus() async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    User _firebaseUser = await _auth.currentUser!;

    StevensonCompletionstatus = await OurDatabase()
        .getStevensonChallengeCompletionStatus(_firebaseUser.uid);
  }

  //location used for lib testing
  //static const LatLng cloistersChallengeLocation = LatLng(55.873325, -4.288982);

  //location used for home testing
  //static const LatLng cloistersChallengeLocation = LatLng(55.874051, -4.295061);

  //location used for edinburgh testing
  //static const LatLng stevensonChallengeLocation = LatLng(55.926235, -3.204418);

  //Real location
  static const LatLng qmuChallengeLocation = LatLng(55.873658, -4.291562);

  static const LatLng cloistersChallengeLocation = LatLng(55.871523, -4.288451);

  static const LatLng stevensonChallengeLocation = LatLng(55.872859, -4.285697);

  LocationData? currentLocation;

  double calculateDistance(lat1, lon1, lat2, lon2) {
    var p = 0.017453292519943295;
    var a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  void getCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        print("Service is Disabled");
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        print("Permission not granted");
      }
    }

    location.getLocation().then(
      (location) {
        if (this.mounted) {
          setState(() => currentLocation = location);
        }
      },
    );

    GoogleMapController googleMapController = await _controller.future;

    location.onLocationChanged.listen(
      (newLoc) {
        currentLocation = newLoc;
        /*googleMapController.animateCamera(
          CameraUpdate.newCameraPosition(
            CameraPosition(
              zoom: 50,
              target: LatLng(newLoc.latitude!, newLoc.longitude!),
            ),
          ),
        );*/
        if (this.mounted) {
          setState(() {});
        }
      },
    );
  }

  BitmapDescriptor currentLocationIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor qmuChallengeIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor cloistersChallengeIcon = BitmapDescriptor.defaultMarker;
  BitmapDescriptor stevensonChallengeIcon = BitmapDescriptor.defaultMarker;

  void addCustomMarkerIcon() {
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), "assets/user_group.png")
        .then(
      (icon) {
        setState(() => currentLocationIcon = icon);
      },
    );
    BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/qmu.png")
        .then(
      (icon) {
        setState(() => qmuChallengeIcon = icon);
      },
    );
    BitmapDescriptor.fromAssetImage(ImageConfiguration(), "assets/column.png")
        .then(
      (icon) {
        setState(() => cloistersChallengeIcon = icon);
      },
    );
    BitmapDescriptor.fromAssetImage(
            ImageConfiguration(), "assets/stevenson.png")
        .then(
      (icon) {
        setState(() => stevensonChallengeIcon = icon);
      },
    );
  }

  @override
  void initState() {
    super.initState();
    addCustomMarkerIcon();
    getCurrentLocation();
    getUserQMUCompletionStatus();
    getUserCloistersCompletionStatus();
    getUserStevensonCompletionStatus();
    /*_animationController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );
    _animationController.forward();

    _animationController.addListener(() {
      print(_animationController.value);
    });*/
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("MAP"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: IconButton(
                icon: Icon(
                  Icons.help_outline,
                  color: Colors.white,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => AlertDialog(
                      title: const Center(
                          child: Text(
                            'Instructions',
                            style: TextStyle(
                                fontSize: 40.0,
                                fontFamily: "Swiss-721-BT",
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(0, 56, 101, 20),
                                shadows: <Shadow>[
                                  Shadow(
                                      color: Colors.white38,
                                      blurRadius: 35,
                                      offset: Offset(
                                        2.0,
                                        2.0,
                                      ))
                                ]),
                          )),
                      content: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        height: 400,
                        width: 300,
                        child:
                        Container(
                            height: 300,
                            decoration: BoxDecoration(
                              color: Color.fromRGBO(0, 56, 101, 20),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: SingleChildScrollView(
                                child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  children: [
                                    Text(
                                      "The researcher has developed a location based scavenger hunt unique to the University of Glasgow campus. Students compete against each other in teams to see which team can finish the game with the most virtual treasure. ",
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: "Swiss-721-BT",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: <Shadow>[
                                            Shadow(
                                                color: Colors.white38,
                                                blurRadius: 20,
                                                offset: Offset(
                                                  2.0,
                                                  2.0,
                                                ))
                                          ]),
                                    ),
                                    SizedBox(height: 10,),
                                    Text(
                                      "Treasure is obtained by traveling within radius of each landmarks displayed on the map finding key points of interest and answering trivia questions related to that location area as well as the history and achievements of the University. More treasure will be awarded to teams who answer the questions with accuracy and speed. Teams can then see how they rank on the real-time in-game leader board.",
                                      style: const TextStyle(
                                          fontSize: 18.0,
                                          fontFamily: "Swiss-721-BT",
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                          shadows: <Shadow>[
                                            Shadow(
                                                color: Colors.white38,
                                                blurRadius: 20,
                                                offset: Offset(
                                                  2.0,
                                                  2.0,
                                                ))
                                          ]),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                        ),
                      ),
                      actions: [
                        Center(
                          child: ElevatedButton(
                            child: Text('Got it!'),
                            style: ButtonStyle(),
                            onPressed: () => Navigator.pop(context),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            )
          ],
        ),
        body: currentLocation == null
            ? const Center(
                child: Text(
                "loading...",
                style: TextStyle(color: Colors.white38),
              ))
            : Stack(
                children: [
                  Positioned.fill(
                    child: GoogleMap(
                      initialCameraPosition: CameraPosition(
                        target: LatLng(currentLocation!.latitude!,
                            currentLocation!.longitude!),
                        zoom: 15,
                      ),
                      markers: {
                        Marker(
                          markerId: const MarkerId("currentLocationMarker"),
                          icon: currentLocationIcon,
                          position: LatLng(currentLocation!.latitude!,
                              currentLocation!.longitude!),
                        ),
                        Marker(
                          markerId: MarkerId("qmu"),
                          icon: qmuChallengeIcon,
                          position: qmuChallengeLocation,
                        ),
                        Marker(
                          markerId: MarkerId("cloisters"),
                          icon: cloistersChallengeIcon,
                          position: cloistersChallengeLocation,
                        ),
                        Marker(
                          markerId: MarkerId("stevenson"),
                          icon: stevensonChallengeIcon,
                          position: stevensonChallengeLocation,
                        ),
                      },
                      circles: {
                        Circle(
                          circleId: CircleId("qmuRadius"),
                          center: qmuChallengeLocation,
                          radius: 25,
                          strokeWidth: 1,
                          fillColor: Colors.indigo.withOpacity(0.2),
                        ),
                        Circle(
                          circleId: CircleId("cloistersRadius"),
                          center: cloistersChallengeLocation,
                          radius: 25,
                          strokeWidth: 1,
                          fillColor: Colors.indigo.withOpacity(0.2),
                        ),
                        Circle(
                          circleId: CircleId("stevensonRadius"),
                          center: stevensonChallengeLocation,
                          radius: 25,
                          strokeWidth: 1,
                          fillColor: Colors.indigo.withOpacity(0.2),
                        ),
                      },
                      onMapCreated: (mapController) {
                        _controller.complete(mapController);
                      },
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Column(
                        children: [
                          ((calculateDistance(
                                          currentLocation?.latitude,
                                          currentLocation?.longitude,
                                          qmuChallengeLocation.latitude,
                                          qmuChallengeLocation.longitude) <
                                      0.025) &&
                                  (QMUCompletionstatus != true))
                              ? QMUPopUpCard()
                              : const Text(''),
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                      child: Center(
                    child: Column(
                      children: [
                        ((calculateDistance(
                                        currentLocation?.latitude,
                                        currentLocation?.longitude,
                                        cloistersChallengeLocation.latitude,
                                        cloistersChallengeLocation.longitude) <
                                    0.025) &&
                                (CloistersCompletionstatus != true))
                            ? CloistersPopUpCard()
                            : const Text(''),
                      ],
                    ),
                  )),
                  Positioned(
                      child: Center(
                    child: Column(
                      children: [
                        ((calculateDistance(
                                        currentLocation?.latitude,
                                        currentLocation?.longitude,
                                        stevensonChallengeLocation.latitude,
                                        stevensonChallengeLocation.longitude) <
                                    0.025) &&
                                (StevensonCompletionstatus != true))
                            ? StevensonPopUpCard()
                            : const Text(''),
                      ],
                    ),
                  ))
                ],
              ));
  }
}
