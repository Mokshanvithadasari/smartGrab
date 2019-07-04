import 'package:scoped_model/scoped_model.dart';
import 'package:qrcode_reader/qrcode_reader.dart';

class MainModel extends Model {
  String _name = "";
  int _count = 0;
  List<String> _cart=List<String>();
  String get name {
    return _name;
  }

  List<String> get cart {
    return _cart;
  }

  int get count {
    return _count;
  }

  void updateName(String name) {
    _name = name;
  }

  void incrementCount() {
    _count += 1;
    notifyListeners();
  }

    Future scan() async {
    String barcode = await QRCodeReader().scan();
    if (barcode != null){
      _cart.add("$barcode");
    }
    notifyListeners();
  }
}