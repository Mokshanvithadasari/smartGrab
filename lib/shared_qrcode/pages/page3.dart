import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:smart_grab/shared_qrcode/scoped_models/main.dart';
import 'package:qr_flutter/qr_flutter.dart';

class Page3 extends StatelessWidget {
  GlobalKey globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text("Page 3"),
          elevation: 0.0),
      body: ScopedModelDescendant<MainModel>(
        builder: (BuildContext context, Widget child, MainModel model) {
          final bodyHeight = MediaQuery.of(context).size.height - MediaQuery.of(context).viewInsets.bottom;
          return Container(
      color: const Color(0xFFFFFFFF),
      child:  Column(
        children: <Widget>[
          //Text('${model.cart.toString()}'),
          Expanded(
            child:  Center(
              child: QrImage(
                  foregroundColor: Colors.teal,
                  data: '${model.cart}',
                  version: 9,
                  size: 0.2 * bodyHeight,
                  onError: (ex) {
                    _showToast(context);
                  },
                ),
            ),
          ),
        ],
      ),
    );
        }
      ),
    );
  }

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: const Text('Some Error due to length of cart'),
        action: SnackBarAction(
            label: 'Dismiss', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}