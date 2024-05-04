import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class PackageButtonController {
  VoidCallback? success;
  VoidCallback? error;
  VoidCallback? loading;
  VoidCallback? reset;

  PackageButtonController({
    this.success,
    this.error,
    this.loading,
    this.reset,
  });

  void dispose() {
    success = null;
    error = null;
    loading = null;
    reset = null;
  }
}

class PackageButton extends StatefulWidget {
  final String? title;
  final PackageButtonController? controller;
  final Function? onPressed;
  const PackageButton({
    Key? key,
    this.title,
    this.controller,
    this.onPressed,
  }) : super(key: key);

  @override
  State<PackageButton> createState() => _PackageButtonState();
}

class _PackageButtonState extends State<PackageButton> {
  PackageButtonController? controller;
  bool isPressed = false;
  bool isErrorOccured = false;
  bool isSuccess = false;

  @override
  void initState() {
    super.initState();

    controller = widget.controller;

    if (controller != null) {
      controller!.loading = loading;
      controller!.success = success;
      controller!.error = error;
      controller!.reset = reset;
    }
  }

  success() {
    setState(() {
      isSuccess = true;
      isErrorOccured = false;
      isPressed = false;
    });
  }

  loading() {
    setState(() {
      isPressed = true;
      isErrorOccured = false;
      isSuccess = false;
    });
  }

  reset() {
    setState(() {
      isPressed = false;
      isErrorOccured = false;
      isSuccess = false;
    });
  }

  error() {
    setState(() {
      isPressed = false;
      isErrorOccured = true;
      isSuccess = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: GestureDetector(
        onTap: () {
          if (widget.onPressed != null) {
            widget.onPressed!();
          }
        },
        child: Container(
          decoration: BoxDecoration(
            color: (isErrorOccured || isPressed || isSuccess)
                ? Colors.white
                : Color(0xFF3F8782),
            border: Border.all(
              color: Color(0xFF3F8782),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(30),
          ),
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: (isPressed)
                ? const Center(
                    child: SizedBox(
                      width: 25,
                      height: 25,
                      child: CircularProgressIndicator(
                        backgroundColor: Colors.white,
                        color: Color(0xFF3F8782),
                        strokeWidth: 4.0,
                      ),
                    ),
                  )
                : (isErrorOccured)
                    ? const Center(
                        child: Icon(
                          PhosphorIcons.x_circle_fill,
                          color: Colors.red,
                        ),
                      )
                    : Text(
                        widget.title ?? "Button",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                          fontFamily: "Inter",
                        ),
                      ),
          ),
        ),
      ),
    );
  }
}
