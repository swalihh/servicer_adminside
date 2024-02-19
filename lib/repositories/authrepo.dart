import 'package:adminservice/data/network/apiservices.dart';
import 'package:adminservice/resources/appurls/servicerurls.dart';

class AuthRepo {
  EitherResponse adminLogin(var rawData) async {
    const url = AppUrl.adminLogin;
    return await ApiServices.postApi(rawData, url);
  }
}
