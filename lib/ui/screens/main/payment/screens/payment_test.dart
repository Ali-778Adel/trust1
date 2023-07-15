import 'package:fl_egypt_trust/data/services/fawry_payment_service.dart';
import 'package:fl_egypt_trust/models/utils/themes/colors.dart';
import 'package:fl_egypt_trust/ui/screens/main/payment/bloc/payment_registeration_bloc/states.dart';
import 'package:fl_egypt_trust/ui/screens/main/payment/screens/follow_order_screen.dart';
import 'package:fl_egypt_trust/ui/screens/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:oktoast/oktoast.dart';
import 'package:sizer/sizer.dart';
import '../../../../../di/dependency_injection.dart';
import '../../../../../models/utils/themes/app_general_trans.dart';
import '../../../widgets/cutom_buttons.dart';
import '../../../widgets/toast_widget.dart';
import '../bloc/fawry_bloc/bloc.dart';
import '../bloc/fawry_bloc/bloc_events.dart';
import '../bloc/fawry_bloc/bloc_states.dart';
import '../bloc/payment_registeration_bloc/bloc.dart';

class PaymentSummaryScreenTest extends StatefulWidget {
  const PaymentSummaryScreenTest({Key? key}) : super(key: key);

  @override
  State<PaymentSummaryScreenTest> createState() => _PaymentSummaryScreen();
}

class _PaymentSummaryScreen extends State<PaymentSummaryScreenTest> {
  bool rulesCheckBox = false;
  @override
  void initState() {
    super.initState();
    sl<FarwryPaymentService>().initSDKCallback(context);
  }

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as FollowOrderArgs;
    return Scaffold(
      appBar: CustomAppBar(context: context).call(),
      body: BlocListener<FawryBloc, FawryStates>(
        listener: (context, state) {
          debugPrint(' i am in side listener _+++++++++++_+_+_+_+_+_+_');
          if (state is FawryCallBackState) {
            switch (state.paymentProcessStatus) {
              case PaymentProcessStatus.error:
                {
                  showToastWidget(CustomToastWidget(
                    toastStatus: ToastStatus.error,
                    toastContent: state.message,
                  ));
                }
                break;
              case PaymentProcessStatus.loading:
                {
                  showDialog(
                      context: context,
                      builder: (context) => const Center(
                            child: CircularProgressIndicator(),
                          ));
                }
                break;
              case PaymentProcessStatus.success:
                {
                  debugPrint(
                      'successssssss*******************************************************');
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Scaffold(
                          appBar: CustomAppBar(context: context).call(),
                          body: Column(
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(16.0),
                                child: RichText(
                              textScaleFactor: 1.2,
                              text: TextSpan(children: [
                                TextSpan(
                                    text:
                                        '${AppGeneralTrans.waitFawryConfirmationTxt} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium),
                                TextSpan(
                                    text: '\n ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium),
                                TextSpan(
                                    text:
                                        '${AppGeneralTrans.refNumberValidationTxt} ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Palette.mainBlue)),
                                TextSpan(
                                    text: '\n ',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium),
                                TextSpan(
                                    text: AppGeneralTrans.refNumTxt,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium),
                                TextSpan(
                                    text:
                                        '${state.response!['referenceNumber']}',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(
                                            fontWeight: FontWeight.w600,
                                            color: Palette.mainBlue))
                              ]),
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const FollowOrderScreen()),
                                      (route) => false);
                                },
                                style: ButtonStyle(
                                    minimumSize: MaterialStateProperty.all<Size>(
                                        Size(40.sp, 30.sp)),
                                    backgroundColor: MaterialStateProperty.all<Color>(
                                        Palette.mainGreen),
                                    foregroundColor:
                                        MaterialStateProperty.all<Color>(
                                            Colors.white),
                                    shape: MaterialStateProperty.all<
                                            RoundedRectangleBorder>(
                                        RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25.0),
                                            side: BorderSide(
                                                color: Palette.mainGreen)))),
                                child: Text(
                                  AppGeneralTrans.followOrderBackTxt,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyLarge!
                                      .copyWith(color: Palette.white),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      (route) => false);
                }
                break;
              case PaymentProcessStatus.completed:
                {
                  showDialog(
                      context: context,
                      builder: (context) => Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children:const [
                              CircularProgressIndicator(),
                              Text('please wait ...')
                            ],
                          ));
                  showToastWidget(
                      const CustomToastWidget(
                          toastStatus: ToastStatus.success,
                          toastContent: 'completed...'),
                      position: ToastPosition.bottom);
                }
                break;
              default:
                {}
            }
          } else if (state is FawryInitState) {
            showToastWidget(const CustomToastWidget(
              toastStatus: ToastStatus.warning,
              toastContent: 'please wait....',
            ));
          } else if (state is FawryInitiateStates) {
            showToastWidget(const CustomToastWidget(
              toastStatus: ToastStatus.warning,
              toastContent: 'please wait....',
            ));
          }
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(vertical: 24.sp, horizontal: 16.sp),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///company or person field

              SizedBox(
                height: 16.sp,
              ),

              /// rules field
              Row(
                children:  [
                  Expanded(
                      child: Text(
                          AppGeneralTrans.generalNoteTxt)),
                ],
              ),
              SizedBox(
                height: 24.sp,
              ),

              /// check rules field
              Row(
                children: [
                  Expanded(
                      child: _buildTitleValue(
                          context: context,
                          value:
                          AppGeneralTrans.generalRulesAgreement)),
                  Checkbox(
                      value: rulesCheckBox,
                      onChanged: (val) {
                        setState(() {
                          rulesCheckBox = val!;
                        });
                      })
                ],
              ),
              SizedBox(
                height: 24.sp,
              ),

              ///next pervious buttons
              Row(
                children: [
                  Expanded(
                    child: CustomMediumButton(
                      buttonText: AppGeneralTrans.perviousButtomTxt,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  Expanded(
                    child: BlocBuilder<PaymentRegistrationBloc,
                            PaymentRegistrationStates>(
                        builder: (context, snapshot) {
                      return CustomMediumButton(
                        buttonText: AppGeneralTrans.nextButtomTxt,
                        onTap: () async {
                          if (rulesCheckBox) {
                            BlocProvider.of<FawryBloc>(context).add(
                                InitiateFawryPaymentEvent(
                                    price: args.total!,
                                    userRefNumber: args.userRefNumber!,
                                    customerMobile: args.customerMobile!,
                                    customerMail: args.customerMail!,
                                    merchantRefNumber:
                                        args.merchantRefNumber!));
                          } else {
                            showToastWidget(
                                 CustomToastWidget(
                                  toastStatus: ToastStatus.error,
                                  toastContent:
                                      AppGeneralTrans.generalPaymentRulesAgreement,
                                ),
                                position: ToastPosition.bottom);
                          }
                        },
                      );
                    }),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }



  Widget _buildTitleValue(
      {required BuildContext context, required String value}) {
    return Text(
      value,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(color: Palette.mainBlue, fontWeight: FontWeight.w500),
    );
  }
}
