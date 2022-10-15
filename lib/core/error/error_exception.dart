import 'package:movies_app/core/network/error_massage.dart';

class ServerException implements Exception{
  final ErrorMessageModel errorMessageModel;

 const ServerException({required this.errorMessageModel});
}