import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable{
  final int statuscode;
  final String statusmessage;
  final bool success;

const   ErrorMessageModel({
 required   this.statuscode,
  required  this.statusmessage,
  required  this.success
});
factory ErrorMessageModel.fromjson(Map<String,dynamic>json)=>ErrorMessageModel(
    statuscode: json["status_code"],
    statusmessage: json["status_message"],
    success: json["success"],
);

  @override

  List<Object?> get props =>[
    statuscode,statusmessage,success,
  ];


}