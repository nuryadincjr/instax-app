import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instax/data/Products.dart';
import 'package:instax/screens/ItemList.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Map> _resoultDetails = [];

  @override
  void initState() {
    _resoultDetails = detailsProducts;
    super.initState();
  }

  void filterSearch(String query) {
    List<Map> results = [];
    if(query.isEmpty) {
      results = detailsProducts;
    }else {

      results = detailsProducts
          .where((porduct) =>
          porduct["type"].toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    setState(() {
      _resoultDetails = results;
      log(_resoultDetails.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    const CircleAvatar(
      backgroundColor: Colors.white,
      radius: 30,
      child: Icon(Icons.add),
    );

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/images/fujifilm-banner.png', width: 100,),
          ],
        ),

        leading: Builder(
          builder: (BuildContext context) {
            return CircleAvatar(
              backgroundColor: Colors.deepOrange,
              radius: 20,
              child: IconButton(
                icon: const Icon(Icons.menu),
                color: Colors.white,
                tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                onPressed: () { Scaffold.of(context).openDrawer(); },
              ),
            );
          },
        ),

        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              icon: const Icon(Icons.shopping_bag_outlined),
              color: Colors.white,
              tooltip: 'shopping cart',
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Your shopping cart is on progress'))
                );
              },
            ),
          ),
        ],
      ),

      body: Container(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                style: TextStyle(color: Colors.white),
                onChanged: (value) {
                  filterSearch(value);
                },
                decoration: InputDecoration(
                    fillColor: Colors.black, filled: true,
                    hintText: "Search",
                    hintStyle: TextStyle(color: Colors.grey),
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20)))),
              ),
            ),
            Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: _resoultDetails.length,
                itemBuilder: (context, index) {
                  return itemList(context, index, _resoultDetails);
                },
              ),
            ),
          ],
        ),
      ),

      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('assets/images/fujifilm.png',
                    width: 200,),
                  const SizedBox(height: 15,),
                ],
              ),
              decoration: const BoxDecoration(
                color: Colors.deepOrange,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home_outlined),
              title: const Text('Home page'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.shopping_bag_outlined),
              title: const Text('Shopping cart'),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}