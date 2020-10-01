import 'package:caseirinho_app/components/my_flat_button.dart';
import 'package:caseirinho_app/components/my_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mapbox_gl/mapbox_gl.dart';

final LatLngBounds sydneyBounds = LatLngBounds(
  southwest: const LatLng(-34.022631, 150.620685),
  northeast: const LatLng(-33.571835, 151.325952),
);

class CadastroCasaScreen extends StatefulWidget {
  @override
  _CadastroCasaScreenState createState() => _CadastroCasaScreenState();
}

class _CadastroCasaScreenState extends State<CadastroCasaScreen> {
  double _currentSliderValue = 1;

  void cadastrar(context) {
    Navigator.of(context).pop();
  }

  static final CameraPosition _kInitialPosition = const CameraPosition(
    target: LatLng(-33.852, 151.211),
    zoom: 100.0,
  );

  MapboxMapController mapController;
  CameraPosition _position = _kInitialPosition;
  bool _isMoving = false;
  bool _compassEnabled = true;
  CameraTargetBounds _cameraTargetBounds = CameraTargetBounds.unbounded;
  MinMaxZoomPreference _minMaxZoomPreference = MinMaxZoomPreference.unbounded;
  int _styleStringIndex = 0;
  // Style string can a reference to a local or remote resources.
  // On Android the raw JSON can also be passed via a styleString, on iOS this is not supported.
  List<String> _styleStrings = [MapboxStyles.MAPBOX_STREETS, MapboxStyles.SATELLITE, "assets/style.json"];
  List<String> _styleStringLabels = ["MAPBOX_STREETS", "SATELLITE", "LOCAL_ASSET"];
  bool _rotateGesturesEnabled = true;
  bool _scrollGesturesEnabled = true;
  bool _tiltGesturesEnabled = true;
  bool _zoomGesturesEnabled = true;
  bool _myLocationEnabled = true;
  bool _telemetryEnabled = true;
  MyLocationTrackingMode _myLocationTrackingMode = MyLocationTrackingMode.Tracking;
  List<Object> _featureQueryFilter;

  @override
  void initState() {
    super.initState();
  }

  void _onMapChanged() {
    setState(() {
      _extractMapInfo();
    });
  }

  void _extractMapInfo() {
    _position = mapController.cameraPosition;
    _isMoving = mapController.isCameraMoving;
  }

  // @override
  // void dispose() {
  //   mapController.removeListener(_onMapChanged);
  //   super.dispose();
  // }

  Widget _myLocationTrackingModeCycler() {
    final MyLocationTrackingMode nextType =
    MyLocationTrackingMode.values[(_myLocationTrackingMode.index + 1) % MyLocationTrackingMode.values.length];
    return FlatButton(
      child: Text('change to $nextType'),
      onPressed: () {
        setState(() {
          _myLocationTrackingMode = nextType;
        });
      },
    );
  }

  Widget _queryFilterToggler() {
    return FlatButton(
      child: Text('filter zoo on click ${ _featureQueryFilter == null ? 'disabled' : 'enabled'}'),
      onPressed: () {
        setState(() {
          if (_featureQueryFilter == null) {
            _featureQueryFilter = ["==", ["get", "type"] , "zoo"];
          } else {
            _featureQueryFilter = null;
          }
        });
      },
    );
  }

  Widget _compassToggler() {
    return FlatButton(
      child: Text('${_compassEnabled ? 'disable' : 'enable'} compasss'),
      onPressed: () {
        setState(() {
          _compassEnabled = !_compassEnabled;
        });
      },
    );
  }

  Widget _latLngBoundsToggler() {
    return FlatButton(
      child: Text(
        _cameraTargetBounds.bounds == null
            ? 'bound camera target'
            : 'release camera target',
      ),
      onPressed: () {
        setState(() {
          _cameraTargetBounds = _cameraTargetBounds.bounds == null
              ? CameraTargetBounds(sydneyBounds)
              : CameraTargetBounds.unbounded;
        });
      },
    );
  }

  Widget _zoomBoundsToggler() {
    return FlatButton(
      child: Text(_minMaxZoomPreference.minZoom == null
          ? 'bound zoom'
          : 'release zoom'),
      onPressed: () {
        setState(() {
          _minMaxZoomPreference = _minMaxZoomPreference.minZoom == null
              ? const MinMaxZoomPreference(12.0, 16.0)
              : MinMaxZoomPreference.unbounded;
        });
      },
    );
  }

  Widget _setStyleToSatellite() {
    return FlatButton(
      child: Text('change map style to ${_styleStringLabels[(_styleStringIndex + 1) % _styleStringLabels.length]}'),
      onPressed: () {
        setState(() {
          _styleStringIndex = (_styleStringIndex + 1) % _styleStrings.length;
        });
      },
    );
  }

  Widget _rotateToggler() {
    return FlatButton(
      child: Text('${_rotateGesturesEnabled ? 'disable' : 'enable'} rotate'),
      onPressed: () {
        setState(() {
          _rotateGesturesEnabled = !_rotateGesturesEnabled;
        });
      },
    );
  }

  Widget _scrollToggler() {
    return FlatButton(
      child: Text('${_scrollGesturesEnabled ? 'disable' : 'enable'} scroll'),
      onPressed: () {
        setState(() {
          _scrollGesturesEnabled = !_scrollGesturesEnabled;
        });
      },
    );
  }

  Widget _tiltToggler() {
    return FlatButton(
      child: Text('${_tiltGesturesEnabled ? 'disable' : 'enable'} tilt'),
      onPressed: () {
        setState(() {
          _tiltGesturesEnabled = !_tiltGesturesEnabled;
        });
      },
    );
  }

  Widget _zoomToggler() {
    return FlatButton(
      child: Text('${_zoomGesturesEnabled ? 'disable' : 'enable'} zoom'),
      onPressed: () {
        setState(() {
          _zoomGesturesEnabled = !_zoomGesturesEnabled;
        });
      },
    );
  }

  Widget _myLocationToggler() {
    return FlatButton(
      child: Text('${_myLocationEnabled ? 'disable' : 'enable'} my location'),
      onPressed: () {
        setState(() {
          _myLocationEnabled = !_myLocationEnabled;
        });
      },
    );
  }

  Widget _telemetryToggler() {
    return FlatButton(
      child: Text('${_telemetryEnabled ? 'disable' : 'enable'} telemetry'),
      onPressed: () {
        setState(() {
          _telemetryEnabled = !_telemetryEnabled;
        });
        mapController?.setTelemetryEnabled(_telemetryEnabled);
      },
    );
  }

  Widget _visibleRegionGetter(){
    return FlatButton(
      child: Text('get currently visible region'),
      onPressed: () async{
        var result = await mapController.getVisibleRegion();
        Scaffold.of(context).showSnackBar(SnackBar(content: Text("SW: ${result.southwest.toString()} NE: ${result.northeast.toString()}"),));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    MapboxMap mapboxMap = MapboxMap(
      accessToken: "pk.eyJ1IjoicmJyYXoiLCJhIjoiY2tmcTQzMTE1MDFudTJwbHM2YmtkMXhvayJ9.X4Laezfdb-k0V4Uab0A5mw",
      // onMapCreated: onMapCreated,
      initialCameraPosition: _kInitialPosition,
      // trackCameraPosition: true,
      // compassEnabled: _compassEnabled,
      // cameraTargetBounds: _cameraTargetBounds,
      // minMaxZoomPreference: _minMaxZoomPreference,
      // styleString: _styleStrings[_styleStringIndex],
      // rotateGesturesEnabled: _rotateGesturesEnabled,
      // scrollGesturesEnabled: _scrollGesturesEnabled,
      // tiltGesturesEnabled: _tiltGesturesEnabled,
      // zoomGesturesEnabled: _zoomGesturesEnabled,
      // myLocationEnabled: _myLocationEnabled,
      // myLocationTrackingMode: _myLocationTrackingMode,
      // myLocationRenderMode: MyLocationRenderMode.GPS,
      // onMapClick: (point, latLng) async {
      //   print("Map click: ${point.x},${point.y}   ${latLng.latitude}/${latLng.longitude}");
      //   print("Filter $_featureQueryFilter");
      //   List features = await mapController.queryRenderedFeatures(point, [], _featureQueryFilter);
      //   if (features.length>0) {
      //     print(features[0]);
      //   }
      // },
      // onMapLongClick: (point, latLng) async {
      //   print("Map long press: ${point.x},${point.y}   ${latLng.latitude}/${latLng.longitude}");
      //   Point convertedPoint = await mapController.toScreenLocation(latLng);
      //   LatLng convertedLatLng = await mapController.toLatLng(point);
      //   print("Map long press converted: ${convertedPoint.x},${convertedPoint.y}   ${convertedLatLng.latitude}/${convertedLatLng.longitude}");
      //
      //   List features = await mapController.queryRenderedFeatures(point, [], null);
      //   if (features.length>0) {
      //     print(features[0]);
      //   }
      // },
      // onCameraTrackingDismissed: () {
      //   this.setState(() {
      //     _myLocationTrackingMode = MyLocationTrackingMode.None;
      //   });
      // }
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastrar sua Casa'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 24,
            ),
            Text(
              "Cadastre as informações da sua casa para começar a vender",
              style: Theme.of(context).textTheme.headline5,
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "Nome da sua Casa",
              hintText: "Ex.: Docinhos da Maria",
            ),
            SizedBox(
              height: 24,
            ),
            MyTextField(
              labelText: "Endereço e número",
            ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: Text(
                "Raio de entrega: $_currentSliderValue km",
              ),
            ),
            Slider(
              value: _currentSliderValue,
              min: 0.5,
              max: 5,
              divisions: 9,
              label: _currentSliderValue.toString() + " km",
              onChanged: (double value) {
                setState(() {
                  _currentSliderValue = value;
                });
              },
            ),
            SizedBox(
              height: 60,
            ),

            MyFlatButton(
              label: "Cadastrar",
              onPressed: () => cadastrar(context),
            ),
          ],
        ),
      ),
    );
  }

  // void onMapCreated(MapboxMapController controller) {
  //   mapController = controller;
  //   mapController.addListener(_onMapChanged);
  //   _extractMapInfo();
  //
  //   mapController.getTelemetryEnabled().then((isEnabled) =>
  //       setState(() {
  //         _telemetryEnabled = isEnabled;
  //       }));
  // }
}
