import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smart_grab/shared_qrcode/scoped_models/main.dart';
import 'package:smart_grab/shared_qrcode/pages/page2.dart';


class Scoped extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final MainModel _model = MainModel();

    return ScopedModel<MainModel>(
        model: _model,
        child: MaterialApp(
          title: 'Scan Page',
          home: MyHomePage(),
        ));
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
      return Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              SizedBox(height: 10.0),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                  child: Text('${model.cart}'.toString())//BarcodeList(barcode)
                ),
              RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  child: Text('Add'),
                  onPressed: () {
                    model.scan();
                  }, //_incrementCounter(_model),
                ),
                SizedBox(height: 20.0),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute<Page2>(
                  builder: (BuildContext context) => Page2()),
            );
          },
          tooltip: 'Checkout',
          child: Icon(Icons.arrow_forward),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    });
  }
}