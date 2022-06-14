import 'package:fl_pos_app/api/api.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/data/uom.dart';

class UomApi {
  static Future<List<Uom>> findAll() async {
    final client = await Api.restClient();
    var data = client.findAllUom();
    return data;
  }
}
