import '../../../models/beans/image_bean.dart';
import '../../../utils/api_constants.dart';

class ProfileResponse {
  String? message;
  ProfileBean? data;
  int? stats;

  ProfileResponse({this.message, this.data, this.stats});

  ProfileResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? ProfileBean.fromJson(json['data']) : null;
    stats = json['stats'];
  }
}

class ProfileBean {
  String? shopNumber;
  String? streetNumber;
  String? locality;
  String? restaurantIsOpen;
  String? oTP;
  String? countryCode;
  String? mobileNumber;
  String? deviceType;
  String? deviceToken;
  int? userType;
  String? isoCode;
  bool? isBlocked;
  bool? isDeleted;
  bool? isProfileCreated;
  String? socialId;
  String? socialType;
  String? profilePic;
  String? firstname;
  String? lastname;
  String? businessName;
  String? email;
  String? restaurantWebsite;
  String? country;
  String? city;
  String? restaurantAddress;
  String? restaurantDescription;
  String? businessLogo;
  int? rating;
  bool? isActive;
  int? addedOn;
  bool? isEmailVerified;
  String? sId;
  String? accessToken;
  List<ImageBean>? images;

  ProfileBean(
      {this.shopNumber,
      this.streetNumber,
      this.locality,
      this.restaurantIsOpen,
      this.oTP,
      this.countryCode,
      this.mobileNumber,
      this.deviceType,
      this.deviceToken,
      this.userType,
      this.isoCode,
      this.isBlocked,
      this.isDeleted,
      this.isProfileCreated,
      this.socialId,
      this.socialType,
      this.profilePic,
      this.firstname,
      this.lastname,
      this.businessName,
      this.email,
      this.restaurantWebsite,
      this.country,
      this.city,
      this.restaurantAddress,
      this.restaurantDescription,
      this.businessLogo,
      this.rating,
      this.isActive,
      this.addedOn,
      this.isEmailVerified,
      this.sId,
      this.accessToken,
      this.images});

  ProfileBean.fromJson(Map<String, dynamic> json) {
    shopNumber = json['shop_number'];
    streetNumber = json['street_number'];
    locality = json['locality'];
    restaurantIsOpen = json['restaurant_is_open'];
    oTP = json['OTP'];
    countryCode = json['country_code'];
    mobileNumber = json['mobile_number'];
    deviceType = json['device_type'];
    deviceToken = json['device_token'];
    userType = json['userType'];
    isoCode = json['isoCode'];
    isBlocked = json['is_blocked'];
    isDeleted = json['is_deleted'];
    isProfileCreated = json['is_profile_created'];
    socialId = json['social_id'];
    socialType = json['social_type'];
    profilePic = '${ApiConstants.baseUrl}${json['profile_pic']}';
    firstname = json['firstname'];
    lastname = json['lastname'];
    businessName = json['business_name'];
    email = json['email'];
    restaurantWebsite = json['restaurant_website'];
    country = json['country'];
    city = json['city'];
    restaurantAddress = json['restaurant_address'];
    restaurantDescription = json['restaurant_description'];
    businessLogo = '${ApiConstants.baseUrl}${json['business_logo']}';
    rating = json['rating'];
    isActive = json['is_active'];
    addedOn = json['added_on'];
    isEmailVerified = json['is_email_verified'];
    sId = json['_id'];
    accessToken = json['access_token'];
    if (json['images'] != null) {
      images = <ImageBean>[];
      json['images'].forEach((v) {
        images!.add(ImageBean.fromJson(v));
      });
    }
  }
}