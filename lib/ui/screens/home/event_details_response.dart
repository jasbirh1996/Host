import '../../../models/beans/image_bean.dart';

class EventDetailsResponse {
  String? message;
  EventDetailsBean? data;
  int? stats;

  EventDetailsResponse({this.message, this.data, this.stats});

  EventDetailsResponse.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    data = json['data'] != null ? EventDetailsBean.fromJson(json['data']) : null;
    stats = json['stats'];
  }
}

class EventDetailsBean {
  String? eventType;
  String? eventName;
  String? eventDate;
  int? eventStartTime;
  int? eventEndTime;
  AddedBy? addedBy;

  EventDetailsBean(
      {this.eventType,
        this.eventName,
        this.eventDate,
        this.eventStartTime,
        this.eventEndTime,
        this.addedBy});

  EventDetailsBean.fromJson(Map<String, dynamic> json) {
    eventType = json['event_type'];
    eventName = json['event_name'];
    eventDate = json['event_date'];
    eventStartTime = json['event_start_time'];
    eventEndTime = json['event_end_time'];
    addedBy = json['added_by'] != null
        ? AddedBy.fromJson(json['added_by'])
        : null;
  }

}

class AddedBy {
  String? name;
  String? profilePic;
  String? email;
  String? countryCode;
  String? mobileNumber;
  List<ImageBean>? images;
  String? businessName;
  String? businessLogo;

  AddedBy(
      {this.name,
        this.profilePic,
        this.email,
        this.countryCode,
        this.mobileNumber,
        this.images,
        this.businessName,
        this.businessLogo});

  AddedBy.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    profilePic = json['profile_pic'];
    email = json['email'];
    countryCode = json['country_code'];
    mobileNumber = json['mobile_number'];
    if (json['images'] != null) {
      images = <ImageBean>[];
      json['images'].forEach((v) {
        images!.add(ImageBean.fromJson(v));
      });
    }
    businessName = json['business_name'];
    businessLogo = json['business_logo'];
  }
}