import '../../utils/api_constants.dart';

class ImageBean {
  String? url;
  String? sId;

  ImageBean({this.url, this.sId});

  ImageBean.fromJson(Map<String, dynamic> json) {
    url = '${ApiConstants.baseUrl}${json['url']}';
    sId = json['_id'];
  }
}
