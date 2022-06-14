import 'package:dio/dio.dart';
import 'package:fl_pos_app/screen/masterMenu/uom/data/uom.dart';
import 'package:retrofit/retrofit.dart';

part 'restclient.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("uoms")
  Future<List<Uom>> findAllUom();

  // @GET("area/{id}")
  // Future<Area> areaFindById(@Path() String id);

  // @PUT("customer/{id}")
  // Future customerEdit(@Path() String id, @Body() Customer cst);

  // @POST("customer")
  // Future<Customer> postCustomer(@Body() Customer customer);
}
