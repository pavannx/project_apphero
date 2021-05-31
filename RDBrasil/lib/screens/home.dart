import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:superhero_app/data/apihero.dart';
import 'package:superhero_app/screens/search.dart';
import 'package:superhero_app/screens/settings.dart';
import 'package:superhero_app/util/const.dart';
import 'package:superhero_app/widget/superhero.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List responseList;
  bool _loading;

  getHeroes() async {
    setState(() {
      _loading = true;
    });
    var url = 'https://akabab.github.io/superhero-api/api/all.json';
    var res = await http.get(url);
    List decodedJson = jsonDecode(res.body);

    int code = res.statusCode;
    if (code == 200) {
      setState(() {
        responseList = decodedJson;
        _loading = false;
      });
    } else {
      setState(() {
        _loading = false;
      });
      print("Erro no carregamento");
    }
  }

  @override
  void initState() {
    super.initState();
    getHeroes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          Constants.appName,
          style: TextStyle(color: Colors.white),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search, color: Colors.white),
            onPressed: responseList == null
                ? null
                : () {
                    showSearch(
                      context: context,
                      delegate: HeroSearch(all: responseList),
                    );
                  },
            tooltip: "Search",
          ),
        ],
      ),
      body: _loading ? _buildProgressIndicator() : _buildList(),
    );
  }

  _buildProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
      ),
    );
  }

  _buildList() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0),
      child: ListView.builder(
        itemCount: responseList?.length ?? 0,
        itemBuilder: (BuildContext context, int index) {
          ApiHero apihero = ApiHero.fromJson(responseList[index]);
          return Padding(
            padding: const EdgeInsets.only(top: 5.0),
            child: Heroes(
              apihero: apihero,
            ),
          );
        },
      ),
    );
  }
}
