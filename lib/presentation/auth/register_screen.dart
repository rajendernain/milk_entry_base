import 'dart:async';

import 'package:flutter/material.dart';
import 'package:milk_entry/presentation/auth/provider/auth_provider.dart';
import 'package:milk_entry/widgets/custom_elevated_button.dart';
import 'package:milk_entry/widgets/custom_text_form_field.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import '../../core/app_export.dart';
import '../../core/utils/validation_functions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
  static Widget builder(BuildContext context){
    return ChangeNotifierProvider(
      create: (context)=> AuthProvider(),
      child: RegisterScreen(),
    );
  }
}

class _RegisterScreenState extends State<RegisterScreen> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var authProvider;

  late final Function(Location) onLocationSelected; // Callback for selected location
  late final String initialLocation;
  String _currentLocation = '';

  @override
  Widget build(BuildContext context) {

    authProvider = Provider.of<AuthProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse8,
                height: 130.v,
                width: 105.h,
                // margin: EdgeInsets.only(bottom: 18.v),
              ),
            ),
            Positioned(
              right: 0,
              top: 0,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse7,
                height: 150.v,
                width: 144.h,
              ),
            ),
            Positioned(
              left: 0,
              bottom: 0,
              child: CustomImageView(
                fit: BoxFit.fitHeight,
                imagePath: ImageConstant.imgEllipse5,
                height: 155.v,
                width: 114.h,
              ),
            ),
            Positioned(
              right: 0,
              bottom: 0,
              child: CustomImageView(
                imagePath: ImageConstant.imgEllipse6,
                height: 114.v,
                width: 115.h,
              ),
            ),
            Center(
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Text(
                        "lbl_register".tr,
                        style: CustomTextStyles.displayMediumPrimary,
                      ),
                      SizedBox(height: 30.v,),
                      _buildNameRow(context),
                      SizedBox(height: 30.v,),
                      _buildDairyNameEditText(context),
                      SizedBox(height: 26.v,),
                      _buildCollectionCenterNameEditText(context),
                      SizedBox(height: 26.v,),
                      //_buildInputRow(context),
                      //LocationSelectionMap(),
                      SizedBox(height: 37.v,),
                      _buildProceed(context),
                      SizedBox(height: 20.v,),
                      InkWell(
                        onTap: (){
                          NavigatorService.popAndPushNamed(AppRoutes.loginScreen);
                        },
                          child: Text('msg_already_have_an'.tr, style: CustomTextStyles.titleMediumGray60001)),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildNameRow(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildNameEditText(context),SizedBox(width: 5.h,),_buildFatherNameEditText(context),
        ],
      ),
    );
  }
  _buildNameEditText(BuildContext context){
    return Selector<AuthProvider, TextEditingController>(
        selector: (context, provider) => provider.nameTextController,
        builder: (context, nameTextController, child){
          return CustomTextFormField(
            width: 174.h,
            controller: authProvider.nameTextController,
            hintText: "lbl_name".tr,
            validator: (value){
              if(!isText(value, isRequired:true)){
                return "err_msg_please_enter_name".tr;
              }
              return null;
            },
          );
        },
    );
  }
  _buildFatherNameEditText(BuildContext context){
    return Selector<AuthProvider, TextEditingController>(
      selector: (context, provider) => provider.fatherTextController,
      builder: (context, fatherTextController, child){
        return CustomTextFormField(
          width: 174.h,
          controller: authProvider.fatherTextController,
          hintText: "lbl_father_s_name".tr,
          validator: (value){
            if(!isText(value, isRequired:true)){
              return "err_msg_please_enter_father_name".tr;
            }
            return null;
          },
        );
      },
    );
  }
  _buildDairyNameEditText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 18.h),
      child: Selector<AuthProvider, TextEditingController>(
        selector: (context, provider) => provider.dairyNameTextController,
        builder: (context, dairyNameTextController, child){
          return CustomTextFormField(
            controller: authProvider.dairyNameTextController,
            hintText: "lbl_dairy_name".tr,
            validator: (value){
              if(!isText(value, isRequired:true)){
                return "err_msg_please_enter_dairy_name".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }
  _buildCollectionCenterNameEditText(BuildContext context){
    return Padding(
      padding: EdgeInsets.symmetric(horizontal:  18.h),
      child: Selector<AuthProvider, TextEditingController>(
        selector: (context, provider) => provider.centerNameTextController,
        builder: (context, centerNameTextController, child){
          return CustomTextFormField(
            controller: authProvider.centerNameTextController,
            hintText: "msg_collection_center".tr,
            validator: (value){
              if(!isText(value, isRequired:true)){
                return "err_msg_please_enter_center_name".tr;
              }
              return null;
            },
          );
        },
      ),
    );
  }
  Widget _buildInputRow(BuildContext context){
    return  Padding(
      padding: EdgeInsets.symmetric(horizontal:  18.h),
      child: LocationInput(
        context: context,
        onLocationChange: (String ) {  },
        controller: authProvider.addressTextController,
        prefixIcon: IconButton(
          icon: Icon(Icons.location_on,color: appTheme.maroon,size: 30,),
          onPressed: () {
            _showLocationSelection(context);
          }, // Handle location selection on tap
        ),
        hintText: "lbl_address".tr,
        validator: (value){
          if(!isText(value, isRequired:true)){
            return "err_msg_please_enter_address".tr;
          }
          return null;
        },
      ),
    );
  }

  // Function to handle location selection (using google_maps_flutter)
  void _showLocationSelection(BuildContext context) async {
    final location = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LocationSelectionMap()),
    );
    if (location != null) {
      setState(() => _currentLocation = location.getAddress()); // Update TextFormField
      //widget.onLocationSelected(location); // Trigger callback with selected Location object
    }
  }

  Widget _buildProceed(BuildContext context) {
    return CustomElevatedButton(
      height: 41.v,
      text: "lbl_proceed".tr,
      margin: EdgeInsets.only(left: 38.h, right: 42.h),
      onPressed: () {
        if (_formKey.currentState!.validate()) {

          final name = authProvider.nameTextController.text;
          final fName = authProvider.fatherTextController.text;
          final dairyName = authProvider.dairyNameTextController.text;
          final centerName = authProvider.centerNameTextController.text;

          // Print the values to console or handle them as needed
          print('Name: $name');
          print('Father name: $fName');
          print('dairyName: $dairyName');
          print('centerName: $centerName');

          // You can also clear the form after submission
          // _formKey.currentState!.reset();
          // _emailController.clear();
          // _passwordController.clear();
          // _phoneController.clear();

          // If the form is valid, display a snackbar.
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Processing Data')),
          );
        }
      },
    );
  }

}

class LocationSelectionMap extends StatefulWidget {
  static const DEFAULT_ZOOM = 14.4746;
  static const KINSHASA_LOCATION = LatLng(-4.325, 15.322222);

  double initZoom;
  LatLng initCoordinates;
  LatLng? value;

  LocationSelectionMap(
      {Key? key,
        this.initZoom = DEFAULT_ZOOM,
        this.initCoordinates = KINSHASA_LOCATION})
      : super(key: key);

  @override
  _LocationSelectionMapState createState() => _LocationSelectionMapState();
}

class _LocationSelectionMapState extends State<LocationSelectionMap> {
  GoogleMapController? _mapController;
  Location? _selectedLocation;

  final Completer<GoogleMapController> _controller = Completer();

  double latitude = -4.325;
  double longitude = 15.322222;
  String _address="";

  @override
  void initState() {
    // TODO: implement initState
    getCurrentLocation();
    super.initState();
  }

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      latitude = position.latitude;
      longitude = position.longitude;
      print('Latitude: $latitude, Longitude: $longitude');

      getLocation();

    } catch (e) {
      print(e);
    }
  }

  getLocation() async {
    GoogleMapController controller = await _controller.future;
    controller.moveCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(latitude, longitude),
      zoom: 14.4746,
    )));
    getAddress(latitude,longitude);
  }

  Future<String> getAddress(double latitude, double longitude) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(latitude, longitude);
      if (placemarks != null && placemarks.isNotEmpty) {
        Placemark placemark = placemarks[0];
        String  address  =   '${placemark.name},${placemark.subLocality}, ${placemark.locality}, ${placemark.subAdministrativeArea}, ${placemark.administrativeArea} ${placemark.postalCode}, ${placemark.country}';
        setState(() {
          _address = address +"LAT"+latitude.toString() +"LAT"+longitude.toString();
        });
        return _address;
      } else {
        return "no_address_found";
      }
    } catch (e) {
      return 'Error: $e';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // width: 400,
      height: 300,
      child: LayoutBuilder(
        builder: (context, constraints) {
          var maxWidth = constraints.biggest.width;
          var maxHeight = constraints.biggest.height;

          return Stack(
            children: <Widget>[
              SizedBox(
                height: maxHeight,
                width: maxWidth,
                child: GoogleMap(

                  onTap: (latlang){
                    if(latitude == latlang.latitude && longitude ==  latlang.longitude){
                    }else{
                      getAddress(latlang.latitude,latlang.longitude);
                    }

                  },
                  initialCameraPosition: CameraPosition(
                    target: LatLng(latitude,longitude),
                    zoom: widget.initZoom,
                  ),
                  onMapCreated: (GoogleMapController controller) {
                    _controller.complete(controller);
                  },
                  onCameraIdle: () async {

                    _address = await getAddress(widget.value!.latitude,widget.value!.longitude);

                    print("CAMERAIDLE"+_address);
                  },
                  onCameraMove: (CameraPosition newPosition) {
                    print(newPosition.target.toJson());
                    widget.value = newPosition.target;
                    print("LAT"+newPosition.target.latitude.toString() +"LNG"+newPosition.target.longitude.toString());

                    print("OLDLAT "+latitude.toString());
                    print("OLDLNG "+longitude.toString());
                    print("NEWLAT "+newPosition.target.latitude.toString());
                    print("NEWLNG "+newPosition.target.longitude.toString());
                  },
                  mapType: MapType.normal,
                  myLocationButtonEnabled: true,
                  myLocationEnabled: true,
                  zoomGesturesEnabled: true,
                  padding: const EdgeInsets.all(0),
                  buildingsEnabled: true,
                  compassEnabled: true,
                  indoorViewEnabled: false,
                  minMaxZoomPreference: MinMaxZoomPreference.unbounded,
                  rotateGesturesEnabled: true,
                  scrollGesturesEnabled: true,
                  tiltGesturesEnabled: true,

                ),
              ),
              Positioned(
                bottom: maxHeight / 2,
                right: (maxWidth - 30) / 2,
                child: const Icon(
                  Icons.person_pin_circle,
                  size: 30,
                  color: Colors.black,
                ),
              ),

            ],
          );
        },
      ),
    );
      // body: Stack(
      //   children: [
      //     GoogleMap(
      //       initialCameraPosition: CameraPosition(
      //         target: LatLng(37.7833, -122.4167), // Initial location (adjust as needed)
      //         zoom: 15,
      //       ),
      //       onMapCreated: (controller) => _mapController = controller,
      //       myLocationEnabled: true,
      //       //onTap: (LatLng position) => setState(() => _selectedLocation = Location(position)),
      //     ),
      //     if (_selectedLocation != null)
      //       Positioned(
      //         bottom: 20,
      //         right: 20,
      //         child: FloatingActionButton(
      //           child: Icon(Icons.clear),
      //           onPressed: () => setState(() => _selectedLocation = null),
      //         ),
      //       ),
      //   ],
      // ),
    //);
  }
}
