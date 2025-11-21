
class BooleanResponseModel {
/*
{
  "StatusCode": 500,
  "HasError": true,
  "Message": "Invalid Credential"
}
*/

  int? StatusCode;
  bool? HasError;
  String? Message;

  BooleanResponseModel({
    this.StatusCode,
    this.HasError,
    this.Message,
  });
  BooleanResponseModel.fromJson(Map<String, dynamic> json) {
    StatusCode = json['StatusCode'];
    HasError = json['HasError'];
    Message = json['Message']?.toString();
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['StatusCode'] = StatusCode;
    data['HasError'] = HasError;
    data['Message'] = Message;
    return data;
  }
}