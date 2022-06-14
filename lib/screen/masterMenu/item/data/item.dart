import 'package:fl_pos_app/screen/masterMenu/brand/data/brand.dart';
import 'package:fl_pos_app/screen/masterMenu/category/data/category.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/data/uom.dart';

class Item {
  int? id;
  String? barcode;
  String? name;
  String? description;
  int? uomId;
  Uom? uom;
  int? itemBrandId;
  Brand? itemBrand;
  int? categoryId;
  Category? category;
  int? price;
  bool? isVisible;

  Item(
      {this.id,
      this.barcode,
      this.name,
      this.description,
      this.uomId,
      this.uom,
      this.itemBrandId,
      this.itemBrand,
      this.categoryId,
      this.category,
      this.price,
      this.isVisible});

  Item.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    name = json['name'];
    description = json['description'];
    uomId = json['uomId'];
    uom = json['uom'] != null ? Uom.fromJson(json['uom']) : null;
    itemBrandId = json['itemBrandId'];
    itemBrand =
        json['itemBrand'] != null ? Brand.fromJson(json['itemBrand']) : null;
    categoryId = json['categoryId'];
    category =
        json['category'] != null ? Category.fromJson(json['category']) : null;
    price = json['price'];
    isVisible = json['isVisible'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['barcode'] = barcode;
    data['name'] = name;
    data['description'] = description;
    data['uomId'] = uomId;
    if (uom != null) {
      data['uom'] = uom!.toJson();
    }
    data['itemBrandId'] = itemBrandId;
    if (itemBrand != null) {
      data['itemBrand'] = itemBrand!.toJson();
    }
    data['categoryId'] = categoryId;
    if (category != null) {
      data['category'] = category!.toJson();
    }
    data['price'] = price;
    data['isVisible'] = isVisible;
    return data;
  }
}
