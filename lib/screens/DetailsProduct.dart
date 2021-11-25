import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instax/data/Products.dart';

import 'Home.dart';

class DetailsProduct extends StatelessWidget {
  const DetailsProduct({Key? key, required this.detailsProduct}) : super(key: key);
  final Map detailsProduct;

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
                icon: const Icon(Icons.arrow_back_ios_outlined),
                color: Colors.white,
                tooltip: MaterialLocalizations.of(context).backButtonTooltip,
                onPressed: () { Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                },
              ),
            );
          },
        ),

        actions: <Widget>[
          CircleAvatar(
            backgroundColor: Colors.black,
            child: IconButton(
              icon: const Icon(Icons.more_vert),
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

      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 10,
                  ),
                  Center(
                      child: Image.asset('assets/images/'+
                          detailsProduct['image'], width: 200,)),
                  SizedBox(
                    height: 50,
                  ),
                  Row(children: <Widget>[
                    Text('Instax ',
                      style: TextStyle(
                          fontSize:24),
                    ),
                    Text(detailsProduct['type'],
                        style: TextStyle(
                            fontSize:24,
                            fontWeight: FontWeight.bold,
                            color: detailsProduct['color'])
                    ),
                  ]),

                  SizedBox(
                    height: 6,
                  ),
                  Text(desctiption1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize:14)
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  Text('Point & Shoot',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18)
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(desctiption2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize:14)
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  Text('Mini But With Full-Size Memories',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18)
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(desctiption3,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize:14)
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  Text('Mini Film',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18)
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(desctiption4,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize:14)
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  Text('Plenty of Great Color Choices',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18)
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(desctiption5,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize:14)
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  Text('The Mini 7+ Has Your Back!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18)
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(desctiption6,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize:14)
                  ),
                  SizedBox(
                    height: 6,
                  ),

                  Text('Fun All The Time!',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize:18)
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(desctiption7,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      maxLines: 50,
                      style: TextStyle(
                          fontSize:14)
                  ),
                ],
              ),
            ),
        ),
      ),
      persistentFooterButtons: [
        Center(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 2,
                  child: Text('\$ ' +
                      detailsProduct['piece'],
                      style: TextStyle(
                          fontSize:30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black)),
              ),

              Expanded(
                flex: 1,
                child: ElevatedButton(
                    child: Text("Buy Now",
                        style: TextStyle(
                            fontSize:16,
                            color: Colors.white)),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(20),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20)),
                      primary: detailsProduct['color'],
                    ),
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
        )
      ],
    );
  }
}