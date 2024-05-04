import 'package:college_sarthi/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

import '../utils/color_theme.dart';

class PackageTextField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final int? maxLines;
  final int? maxChar;
  final EnumTextfield? enumTextfield;
  final Function? onTap;
  final TextInputType? keyboardType;

  const PackageTextField({
    Key? key,
    this.controller,
    this.maxLines,
    this.hintText = "Enter",
    this.enumTextfield,
    this.keyboardType = TextInputType.text,
    this.onTap,
    this.maxChar,
  }) : super(key: key);

  @override
  State<PackageTextField> createState() => _PackageTextFieldState();
}

class _PackageTextFieldState extends State<PackageTextField> {
  bool obscureText = false;

  @override
  void initState() {
    super.initState();

    if (widget.enumTextfield == EnumTextfield.password) {
      obscureText = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          if (widget.enumTextfield == EnumTextfield.dropdown) {
            widget.onTap!();
          }
        },
        child: TextFormField(
          controller: widget.controller,
          keyboardType: widget.keyboardType,
          maxLength: widget.maxChar,
          maxLines: (widget.enumTextfield == EnumTextfield.password)
              ? 1
              : widget.maxLines,
          obscureText: (widget.enumTextfield != EnumTextfield.password)
              ? false
              : obscureText,
          style: TextStyle(
              fontFamily: 'Inter',
              color: Colors.grey[600],
              fontSize: 15,
              fontWeight: FontWeight.w400),
          validator: (value) {
            if (value!.isEmpty) {
              return 'This fiels is required';
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: widget.hintText,
            enabled:
                (widget.enumTextfield == EnumTextfield.dropdown) ? false : true,
            focusColor: Colors.white,
            contentPadding:
                EdgeInsets.symmetric(vertical: 15.0, horizontal: 20.0),
            border: OutlineInputBorder(
              borderRadius:
                  BorderRadius.circular(10.0), // Adjust the radius as needed
              borderSide: BorderSide(color: ColorTheme.secondary, width: 1.0),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorTheme.secondary, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorTheme.primary, width: 1.0),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: ColorTheme.secondary, width: 1.0),
            ),
            suffixIcon: (widget.enumTextfield == EnumTextfield.dropdown)
                ? const Icon(PhosphorIcons.caret_down)
                : (widget.enumTextfield == EnumTextfield.password)
                    ? IconButton(
                        icon: Icon(PhosphorIcons.eye),
                        onPressed: () {
                          setState(() {
                            if (obscureText) {
                              obscureText = false;
                            } else {
                              obscureText = true;
                            }
                          });
                        },
                      )
                    : null,
          ),
        ),
      ),
    );
  }
}
