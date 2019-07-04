import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smart_grab/shared_qrcode/scoped_models/main.dart';
import 'package:smart_grab/shared_qrcode/pages/page3.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(),
      body: ScopedModelDescendant<MainModel>(
          builder: (BuildContext context, Widget child, MainModel model) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              Text(
                'Your cart has: ${model.cart.toString()}',
                style: TextStyle(fontSize: 18.0),
              ),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('Confirm'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<Page3>(
                          builder: (BuildContext context) => Page3()),
                    );
                  }),
              
              SizedBox(height: 20.0),
            ],
          ),
        );
      }),
    );
  }
}