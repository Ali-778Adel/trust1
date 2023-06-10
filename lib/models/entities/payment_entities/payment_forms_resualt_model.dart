
import 'package:hive/hive.dart';
part 'payment_forms_resualt_model.g.dart';


@HiveType(typeId: 10)
class PaymentFormsResultModel{
  @HiveField( 0)
  final String?result;
  @HiveField(1)
  final String? msg;
  @HiveField( 2)
  final String?cardId;
  @HiveField( 3)
  final String?logpass;


  PaymentFormsResultModel({this.result,this.cardId,this.logpass,this.msg});

  factory PaymentFormsResultModel.fromJson(Map<String,dynamic>json){
    return PaymentFormsResultModel(result: json['result'],msg:json['msg'],cardId: json['cardId'],logpass:json['logpass'] );
  }
}