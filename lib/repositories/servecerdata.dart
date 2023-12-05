import 'package:adminservice/data/network/apiservices.dart';
import 'package:adminservice/resources/appurls/servicerurls.dart';

class ServicerRepo{

EitherResponse getallServicer()async =>
await ApiServices.getApi(AppUrl.getAllServicer);


}
