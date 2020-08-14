import 'dart:async';

import 'package:flutter/material.dart';
import 'package:food_on_time/constant.dart';

import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:food_on_time/screens/review/review-screen.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:url_launcher/url_launcher.dart';

class PinInformation {
  String pinPath;
  String avatarPath;
  LatLng location;
  String locationName;
  Color labelColor;
  PinInformation(
      {this.pinPath,
      this.avatarPath,
      this.location,
      this.locationName,
      this.labelColor});
}

const double CAMERA_ZOOM = 13;
const double CAMERA_TILT = 0;
const double CAMERA_BEARING = 30;
const LatLng SOURCE_LOCATION =
    LatLng(3.206128, 101.716666); // McDonald's Danau Kota DT
const LatLng DEST_LOCATION = LatLng(3.1270, 101.7246); // TARC Campus Setapak

class MapPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => MapPageState();
}

class MapPageState extends State<MapPage> {
  Completer<GoogleMapController> _controller = Completer();

  // this set will hold my markers
  Set<Marker> _markers = {};

  // this will hold the generated polylines
  Set<Polyline> _polylines = {};

  // this will hold each polyline coordinate as Lat and Lng pairs
  List<LatLng> polylineCoordinates = [];

  // this is the key object - the PolylinePoints
  // which generates every polyline between start and finish
  PolylinePoints polylinePoints = PolylinePoints();

  String googleAPIKey = "AIzaSyB0xbp_71_RI7gPmCfu6HQ_k5bciahaFsM";

  // for my custom icons
  BitmapDescriptor sourceIcon;
  BitmapDescriptor destinationIcon;

  // the user's initial location
  LocationData currentLocation;

  double pinPillPosition = 0;

  PinInformation currentlySelectedPin = PinInformation(
      pinPath: 'assets/icons/deliveryman.png',
      avatarPath: 'assets/avatars/LianaLing.jpg',
      location: LatLng(3.1270, 101.7246),
      locationName: 'Ling Li Ya (Rider)',
      labelColor: Colors.blueAccent);

  PinInformation sourcePinInfo;
  PinInformation destinationPinInfo;

  void setSourceAndDestinationIcons() async {
    sourceIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 1.5), 'assets/icons/pin.png');

    destinationIcon = await BitmapDescriptor.fromAssetImage(
        ImageConfiguration(devicePixelRatio: 1.5),
        'assets/icons/driving_pin.png');
  }

  void setMapPins() {
    setState(() {
      // populate the sourcePinInfo object
      sourcePinInfo = PinInformation(
          locationName: 'Lee Kai Yang',
          location: LatLng(currentLocation.latitude, currentLocation.longitude),
          pinPath: 'assets/icons/pin.png',
          avatarPath: 'assets/avatars/KaiYang2.jpg',
          labelColor: Color.fromARGB(255, 255, 97, 92));

      // source pin
      _markers.add(Marker(
          markerId: MarkerId('sourcePin'),
          position: LatLng(currentLocation.latitude, currentLocation.longitude),
          onTap: () {
            setState(() {
              currentlySelectedPin = sourcePinInfo;
              pinPillPosition = 0;
            });
          },
          icon: sourceIcon));

      destinationPinInfo = PinInformation(
          locationName: 'Ling Li Ya (Rider)',
          location: DEST_LOCATION,
          pinPath: 'assets/icons/deliveryman.png',
          avatarPath: 'assets/avatars/LianaLing.jpg',
          labelColor: Colors.blueAccent);

      // destination pin
      _markers.add(Marker(
          markerId: MarkerId('destPin'),
          position: DEST_LOCATION,
          onTap: () {
            setState(() {
              currentlySelectedPin = destinationPinInfo;
              pinPillPosition = 0;
            });
          },
          icon: destinationIcon));
    });
  }

  void onMapCreated(GoogleMapController controller) async {
    _controller.complete(controller);

    await setCurrentLocation();

    setMapPins();
    setPolylines();
  }

  setPolylines() async {
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
        googleAPIKey,
        PointLatLng(currentLocation.latitude, currentLocation.longitude),
        PointLatLng(DEST_LOCATION.latitude, DEST_LOCATION.longitude));

    if (result.points.isNotEmpty) {
      // loop through all PointLatLng points and convert them
      // to a list of LatLng, required by the Polyline
      result.points.forEach((PointLatLng point) {
        polylineCoordinates.add(LatLng(point.latitude, point.longitude));
      });
    }

    setState(() {
      // create a Polyline instance
      // with an id, an RGB color and the list of LatLng pairs
      Polyline polyline = Polyline(
          polylineId: PolylineId("poly"),
          color: Color.fromARGB(255, 0, 173, 23),
          points: polylineCoordinates);

      // add the constructed polyline as a set of points
      // to the polyline set, which will eventually
      // end up showing up on the map
      _polylines.add(polyline);
    });
  }

  Future<void> setCurrentLocation() async {
    Location location = new Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;

    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    currentLocation = await location.getLocation();
  }

  @override
  void initState() {
    super.initState();
    setSourceAndDestinationIcons();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    CameraPosition initialLocation = CameraPosition(
        zoom: CAMERA_ZOOM,
        bearing: CAMERA_BEARING,
        tilt: CAMERA_TILT,
        target: SOURCE_LOCATION);

    return Stack(
      children: <Widget>[
        GoogleMap(
          mapToolbarEnabled: false,
          zoomControlsEnabled: false,
          myLocationEnabled: true,
          compassEnabled: true,
          tiltGesturesEnabled: false,
          markers: _markers,
          polylines: _polylines,
          mapType: MapType.normal,
          initialCameraPosition: initialLocation,
          onMapCreated: onMapCreated,

          // handle the tapping on the map
          // to dismiss the info pill by
          // resetting its position
          onTap: (LatLng location) {
            setState(() {
              pinPillPosition = -100;
            });
          },
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            margin: EdgeInsets.all(15.0),
            width: size.width * 0.5,
            height: size.height * 0.05,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(
                Radius.circular(50.0),
              ),
              boxShadow: <BoxShadow>[
                BoxShadow(
                    blurRadius: 5,
                    offset: Offset.zero,
                    color: Colors.grey.withOpacity(0.5)),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.access_time),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0),
                  child: Text(
                    "Arriving in 10 minutes",
                    style: TextStyle(
                        color: kTextColor, fontWeight: FontWeight.w500),
                  ),
                )
              ],
            ),
          ),
        ),
        AnimatedPositioned(
          duration: Duration(milliseconds: 200),
          bottom: pinPillPosition + 80,
          right: 0,
          left: 0,
          child: Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: FloatingActionButton.extended(
                backgroundColor: Colors.green[500],
                tooltip: "Press this when the order is delivered.",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReviewScreen(),
                    ),
                  );
                },
                icon: Icon(Icons.check),
                label: Text("Done".toUpperCase()),
              ),
            ),
          ),
        ),
        AnimatedPositioned(
          bottom: pinPillPosition,
          right: 0,
          left: 0,
          duration: Duration(milliseconds: 200),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              margin: EdgeInsets.all(20.0),
              height: 70,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(50.0)),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                      blurRadius: 20,
                      offset: Offset.zero,
                      color: Colors.grey.withOpacity(0.5)),
                ],
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 10.0),
                    width: 50,
                    height: 50,
                    child: ClipOval(
                      child: Image.asset(
                        currentlySelectedPin.avatarPath,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.only(left: 20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            currentlySelectedPin.locationName,
                            style: TextStyle(
                              color: currentlySelectedPin.labelColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text('WNG 3218',
                              style:
                                  TextStyle(fontSize: 12, color: kTextColor)),
                          GestureDetector(
                            onTap: () async {
                              const url = 'tel: +60 16 306 6883';
                              if (await canLaunch(url))
                                await launch(url);
                              else
                                throw "Could not launch $url";
                            },
                            child: Text(
                              '+60 16-(306) 6883',
                              style: TextStyle(fontSize: 12, color: kTextColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: Image.asset(
                      currentlySelectedPin.pinPath,
                      width: 50,
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
