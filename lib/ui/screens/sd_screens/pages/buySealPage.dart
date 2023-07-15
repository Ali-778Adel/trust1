import 'dart:io';

import 'package:fl_egypt_trust/data/local_data_source/sd.dart';
import 'package:fl_egypt_trust/models/utils/themes/app_general_trans.dart';
import 'package:fl_egypt_trust/ui/screens/main/redesign_home/pages/new_home_screen.dart';
import 'package:fl_egypt_trust/ui/screens/widgets/custom_app_bar.dart';
import 'package:fl_egypt_trust/ui/screens/widgets/toast_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:oktoast/oktoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sizer/sizer.dart';
import '../../../../di/dependency_injection.dart';
import '../../../../models/entities/sd_entities/sd_configs_entity.dart';
import '../../../../models/utils/themes/colors.dart';
import '../../bottom_navigations/bottom_navigation_handler.dart';
import 'configs_screen.dart';
import 'edit_configs_screen.dart';
import 'package:qr_flutter/qr_flutter.dart';

import 'extract_signature_page.dart';

class BuySealPage extends StatefulWidget {
  const BuySealPage({Key? key}) : super(key: key);

  @override
  State<BuySealPage> createState() => _BuySealPageState();
}

class _BuySealPageState extends State<BuySealPage> {
  bool isCofigs = false;
  // String signature="";
  // String pinCode="";

  List<String> result = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    checkConfigs().then((value) async {
      if (value.signatureCode == null) {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const SDConfigsScreen()));
      } else {
        print("i will call now ");
        showToastWidget(
            CustomToastWidget(
              toastContent: AppGeneralTrans.waitSDTxt,
              toastStatus: ToastStatus.success,
            ),
            duration: Duration(seconds: 5));
        await call(
            signature: value.signatureCode == null ? "" : value.signatureCode!,
            pinCode: value.pinCode == null ? '' : value.pinCode!);
        print("call ended");
      }
    });
    // if(valFromNative!="");
  }

  Future<SdConfigsEntity> checkConfigs() async {
    final either = await sl<SDLocalData>().getSDConfigsData();
    return either.fold((l) {
      setState(() {
        isCofigs = false;
      });
      return SdConfigsEntity();
    }, (r) {
      setState(() {
        isCofigs = true;
      });

      return r;
    });
  }

  // String valFromNative='';
  Map<String, dynamic> certificateData = {};
  bool isSealRequested = false;

  Future<void> call(
      {required String signature, required String pinCode}) async {
    const channel = MethodChannel('com.example.native_method_channel');
    await channel.invokeMethod('onCreate1', {
      'signature': signature,
      'pinCode': pinCode,
      'userData': 'hello'
    }).then((value) {
      print("value form b=native is ${value.toString()}");
      setState(() {
        Map<Object?, Object?> originalMap = value;
        Map<String, dynamic> newMap = {};
        originalMap.forEach((key, value) {
          if (key is String) {
            newMap[key] = value;
          }
        });
        certificateData = newMap;
        String input = certificateData['key6'];
        List<String> pairs = input.split(', ');
        for (String pair in pairs) {
          // List<String> keyValue = pair.split('=');
          result.add(pair);
        }
      });
    });
  }

  void _popup() async {
    FocusScope.of(context).requestFocus(FocusNode());
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => HomeNavigationScreen()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        _popup();
        return false;
      },
      child: Scaffold(
        appBar: CustomAppBar(context: context).call(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(16.sp),
          child: _buildSDData(context: context),
        ),
        floatingActionButton: Visibility(
            visible: isCofigs,
            child: FloatingActionButton(
              onPressed: () {},
              child: IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EditSDConfigsScreen()));
                },
              ),
            )),
      ),
    );
  }

  Future<File> getFileFromSDCard(String fileName) async {
    final directory = await getExternalStorageDirectory();
    final filePath = '${directory!.path}/$fileName';
    return File(filePath);
  }

  Future<String> readFileFromSDCard(String fileName) async {
    try {
      final file = await getFileFromSDCard(fileName);
      String contents = await file.readAsString();
      return contents;
    } catch (e) {
      return '';
    }
  }

  Widget _buildSDData({required BuildContext context}) {
    if (certificateData["key2"].toString().isNotEmpty) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              height: 55.h,
              padding: EdgeInsets.symmetric(horizontal: 16.sp),
              decoration: BoxDecoration(
                  color: Palette.white,
                  borderRadius: BorderRadius.all(Radius.circular(10.sp)),
                  border: Border.all(color: Palette.mainGreen)),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                          flex: 4,
                          child: Text(
                            AppGeneralTrans.egyptTrustTxt,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    fontSize: 32.sp, color: Palette.mainGreen),
                          )),
                      Expanded(
                          flex: 1,
                          child: Icon(
                            Icons.sd,
                            color: Palette.mainGreen,
                            size: 32.sp,
                          ))
                    ],
                  ),
                  Divider(
                    color: Palette.mainGreen,
                    height: 2.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: Wrap(
                      children: [
                        Text(
                          AppGeneralTrans.serialNumTxt,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Palette.mainGreen),
                        ),
                        Text(
                          "${certificateData["key2"].toString().isEmpty ? AppGeneralTrans.waitTxt : certificateData["key2"]}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Palette.mainBlue),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Palette.mainGreen,
                    height: 2.sp,
                  ),

                  /// start of user data
                  ///
                  ///

                  // Expanded(
                  //   child: Row(
                  //     children: [
                  //       Expanded(flex:1,child: Text(AppGeneralTrans.companyTxt,style:   Theme.of(context).textTheme.bodyMedium!.copyWith(color: Palette.mainGreen),)),
                  //       Expanded(flex:4,child: Text(
                  //         "${certificateData["key6"].toString().isEmpty?AppGeneralTrans.waitTxt:AppGeneralTrans.egyTrustTxt}",
                  //         style:   Theme.of(context).textTheme.bodyMedium!.copyWith(color: Palette.mainBlue),))
                  //     ],
                  //   ),
                  // ),
                  // Divider(color: Palette.mainGreen,height: 2.sp,),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: Wrap(
                      children: [
                        Text(
                          AppGeneralTrans.clientNameTxt,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Palette.mainGreen),
                        ),
                        Text(
                          "${result.isEmpty ? "" : result[0].replaceAll("CN=", "")}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Palette.mainBlue),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Palette.mainGreen,
                    height: 2.sp,
                  ),

                  /*
                   Expanded(
                     child: Row(
                       children: [
                         Expanded(flex:2,child: Text("البريد الالكتروني",style:   Theme.of(context).textTheme.bodyMedium!.copyWith(color: Palette.mainGreen),)),
                         Expanded(flex:5,child: Text(
                           "${result.isEmpty?"":result[1].replaceAll("EMAILADDRESS=", "")}",
                           style:   Theme.of(context).textTheme.bodyMedium!.copyWith(color: Palette.mainBlue),))
                       ],
                     ),
                   ),
                   Divider(color: Palette.mainGreen,height: 2.sp,),
                   */

                  /// end of user data
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: Wrap(
                      children: [
                        Text(
                          AppGeneralTrans.certIssuanceData,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Palette.mainGreen),
                        ),
                        Text(
                          "${certificateData["key3"].toString().isEmpty ? AppGeneralTrans.waitTxt : certificateData['key3']}",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Palette.mainBlue),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Palette.mainGreen,
                    height: 2.sp,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.sp),
                    child: Wrap(
                      children: [
                        Text(
                          AppGeneralTrans.certEndDateTxt,
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Palette.mainGreen,
                                  ),
                        ),
                        Text(
                          "${certificateData["key4"].toString().isEmpty ? AppGeneralTrans.waitTxt : certificateData["key4"]}",
                          style:
                              Theme.of(context).textTheme.bodyMedium!.copyWith(
                                    color: Palette.mainBlue,
                                  ),
                        )
                      ],
                    ),
                  ),
                  //Divider(color: Palette.mainGreen,height: 2.sp,),
                ],
              )),
          Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 16.sp),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 12.sp),
                child: SizedBox(
                  // height: 30.sp,
                  width: 60.w,
                  child: TextButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ExtractSignaturePage()));
                      // setState(() {
                      //   isSealRequested=true;
                      // });
                    },
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Palette.mainGreen),
                        foregroundColor:
                            MaterialStateProperty.all<Color>(Colors.white),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(35.0),
                                    side:
                                        BorderSide(color: Palette.mainGreen)))),
                    child: Text(
                      AppGeneralTrans.issuanceSealTxt,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: Palette.white),
                    ),
                  ),
                ),
              ),
            ),
          ),

          // if(isSealRequested==true)
          //   Container(
          //       width: double.infinity,
          //       padding: EdgeInsets.all(32.sp),
          //       margin: EdgeInsets.symmetric(vertical: 16.sp),
          //
          //       decoration: BoxDecoration(
          //         color: Palette.white,
          //         borderRadius: BorderRadius.all(Radius.circular(10.sp)),
          //         border: Border.all(color: Palette.textHint),
          //       ),
          //       child:Center(
          //         child: QrImage(
          //           data: "${certificateData['key5']}",
          //           version: QrVersions.auto,
          //           size: 200.0,
          //           foregroundColor: Colors.black,
          //           backgroundColor: Colors.transparent,
          //         ),
          //       )
          //
          //   )
        ],
      );
    } else {
      return Center(
        child: Text(certificateData["key1"].toString()),
      );
    }
  }
}
