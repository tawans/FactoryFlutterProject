import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const LatLng companyLatLong = LatLng(
    37.5233273,
    126.921252,
  );

  static const CameraPosition initialCameraPosition = CameraPosition(
    target: companyLatLong,
    zoom: 15,
  );

  static const double distance = 100;
  static final Circle withinDistanceCircle = Circle(
    circleId: const CircleId('company'),
    center: companyLatLong,
    radius: distance,
    fillColor: Colors.blue.withOpacity(0.1),
    strokeColor: Colors.blue.withOpacity(0.3),
    strokeWidth: 1,
  );

  static const Marker marker = Marker(
    markerId: MarkerId('marker'),
    position: companyLatLong,
  );

  static final Circle noWithinDistanceCircle = Circle(
    circleId: const CircleId('company'),
    center: companyLatLong,
    radius: distance,
    fillColor: Colors.red.withOpacity(0.1),
    strokeColor: Colors.red.withOpacity(0.3),
    strokeWidth: 1,
  );

  static final Circle checkDoneCircle = Circle(
    circleId: const CircleId('company'),
    center: companyLatLong,
    radius: distance,
    fillColor: Colors.green.withOpacity(0.1),
    strokeColor: Colors.green.withOpacity(0.3),
    strokeWidth: 1,
  );

  GoogleMapController? mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: renderAppBar(),
      body: FutureBuilder(
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (snapshot.data == '위치 권한이 허가되었습니다.') {
            return StreamBuilder<Position>(
                stream: Geolocator.getPositionStream(),
                builder: (context, snapshot) {
                  bool isWithinDistance = false;

                  if (snapshot.hasData) {
                    final distanceInMeters = Geolocator.distanceBetween(
                      snapshot.data!.latitude,
                      snapshot.data!.longitude,
                      companyLatLong.latitude,
                      companyLatLong.longitude,
                    );

                    isWithinDistance = distanceInMeters <= distance;
                  }

                  return Column(
                    children: [
                      _CustomGoogleMap(
                        initialCameraPosition: initialCameraPosition,
                        companyLatLong: companyLatLong,
                        circle: isWithinDistance
                            ? withinDistanceCircle
                            : noWithinDistanceCircle,
                        marker: marker,
                        onMapCreated: onMapCreated,
                      ),
                      _ChoolCheckButton(
                        isWithinDistance: isWithinDistance,
                      ),
                    ],
                  );
                });
          }
          return Center(
            child: Text(snapshot.data!),
          );
        },
        future: checkPermission(),
      ),
    );
  }

  AppBar renderAppBar() {
    return AppBar(
      title: const Text('Home'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () async {
            if (mapController == null) {
              return;
            }

            print('mapController is not null');

            final location = await Geolocator.getCurrentPosition();

            mapController!.animateCamera(CameraUpdate.newLatLng(
              LatLng(location.latitude, location.longitude),
            ));
            print('location: $location.toString()');
          },
          icon: const Icon(Icons.my_location),
        ),
      ],
    );
  }

  void onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
}

class _ChoolCheckButton extends StatelessWidget {
  final bool isWithinDistance;

  const _ChoolCheckButton({required this.isWithinDistance});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.blue,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.timelapse_outlined,
              color: isWithinDistance ? Colors.white : Colors.black,
              size: 50,
            ),
            ElevatedButton(
              onPressed: () {
                onChoolCheck(context);
              },
              child: const Text('출근 체크'),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                print('퇴근 체크');
              },
              child: const Text('퇴근 체크'),
            ),
          ],
        ),
      ),
    );
  }

  void onChoolCheck(BuildContext context) async {
    await showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: const Text('출근 체크'),
              content: const Text('출근 체크 하시겠습니까?'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('취소');
                  },
                  child: const Text('취소'),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    print('출근 체크');
                  },
                  child: const Text('확인'),
                ),
              ],
            ));
  }
}

class _CustomGoogleMap extends StatelessWidget {
  final CameraPosition initialCameraPosition;
  final LatLng companyLatLong;
  final Circle circle;
  final Marker marker;
  final MapCreatedCallback onMapCreated;

  const _CustomGoogleMap({
    required this.initialCameraPosition,
    required this.companyLatLong,
    required this.circle,
    required this.marker,
    required this.onMapCreated,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: GoogleMap(
        initialCameraPosition: initialCameraPosition,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        onMapCreated: onMapCreated,
        circles: {
          circle,
        },
        markers: {marker},
      ),
    );
  }
}

Future<String> checkPermission() async {
  final permission = await Geolocator.checkPermission();

  if (permission == LocationPermission.denied) {
    final permission = await Geolocator.requestPermission();

    if (permission == LocationPermission.deniedForever) {
      return '위치 권한을 세팅에서 허가해주세요.';
    }

    if (permission != LocationPermission.whileInUse &&
        permission != LocationPermission.always) {
      return '위치 권한을 허가해주세요.';
    }
  }

  return '위치 권한이 허가되었습니다.';
}
