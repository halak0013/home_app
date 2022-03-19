import 'package:flutter/material.dart';
import 'package:home_app/custom/BorderBox.dart';
import 'package:home_app/utils/custom_functions.dart';
import 'package:home_app/utils/sample_data.dart';
import 'package:home_app/utils/wiget_functios.dart';

import '../custom/OptionsButtons.dart';
import '../utils/constants.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double padding = 25;
    final sidePadding = EdgeInsets.symmetric(horizontal: padding);
    final ThemeData theme = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        BorderBox(
                            child: Icon(
                              Icons.menu_open,
                              color: COLOR_BLACK,
                            ),
                            width: 50,
                            height: 50),
                        BorderBox(
                            child: Icon(
                              Icons.settings,
                              color: COLOR_BLACK,
                            ),
                            width: 50,
                            height: 50),
                      ],
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "City",
                      style: theme.textTheme.bodyText2,
                    ),
                  ),
                  addVerticalSpace(padding),
                  Padding(
                    padding: sidePadding,
                    child: Text(
                      "İstanbul",
                      style: theme.textTheme.headline2,
                    ),
                  ),
                  Padding(
                    padding: sidePadding,
                    child: Divider(
                      height: 25,
                      color: COLOR_GREY,
                    ),
                  ),
                  addVerticalSpace(10),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        "500.000 TL",
                        "For Sale",
                        "2-3 Roms",
                        "Interesting"
                      ].map((filtre) => ChoiceOptions(text: filtre)).toList(),
                    ),
                  ),
                  addVerticalSpace(10),
                  Expanded(
                    child: Padding(
                      padding: sidePadding,
                      child: ListView.builder(
                          itemCount: RE_DATA.length,
                          itemBuilder: (context, index) {
                            return RealEstateItem(itemData: RE_DATA[index]);
                          }),
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: 10,
                width:size.width,
                  child: GestureDetector(
                    child: Container(
                      height: size.height*0.05,
                      width:size.width*0.41,
                      decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(13)),color: COLOR_DARK_BLUE),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                        Icon(Icons.map_outlined,color: COLOR_WHITE,),
                        Text("şimdi oldu mu :)) ",style: TextStyle(color: COLOR_WHITE),),
                      ],)
                    ),
                  ),),
            ],
          ),
        ),
      ),
    );
  }
}

class ChoiceOptions extends StatelessWidget {
  final String text;
  ChoiceOptions({Key? key, required this.text}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: COLOR_GREY.withAlpha(25),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 13),
      margin: EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        text,
        style: theme.textTheme.headline5,
      ),
    );
  }
}

class RealEstateItem extends StatelessWidget {
  final dynamic itemData;
  const RealEstateItem({Key? key, required this.itemData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(25),
                    child: Image.asset(itemData["image"])),
                const Positioned(
                  top: 15,
                  right: 15,
                  child: BorderBox(
                    width: 50,
                    height: 50,
                    child: Icon(
                      Icons.favorite_border,
                      color: COLOR_BLACK,
                    ),
                  ),
                ),
              ],
            ),
            addVerticalSpace(15),
            Row(
              children: [
                Text(
                  "TL ${formatCurrency(itemData["amount"])}",
                  style: theme.textTheme.headline1,
                ),
                addHorizontalSpace(10),
                Text("${itemData["address"]}",
                    style: theme.textTheme.bodyText2),
                addVerticalSpace(10),
              ],
            ),
            Text(
              "${itemData["bedrooms"]} bedrooms/ ${itemData["bathrooms"]} bathrooms/ ${itemData["area"]}m square",
              style: theme.textTheme.headline5,
            ),
            addVerticalSpace(10),
          ],
        ));
  }
}
