
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instax/constaint/Colors.dart';
import 'package:instax/screens/DetailsProduct.dart';

Widget itemList(BuildContext context, int index, _resoultDetails) {
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: _resoultDetails[index]['color'],
    ),
    width: double.infinity,
    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
    padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),

    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(_resoultDetails[index]['edition'],
                style: TextStyle(
                    color: primary,
                    fontSize: 13),
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text('Instax ',
                      style: TextStyle(
                        color: primary,
                        fontSize: 16,)),
                  Text(_resoultDetails[index]['type'],
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,)),
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                children: <Widget>[
                  Text('\$ ', style: TextStyle(
                      color: primary,
                      fontSize: 24,
                      letterSpacing: .3)),
                  Text(_resoultDetails[index]['piece'],
                      style: TextStyle(
                        color: primary,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,)),
                ],
              ),
              SizedBox(
                height: 12,
              ),

              ElevatedButton(
                child: Text("Buy",
                    style: TextStyle(color:
                    _resoultDetails[index]['color'])),
                style: ElevatedButton.styleFrom(
                  shape: StadiumBorder(),
                  primary: Colors.white,
                ),
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context)=> DetailsProduct(detailsProduct:
                      _resoultDetails[index])));
                },
              ),
            ],
          ),
        ),
        Center(
          child: Container(
              width: 120,
              child: Image.asset('assets/images/'+
                  _resoultDetails[index]['image'])),
        ),
      ],
    ),
  );
}
