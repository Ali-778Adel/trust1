import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

class PaymentRegistrationUserDataModel {
  final int? serviceId;
  final int? servicesStatus;
  final int? stateId;
  final int? cityId;
  final int? userId;
  final String? address;
  final String? cardId;
  final String? email;
  final String? mobileNumber;
  final String? companyName;
  final int? comorderCount;
  final String? isThereDiscount;
  final String? facebook;
  final String? whats;
  final int? subscriptionId;
  final String? isCount;
  final double? total;
  final String? isCommissioner;
  final String? commissionerName;
  final String? commissionerPhone;
  final String? commisionerCardId;
  final String? issuanceTaxDate;
  final String? taxCardDate;
  final String? discountUpload;
  final bool? liberalProfessions;
  final String? companyFiles;
  final String?taxNumber;
  final String? personalFiles;
  final String? commissionerFiles;
  final String? pdfPath;
  final String? pdfName;
  final String? taxCardPath;
  final String? taxCardName;
  final String? valueAddedCardPath;
  final String? valueAddedCardName;
  final String? issuanceRequestPath;
  final String? issuanceRequestName;
  final String? firstContractImagePath;
  final String? firstContractImageName;
  final String? secondContractImagePath;
  final String? secondContractImageName;
  final String? registerPersonCardPath;
  final String? registerPersonCardName;
  final String? nationalCardPath;
  final String? nationalCardName;
  final String? singleContractImagePath;
  final String? singleContractImageName;
  final String? commissionImagePath;
  final String? commissionImageName;
  final String? commissionerNationalCardImagePath;
  final String? commissionerNationalCardImageName;
  final String? discountNotificationPath;
  final String? discountNotificationName;

  PaymentRegistrationUserDataModel({
    this.serviceId,
    this.stateId,
    this.cityId,
    this.companyName,
    this.address,
    this.email,
    this.cardId,
    this.commisionerCardId,
    this.commissionerFiles,
    this.commissionerName,
    this.commissionerPhone,
    this.comorderCount,
    this.companyFiles,
    this.taxNumber,
    this.discountUpload,
    this.facebook,
    this.isCommissioner,
    this.isCount,
    this.issuanceTaxDate,
    this.isThereDiscount,
    this.liberalProfessions,
    this.mobileNumber,
    this.personalFiles,
    this.servicesStatus,
    this.subscriptionId,
    this.taxCardDate,
    this.total,
    this.userId,
    this.whats,
    this.pdfPath,
    this.pdfName,
    this.taxCardPath,
    this.taxCardName,
    this.valueAddedCardPath,
    this.valueAddedCardName,
    this.issuanceRequestPath,
    this.issuanceRequestName,
    this.firstContractImagePath,
    this.firstContractImageName,
    this.secondContractImagePath,
    this.secondContractImageName,
    this.registerPersonCardPath,
    this.registerPersonCardName,
    this.nationalCardPath,
    this.nationalCardName,
    this.singleContractImagePath,
    this.singleContractImageName,
    this.commissionImagePath,
    this.commissionImageName,
    this.commissionerNationalCardImagePath,
    this.commissionerNationalCardImageName,
    this.discountNotificationPath,
    this.discountNotificationName
  });

  String getExtensions(String fileName){
    List dots=[];
    String extension='';
    for(int i=0;i<fileName.length;i++){
      if(fileName[i]=='.'){
        dots.add(i);
      }
    }
    extension=fileName.substring(dots.last,fileName.length);
    return extension;
  }


  Future<FormData> formData({String? isCommissioner}) async {
    return FormData.fromMap({
      "services": serviceId,
      "serviceStatus": servicesStatus,
      "states": stateId,
      "cities": cityId,
      "address": address,
      "cardId": cardId,
      "email": email,
      "mobile": mobileNumber,
      "comcompany": companyName,
      "VATEG":taxNumber,
      "comorderCount": comorderCount,
      "isTherediscount": isThereDiscount,
      "facebook": facebook,
      "whats": whats,
      "comSubscriptionId": subscriptionId,
      'comdiscount': discountUpload,
      "total": total,
      "isCommissioner": isCommissioner,
      "commissioner": commissionerName,
      "commissionerMobile": commissionerPhone,
      "commissionerCardId": commisionerCardId,
      "issuanceTaxDate": issuanceTaxDate,
      "taxCardDate": taxCardDate,
      "discountUpload": discountUpload,
      "liberalProfessions": liberalProfessions,
      "companyfiles": serviceId == 1
          ? [
             liberalProfessions?? await MultipartFile.fromFile(
                 pdfPath??"",
                  filename:pdfName==null?"": 'companyfiles_0${getExtensions(pdfName!)}'),
              await MultipartFile.fromFile(
                taxCardPath!,
                filename: 'companyfiles_1${getExtensions(taxCardName!)}',
              ),
              await MultipartFile.fromFile(
                valueAddedCardPath!,
                filename: 'companyfiles_2${getExtensions(valueAddedCardName!)}',
              ),
              await MultipartFile.fromFile(
                issuanceRequestPath!,
                filename: 'companyfiles_3${getExtensions(issuanceRequestName!)}',
              ),
              await MultipartFile.fromFile(
                firstContractImagePath!,
                filename: 'companyfiles_4${getExtensions(firstContractImageName!)}',
              ),
              await MultipartFile.fromFile(
                secondContractImagePath!,
                filename: 'companyfiles_5${getExtensions(secondContractImageName!)}',
              ),
              MultipartFile.fromFile(
                registerPersonCardPath!,
                filename: 'companyfiles_6${getExtensions(registerPersonCardName!)}',
              ),
            isThereDiscount??  await MultipartFile.fromFile(
                discountNotificationPath!,
                filename: 'companyfiles_7${getExtensions(discountNotificationName!)}',

              ),

            ]
          : [],
      "personalfiles": serviceId == 2
          ? [
              await MultipartFile.fromFile(
                issuanceRequestPath!,
                filename: 'personalfiles_0${getExtensions(issuanceRequestName!)}',
              ),
              await MultipartFile.fromFile(
                nationalCardPath!,
                filename: 'personalfiles_1${getExtensions(nationalCardName!)}',
              ),
              await MultipartFile.fromFile(singleContractImagePath!,
                  filename: 'personalfiles_2${getExtensions(singleContractImageName!)}')
            ]
          : [],
      "commissionerfiles": isCommissioner=='True'
          ? [
              await MultipartFile.fromFile(
                commissionImagePath!,
                filename: 'commissionerfiles_0${getExtensions(commissionImageName!)}',
              ),

              await MultipartFile.fromFile(
                commissionerNationalCardImagePath!,
                filename: 'commissionerfiles_1${getExtensions(commissionerNationalCardImageName!)}',
              ),
            ]
          : [],
    });
  }

}
