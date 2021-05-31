import 'package:flutter/material.dart';
import 'package:superhero_app/data/apihero.dart';
import 'package:superhero_app/screens/details.dart';
import 'package:superhero_app/widget/image_heroes.dart';

class Heroes extends StatelessWidget {
  ApiHero apihero;
  Heroes({
    Key key,
    @required this.apihero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        var router = new MaterialPageRoute(builder: (BuildContext context) {
          return Details(
            apihero: apihero,
          );
        });

        Navigator.of(context).push(router);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: IntrinsicHeight(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    width: 12.0,
                  ),
                  SizedBox(
                    width: 24.0,
                  ),
                  Expanded(
                    child: Container(
                      // color: Colors.indigo,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            apihero.name,
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                          Text(
                            apihero.biography.fullName.isEmpty
                                ? apihero.name
                                : apihero.biography.fullName,
                            style: TextStyle(fontWeight: FontWeight.w300, fontSize: 18),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Hero(
                    tag: apihero.id,
                    child: SuperheroAvatar(img: apihero.images.md),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
