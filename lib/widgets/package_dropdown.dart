import 'dart:convert';

import 'package:college_sarthi/models/model_dropdown.dart';
import 'package:college_sarthi/utils/color_theme.dart';
import 'package:college_sarthi/utils/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDown {
  static openDropDown(
      {required BuildContext context,
      required Function(ModelDropdown) onSelect,
      required String api,
      required String title}) {
    return showDialog(
        context: context,
        builder: (ctx) {
          return AlertDialog(
            surfaceTintColor: Colors.grey[100],
            shape: RoundedRectangleBorder(
                side: BorderSide(color: ColorTheme.primary, width: 1),
                borderRadius: BorderRadius.circular(20.0)),
            contentPadding:
                const EdgeInsets.only(left: 10, right: 10, top: 8, bottom: 10),
            title: Text(
              "Select $title",
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: ColorTheme.primary,
                fontSize: 18,
                fontFamily: 'Inter',
                fontWeight: FontWeight.bold,
              ),
            ),
            content: Container(
              height: 200,
              child: PackageDropdown(
                url: api,
                onSelect: (ModelDropdown item) {
                  onSelect(item);
                  Navigator.pop(ctx);
                },
              ),
            ),
          );
        });
  }
}

class PackageDropdown extends StatefulWidget {
  final String? url;
  final Function(ModelDropdown)? onSelect;
  const PackageDropdown({super.key, this.url, this.onSelect});

  @override
  State<PackageDropdown> createState() => _PackageDropdownState();
}

class _PackageDropdownState extends State<PackageDropdown> {
  bool loading = false;
  List<ModelDropdown> dropdown = [];
  @override
  void initState() {
    super.initState();
    loadList();
    // call the api here to load the list
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: ColorTheme.primary, width: 1),
          color: Colors.white,
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 5, right: 5),
          child: loading
              ? const Center(
                  child: CircularProgressIndicator(
                  color: ColorTheme.primary,
                ))
              : (dropdown.isEmpty)
                  ? const Center(child: Text("Empty List"))
                  : SingleChildScrollView(
                      child: Column(
                        children: [
                          for (var item in dropdown)
                            Column(
                              children: [
                                ListTile(
                                  title: Text(item.shortName!,
                                      style: const TextStyle(
                                        color: ColorTheme.primary,
                                        fontSize: 15,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.bold,
                                      )),
                                  onTap: () {
                                    widget.onSelect!(item);
                                  },
                                ),
                                const Divider(
                                  color: Colors.grey,
                                  indent: 0.001,
                                  height: 0.01,
                                )
                              ],
                            )
                        ],
                      ),
                    ),
        ));
  }

  void loadList() async {
    setState(() {
      loading = true;
    });

    setState(() {
      loading = false;
    });
  }
}
