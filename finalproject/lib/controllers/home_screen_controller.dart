import 'package:dio/dio.dart';
import 'package:finalproject/models/JsonHolderData.dart';
import 'package:finalproject/models/user.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import '../models/randomuserModel/RandomuserData.dart';
import '../utils/apis.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class HomeScreenController extends GetxController{

    var myValue=0.obs;
    var appBar='Home Screen'.obs;
    var cgpa=4.1.obs;
    var myUserList=[].obs;
    var myMap={}.obs;
    var isActive=false.obs;
    var name=<String>['Foal'].obs;
    var number=<int>[1,2,3].obs;
    var userModel=<UserModel>[].obs;
    var postList=<JsonHolderData>[].obs;
    var randomuserDataList=<RandomuserData>[].obs;

    @override
  void onInit(){
    // print('OnInit Method Called');
      cgpa.value=3.5;

      // getPaginationData( pageNo: 2);
      super.onInit();

    }

  @override
  void onClose(){
      // print('OnClose Method Called');
      cgpa.close();
      super.onClose();

  }

    void increment() {
      myValue.value++;
      myUserList.add('item-${myValue.value}');
    }

    void removeItem(int index){
      myUserList.removeAt(index);
    }

  updateItem(int i) {
      myUserList[i]='Foal';
  }


  //#Get method


    void getPaginationData({ required int pageNo}) async {

      var url='https://randomuser.me/api/?page=2&limite=5';

      Dio dio = Dio(BaseOptions(
        baseUrl:'https://randomuser.me',
      ));
      var connectivityResult = await (Connectivity().checkConnectivity());
      try {
        if (connectivityResult == ConnectivityResult.none) {
          EasyLoading.showToast('No internet connection',duration: const Duration(seconds:2)) ;
          print('No Internet Connection ');
        } else
          print('Internet Connected');
        EasyLoading.show(status: 'loading...');
        var response = await dio.get('/api',queryParameters:{
          'page':'$pageNo',
          'limit':'5'
        });
        if (response.statusCode == 200) {
          // EasyLoading.showSuccess('Great Success!');
          EasyLoading.showToast('Data loaded successfully',duration: const Duration(seconds:2),toastPosition:EasyLoadingToastPosition.bottom );
          print('HTTP Method: ${response.requestOptions.method}');
          print('HTTP Parameter: ${response.requestOptions.queryParameters}');
          print('HTTP Path: ${response.requestOptions.path}');
          print('HTTP Status Code: ${response.statusCode} Status Massage:${response.statusMessage}');

          var myPostData=response.data as List;

          var newList=myPostData.map((e) => RandomuserData.fromJson(e)).toList();

          randomuserDataList.addAll(newList);

          print('uyfy${postList.length}');

          // print(response.data);

        } else {
          print('Failed to load data');
        }
      }catch(e) {
        print('Error Occurred $e');
        EasyLoading.showError('Failed with Error');
      }finally{
        EasyLoading.dismiss();
      }
    }

}