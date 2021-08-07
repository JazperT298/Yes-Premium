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

  void setLoginStorage(
      accessToekn, tokenType, expiresIn, userName, issued, expires) {
    appdata.write('access_token', accessToekn);
    appdata.write('token_type', tokenType);
    appdata.write('expires_in', expiresIn);
    appdata.write('userName', userName);
    appdata.write('.issued', issued);
    appdata.write('.expires', expires);
    print('set user login storage..');
  }

  void setUserDataStorage(
    userId,
    school,
    schoolId,
    schoolAvatar,
    username,
    avatar,
    role,
  ) {
    appdata.write('UserId', userId);
    appdata.write('School', school);
    appdata.write('SchoolId', schoolId);
    appdata.write('SchoolAvatar', schoolAvatar);
    appdata.write('Username', username);
    appdata.write('Avatar', avatar);
    appdata.write('Roles', role);

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
