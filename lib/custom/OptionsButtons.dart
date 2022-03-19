import 'package:flutter/material.dart';
import 'package:home_app/utils/constants.dart';
import 'package:home_app/utils/wiget_functios.dart';

class OptionButton extends StatelessWidget {
  final String text;
  final IconData? icon;
  final double? width;

  final double? height;

  const OptionButton({Key? key, required this.text, this.icon, this.width,this.height})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      child: Center(
        child: TextButton(
          onPressed: null,
          child: Container(
            width: width,
            height:height,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(14)),
            color: COLOR_DARK_BLUE,
            ),
            //height: height??ARALIK_GENISLIK,
            child: Center(
                child: Row(
              children: [
                Icon(
                  Icons.map_outlined,
                  color: COLOR_WHITE,
                ),
                addHorizontalSpace(10),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: COLOR_WHITE),
                ),
              ],
            )),
          ),
        ),
      ),
    );
  }
}
