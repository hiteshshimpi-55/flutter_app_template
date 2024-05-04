import 'package:college_sarthi/utils/color_theme.dart';
import 'package:flutter/material.dart';

class PackageLabeledText extends StatelessWidget {
  final String label;
  final String value;
  const PackageLabeledText(
      {super.key, required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Text("$label:",
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                fontFamily: "Inter",
                color: ColorTheme.primary,
              )),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(value,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                fontFamily: "Inter",
                color: Colors.black,
              )),
        ),
      ],
    );
  }
}
