import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CalculatorUi extends StatelessWidget {
  final String? text;
  final Color? fillColor;
  final Color? textColor;
  final double? textSize;
  final Function? callback;

  CalculatorUi(
      {super.key,
      this.text,
      this.fillColor,
      this.textColor,
      this.textSize,
      this.callback, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          // mainAxisSize: MainAxisSize.max,
          children: [
            Row(
              // mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 70,
                  width: 70,
                  child: TextButton(
                      onPressed: () {
                        callback!(text);
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              fillColor!),
                          foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.black),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0)))),
                      child: Text(
                        text!,
                        style: GoogleFonts.rubik(
                            textStyle: TextStyle(
                              fontSize: textSize,
                            ),
                            color: textColor
                        ),
                      )),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
