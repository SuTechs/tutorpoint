import 'package:tutorpoint/data/utils/Utils.dart';
import 'package:tutorpoint/data/utils/modal/user.dart';
import 'package:tutorpoint/data/utils/network/callApi.dart';

class LoginBloc {
  Future<bool> login(String email, String pass) async {
    final data = await callApi({"email": email, "password": pass}, 'app.php');

    print('data = $data');

    if (data['code'] == 300) {
      User().userId = data['id'];
      User().email = email;
      User().pass = pass;

      return true;
    }

    Utils.showToast('Invalid password / email');

    return false;
  }
}
