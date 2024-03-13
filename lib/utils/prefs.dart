import 'package:shared_preferences/shared_preferences.dart';

class pref{
 Future<String> getvalue(key)  async{
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key)??'';
  }
  Future<void> setvalue(key,value) async{
     SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
     sharedPreferences.setString(key,value);
  }
}