import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:isloo_tech_assignment/constant/colors.dart';
//import 'package:geolocator/geolocator.dart';

class LocationScreen extends StatefulWidget {
  const LocationScreen({Key key}) : super(key: key);

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  var height, width;

  double totalDistanceTravelByDriver;

  GoogleMapController mapController;
  // Position _currentPosition;
  // Position position;
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  Future getCurrentLocation() async {
    // Position postion = await Geolocator.getCurrentPosition();
    // _currentPosition = position;
  }

  bool isLoading = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;

    width = MediaQuery.of(context).size.width;
    return Scaffold(
      key: _key,
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "Jobs",
          style: TextStyle(color: Colors.white),
        ),
        // titleSpacing: 0,
        centerTitle: true,
        backgroundColor: AppColor.DARK_YELLOW,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
      body: isLoading == true
          ? Container(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            )
          : Container(
              height: height,
              width: width,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.04),
                    child: Container(
                      child: Text(
                        "Location",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: height * 0.02,
                      left: width * 0.05,
                      right: width * 0.05,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20.0),
                      child: Container(
                        height: height * 0.65,
                        child: GoogleMap(
                          mapType: MapType.normal,
                          initialCameraPosition: CameraPosition(
                            target: LatLng(33.738045, 73.084488),
                            zoom: 14.4746,
                          ),
                          onMapCreated: (GoogleMapController controller) {
                            //   _controller.complete(controller);
                          },
                          myLocationEnabled: true,
                          myLocationButtonEnabled: true,
                          zoomControlsEnabled: true,
                          zoomGesturesEnabled: true,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: height * 0.05),
                    child: Container(
                      //    width: width * 0.6,
                      child: Center(
                        child: Container(
                          width: width * 0.5,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                  AppColor.DARK_YELLOW),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10)),
                                side: BorderSide(color: AppColor.DARK_YELLOW),
                              )),
                            ),
                            child: Text(
                              "Proceed",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
    );
  }
}


/*
AppBar(
        elevation: 0,
        title: Text(
          "Jobs",
          style: TextStyle(color: Colors.white),
        ),
        // titleSpacing: 0,
        centerTitle: true,
        backgroundColor: AppColor.DARK_YELLOW,
        leading: Icon(Icons.menu),
        actions: [
          IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {})
        ],
      ),
*/