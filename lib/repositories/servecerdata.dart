import 'package:adminservice/data/network/apiservices.dart';
import 'package:adminservice/data/sharedpreferences/login.dart';
import 'package:adminservice/resources/appurls/servicerurls.dart';

class ServicerRepo {
  String token = Sharedprfe.instance.getToken();

  EitherResponse getallServicer() async =>
      await ApiServices.getApi(AppUrl.getAllServicer,null,token); 

  EitherResponse acceptServicer(String url, String id) async =>
      await ApiServices.patchApi("$url/$id");

  EitherResponse rejectServicer(String url, String id) async =>
      await ApiServices.patchApi("$url/$id");

  EitherResponse getAcceptedSevicer() async =>
      await ApiServices.getApi(AppUrl.acceptedSercivers);
}
 