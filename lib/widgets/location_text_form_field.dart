import 'package:flutter/material.dart';
import 'package:milk_entry/core/app_export.dart';

import '../theme/theme_helper.dart';

class LocationInput extends StatelessWidget {
  final Function(String) onLocationChange; // Callback for location changes
  final String initialLocation; // Optional initial location text
  final context;

  const LocationInput(
      {required this.onLocationChange,
        this.initialLocation = '',
        this.alignment,
        this.width,
        this.scrollPadding,
        this.controller,
        this.focusNode,
        this.autofocus=false,
        this.textStyle,
        this.obscureText=false,
        this.textInputAction = TextInputAction.next,
        this.textInputType = TextInputType.text,
        //this.maxLines=1,
        this.hintText,
        this.hintStyle,
        this.prefix,
        this.prefixConstraints,
        this.suffix,
        this.suffixConstraints,
        this.contentPadding,
        this.borderDecoration,
        this.fillColors,
        this.filled=true,
        this.validator,
        this.prefixIcon,
        this.context
      });

  final Alignment? alignment;
  final double? width;
  final TextEditingController? scrollPadding;
  final TextEditingController? controller;
  final FocusNode? focusNode;
  final bool? autofocus;
  final TextStyle? textStyle;
  final bool? obscureText;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  //final int? maxLines;
  final String? hintText;
  final TextStyle? hintStyle;
  final Widget? prefix;
  final BoxConstraints? prefixConstraints;
  final Widget? suffix;
  final BoxConstraints? suffixConstraints;
  final EdgeInsets? contentPadding;
  final InputBorder? borderDecoration;
  final Color? fillColors;
  final bool? filled;
  final FormFieldValidator<String>? validator;
  final Widget? prefixIcon;

  InputDecoration get decoration => InputDecoration(
    hintText: hintText??'',
    hintStyle: hintStyle??theme.textTheme.titleMedium,
    prefixIcon: prefixIcon,
    // prefixIcon: IconButton(
    //     icon: Icon(Icons.location_on,color: appTheme.maroon,size: 30,),
    //   onPressed: () {
    //   _showLocationSelection(context);
    //   }, // Handle location selection on tap
    // ),
    prefixIconConstraints: prefixConstraints,
    suffix: suffix,
    suffixIconConstraints: suffixConstraints,
    isDense: true,
    contentPadding: contentPadding??EdgeInsets.all(20.h),
    fillColor: fillColors??theme.colorScheme.secondaryContainer,
    filled: filled,
    border: borderDecoration??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: appTheme.orangeA100,
            width: 1,
          ),
        ),
    enabledBorder: borderDecoration??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: appTheme.orangeA100,
            width: 1,
          ),
        ),
    focusedBorder: borderDecoration??
        OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.h),
          borderSide: BorderSide(
            color: appTheme.orangeA100,
            width: 1,
          ),
        ),
    errorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.h),
      borderSide: BorderSide(
        color: appTheme.orangeA100,
        width: 1,
      ),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10.h),
      borderSide: BorderSide(
        color: theme.colorScheme.primary,
        width: 2,
      ),
    ),
    errorStyle: TextStyle(
        color: theme.colorScheme.primary,
        fontSize: 12.fSize
    ),
  );

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom
      ),
      initialValue: initialLocation,
      decoration: decoration,
      onChanged: onLocationChange, //
    );
  }


  void _showLocationSelection(BuildContext context) async {
    final address = await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Enter Location'),
        content: TextField(
          autofocus: true,
          decoration: InputDecoration(hintText: 'Enter location details'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            //onPressed: () => Navigator.pop(context, locationTextField.text),
            onPressed: (){},
            child: Text('Select'),
          ),
        ],
      ),
    );
    if (address != null) {
      //final coordinates = await Geocoder.local.findAddressName(address);
      // Process coordinates (e.g., display on map or update TextFormField value)
    }
  }
}