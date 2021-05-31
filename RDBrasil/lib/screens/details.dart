import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:superhero_app/data/apihero.dart';
import 'package:superhero_app/util/const.dart';
import 'package:superhero_app/widget/image_heroes.dart';

class Details extends StatefulWidget {
  final ApiHero apihero;

  Details({Key key, this.apihero}) : super(key: key);

  @override
  _DetailsState createState() => _DetailsState();
}

TextStyle styleTitle = TextStyle(fontSize: 16, fontWeight: FontWeight.bold);

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.appName),
      ),
      body: SuperheroDetails(widget: widget, apihero: widget.apihero),
    );
  }
}

class SuperheroDetails extends StatefulWidget {
  const SuperheroDetails({
    Key key,
    @required this.widget,
    @required this.apihero,
  }) : super(key: key);

  final Details widget;
  final ApiHero apihero;

  @override
  _SuperheroDetailsState createState() => _SuperheroDetailsState();
}

class _SuperheroDetailsState extends State<SuperheroDetails> {
  Map<String, bool> _categoryExpansionStateMap = Map<String, bool>();
  bool isExpanded;

  @override
  void initState() {
    super.initState();

    _categoryExpansionStateMap = {
      "Biography": true,
      "Appearance": false,
      "Work": false,
      "Power Stats": false,
      "Connections": false,
    };

    isExpanded = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.green,
        padding: EdgeInsets.all(16.0),
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: <Widget>[
            Hero(
              tag: widget.apihero.id,
              child: SuperheroAvatar(
                img: widget.apihero.images.md,
                radius: 50.0,
              ),
            ),
            SizedBox(
              height: 13.0,
            ),
            Text(
              widget.apihero.name,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            Text(
              widget.apihero.biography.fullName.isEmpty
                  ? widget.apihero.name
                  : widget.apihero.biography.fullName,
              style:
                  TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
            ),
            SizedBox(
              height: 30.0,
            ),
            ExpansionPanelList(
              expansionCallback: (int index, bool isExpanded) {
                setState(() {
                  _categoryExpansionStateMap[_categoryExpansionStateMap.keys
                      .toList()[index]] = !isExpanded;
                });
              },
              children: <ExpansionPanel>[
                ExpansionPanel(
                  headerBuilder: (BuildContext context, bool isExpanded) {
                    return ListTile(
                        title: Text(
                      "Biography",
                      style: styleTitle,
                    ));
                  },
                  body: Biography(
                    apihero: widget.apihero,
                  ),
                  isExpanded: _categoryExpansionStateMap["Biography"],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class Biography extends StatelessWidget {
  final ApiHero apihero;

  const Biography({Key key, @required this.apihero}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text(
            "Alter Ego(s)".toUpperCase(),
            style: styleTitle,
          ),
          subtitle: Text(apihero.biography.alterEgos,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
        ListTile(
          title: Text("Aliases".toUpperCase(), style: styleTitle),
          subtitle: Text(
              apihero.biography.aliases
                  .toString()
                  .replaceAll("[", "")
                  .replaceAll("]", ""),
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
        ListTile(
          title: Text("Place of birth".toUpperCase(), style: styleTitle),
          subtitle: Text(apihero.biography.placeOfBirth,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
        ListTile(
          title: Text("First Appearance".toUpperCase(), style: styleTitle),
          subtitle: Text(apihero.biography.firstAppearance,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
        ListTile(
          title: Text("Creator".toUpperCase(), style: styleTitle),
          subtitle: Text(apihero.biography.publisher,
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 16,
              )),
        ),
      ],
    );
  }
}
