import 'package:device_info/device_info.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class GetStorageService extends GetxService {
  static GetStorageService c = Get.find();
  final appdata = GetStorage();

  var deviceInchSize = 0.0.obs;

  RxString userId = ''.obs;
  RxString userToken = ''.obs;
  RxString roleType = ''.obs;

  void getDeviceScreenSize() {
    var inchByhundred = ((Get.height + Get.width) / 2) / 100;
    String inch = inchByhundred.toStringAsFixed(2);
    deviceInchSize.value = double.parse(inch);
    print('deviceInchSize $deviceInchSize');
  }

  @override
  void onInit() {
    super.onInit();
    getDeviceScreenSize();
    //userId.value = appdata.read('user_id');

    if (GetPlatform.isAndroid) {
      getDeviceinfoAndroid();
    } else {
      getDeviceinfoIoS();
    }
  }

  void setLoginStorage(userId, userToken, roleType, result) {
    appdata.write('user_id', userId);
    appdata.write('user_token', userToken);
    appdata.write('role_type', roleType);
    appdata.write('result', result);
    print('set user login storage..');
  }

  void setUserDataStorage(
    userId, // = json['user_id'];1
    userToken, // = json['user_token'];2
    userCode, // = json['user_code'];3
    userEmailAddress, // = json['user_email_address'];4
    userPassword, // = json['user_password'];5
    userFirstname, // = json['user_firstname'];6
    userLastname, // = json['user_lastname'];7
    userMiddlename, // = json['user_middlename'];8
    userSuffixes, // = json['user_suffixes'];9
    userGender, // = json['user_gender'];10
    userContactNumber, // = json['user_cont0act_number'];11
    userImage, // = json['user_image'];12
    userEducationalAttainment, // = json['user_educational_attainment'];13
    userSubjMajor, // = json['user_subj_major'];14
    userCurrentSchool, // = json['user_current_school'];15
    userPosition, // = json['user_position'];16
    userFacebook, // = json['user_facebook'];17
    userInstagram, // = json['user_instagram'];18
    userTwitter, // = json['user_twitter'];19
    userGmail, // = json['user_gmail'];20
    userSkype, // = json['user_skype'];21
    userZoom, // = json['user_zoom'];22
    userMotto, // = json['user_motto'];23
    userActivation, // = json['user_activation'];24
    userNickname, // = json['user_nickname'];25
    userDreamjob, // = json['user_dreamjob'];26
    userRole, // = json['user_role'];27
    validated, // = json['validated'];28
    result, // = json['result'];29
    connection, // = json['connection'];30
  ) {
    appdata.write('user_id', userId);
    appdata.write('user_token', userToken);
    appdata.write('user_code', userCode);

    appdata.write('user_email_address', userEmailAddress);
    appdata.write('user_password', userPassword);

    appdata.write('user_firstname', userFirstname);
    appdata.write('user_lastname', userLastname);
    appdata.write('user_middlename', userMiddlename);
    appdata.write('user_suffixes', userSuffixes);
    appdata.write('user_gender', userGender);
    appdata.write('user_contact_number', userContactNumber);
    appdata.write('user_image', userImage);
    appdata.write('user_educational_attainment', userEducationalAttainment);
    appdata.write('user_subj_major', userSubjMajor);
    appdata.write('user_current_school', userCurrentSchool);
    appdata.write('user_position', userPosition);
    appdata.write('user_facebook', userFacebook);
    appdata.write('user_instagram', userInstagram);
    appdata.write('user_twitter', userTwitter);
    appdata.write('user_gmail', userGmail);
    appdata.write('user_skype', userSkype);
    appdata.write('user_zoom', userZoom);
    appdata.write('user_motto', userMotto);
    appdata.write('user_activation', userActivation);
    appdata.write('user_nickname', userNickname);
    appdata.write('user_dreamjob', userDreamjob);
    appdata.write('user_role', userRole);
    appdata.write('validated', validated);
    appdata.write('result', result);
    appdata.write('connection', connection);
    print('set user Data storage..');
  }

  void removeUserStorage() {
    appdata.erase();
    print('erase user Data storage..');
  }

  void printStorage() {
    print(appdata.read('firstname'));
    print(appdata.read('lastname'));
    print(appdata.read('contactnumber'));
    print(appdata.read('email'));
  }

  DeviceInfoPlugin androiddeviceInfo = DeviceInfoPlugin();
  DeviceInfoPlugin iosdeviceInfo = DeviceInfoPlugin();
  var androidboard = ''.obs;
  var androidbrand = ''.obs;
  var androiddevice = ''.obs;
  var androidhardware = ''.obs;
  var androidhost = ''.obs;
  var id = ''.obs;
  var androidmanufacture = ''.obs;
  var androidmodel = ''.obs;
  var androidproduct = ''.obs;
  var androidtype = ''.obs;
  var androidid = ''.obs;
  var isphysicaldevice = false.obs;
  late AndroidDeviceInfo androidDeviceInfo;
  var iosname = ''.obs;
  var iossystemName = ''.obs;
  var iossystemVersion = ''.obs;
  var iosmodel = ''.obs;
  var ioslocalizedModel = ''.obs;
  var iosidentifierForVendor = ''.obs;
  var iossysname = ''.obs;
  var isIosPhysicalDevice = false.obs;
  late IosDeviceInfo iosDeviceInfo;

  getDeviceinfoAndroid() async {
    androidDeviceInfo = await androiddeviceInfo.androidInfo;
    androidboard.value = androidDeviceInfo.board;
    androidbrand.value = androidDeviceInfo.brand;
    androiddevice.value = androidDeviceInfo.device;
    androidhardware.value = androidDeviceInfo.hardware;
    androidhost.value = androidDeviceInfo.host;
    id.value = androidDeviceInfo.id;
    androidmanufacture.value = androidDeviceInfo.manufacturer;
    androidmodel.value = androidDeviceInfo.model;
    androidproduct.value = androidDeviceInfo.product;
    androidtype.value = androidDeviceInfo.type;
    isphysicaldevice.value = androidDeviceInfo.isPhysicalDevice;
    androidid.value = androidDeviceInfo.androidId;
    print("id android : $id");
    print("androidid adroid : $androidid");
    print("android model $androidmodel");
    print("android brand :$androidbrand");
  }

  getDeviceinfoIoS() async {
    iosDeviceInfo = await iosdeviceInfo.iosInfo;
    iosname.value = iosDeviceInfo.name;
    iossystemName.value = iosDeviceInfo.systemName;
    iossystemVersion.value = iosDeviceInfo.systemVersion;
    iosmodel.value = iosDeviceInfo.model;
    ioslocalizedModel.value = iosDeviceInfo.localizedModel;
    iosidentifierForVendor.value = iosDeviceInfo.identifierForVendor;
    isIosPhysicalDevice.value = iosDeviceInfo.isPhysicalDevice;
    iossysname.value = iosDeviceInfo.systemName;
    print("name ios : $iosname");
    print("systemName ios: $iossystemName");
    print("system version ios: $iossystemVersion");
    print("model ios: $iosmodel");
  }
}
