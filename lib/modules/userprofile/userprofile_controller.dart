import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:yes_premium/models/user_model.dart';

import 'package:yes_premium/modules/userprofile/userprofile_api.dart';

class UserProfileController extends GetxController {
  //Instance of storage
  final box = GetStorage();

  //User model
  Rx<UserModelData> userDetails = UserModelData().obs;
  var userModelDetails = <UserModelData>[].obs;
  //Loading while fetching data
  RxBool isLoading = true.obs;
  var userID = ''.obs;
  var userSchoolID = ''.obs;
  var userCode = ''.obs;
  var userFirstname = ''.obs;
  var userLastname = ''.obs;
  var userMiddlename = ''.obs;
  var userBirthday = ''.obs;
  var userAddress = ''.obs;
  var userGender = ''.obs;
  var userImage = ''.obs;
  var userCoverImage = ''.obs;
  var userEducationalAttainment = ''.obs;
  var userSubjMajor = ''.obs;
  var userPosition = ''.obs;
  var userFacebook = ''.obs;
  var userTwitter = ''.obs;
  var userInstagram = ''.obs;
  var userEmail = ''.obs;
  var userSkype = ''.obs;
  var userZoom = ''.obs;
  var userMotto = ''.obs;
  var userNickname = ''.obs;
  var userDreamjob = ''.obs;
  var userYear = ''.obs;
  var userType = ''.obs;
  var userName = ''.obs;
  var schoolName = ''.obs;
  var schoolLogo = ''.obs;
  var parentFullname = ''.obs;
  var parentEmail = ''.obs;
  var parentContactNumber = ''.obs;
  var name = ''.obs;
  var lockoutEnabled = ''.obs;

  @override
  void onInit() {
    super.onInit();
    userID.value = Get.arguments['userID'];
    getUserDetailsById();
  }

  //Get customer details from server
  Future<void> getUserDetailsById() async {
    try {
      userModelDetails.value =
          await UserProfileApi.getUserDetailsById(userID.value);
      //Assign values from server to variables
      userSchoolID..value = "${userModelDetails[0].userSchoolID}";
      userCode.value = "${userModelDetails[0].userCode}";
      userFirstname.value = "${userModelDetails[0].userFirstname}";
      userLastname.value = "${userModelDetails[0].userLastname}";
      userMiddlename.value = "${userModelDetails[0].userMiddlename}";
      userBirthday.value = "${userModelDetails[0].userBirthday}";
      userAddress.value = "${userModelDetails[0].userAddress}";
      userGender.value = "${userModelDetails[0].userGender}";
      userImage.value = "${userModelDetails[0].userImage}";
      userCoverImage.value = "${userModelDetails[0].userCoverImage}";
      userEducationalAttainment.value =
          "${userModelDetails[0].userEducationalAttainment}";
      userSubjMajor.value = "${userModelDetails[0].userSubjMajor}";
      userPosition.value = "${userModelDetails[0].userPosition}";
      userFacebook.value = "${userModelDetails[0].userFacebook}";
      userTwitter.value = "${userModelDetails[0].userTwitter}";
      userInstagram.value = "${userModelDetails[0].userInstagram}";
      userEmail.value = "${userModelDetails[0].userEmail}";
      userSkype.value = "${userModelDetails[0].userSkype}";
      userZoom.value = "${userModelDetails[0].userZoom}";
      userMotto.value = "${userModelDetails[0].userMotto}";
      userNickname.value = "${userModelDetails[0].userNickname}";
      userDreamjob.value = "${userModelDetails[0].userDreamjob}";
      userYear.value = "${userModelDetails[0].userYear}";
      userType.value = "${userModelDetails[0].userType}";
      userName.value = "${userModelDetails[0].userName}";
      schoolName.value = "${userModelDetails[0].schoolName}";
      schoolLogo.value = "${userModelDetails[0].schoolLogo}";
      parentFullname.value = "${userModelDetails[0].parentFullname}";
      parentEmail.value = "${userModelDetails[0].parentEmail}";
      parentContactNumber.value = "${userModelDetails[0].parentContactNumber}";
      name.value = "${userModelDetails[0].name}";
      lockoutEnabled.value = "${userModelDetails[0].lockoutEnabled}";
    } catch (error) {
      print("getUserDetailsById $error");
    } finally {
      isLoading(false);
    }
  }
}
