
import 'package:fl_egypt_trust/models/bloc/appointment/appointment_cubit.dart';
import 'package:fl_egypt_trust/models/bloc/appointment/appointment_cubit_state.dart';
import 'package:fl_egypt_trust/models/bloc/certification/certification_cubit.dart';
import 'package:fl_egypt_trust/models/bloc/certification/certification_cubit_state.dart';

import 'package:fl_egypt_trust/models/entities/public_entities/document_model.dart';
import 'package:fl_egypt_trust/models/utils/language/localizations_delegate.dart';
import 'package:fl_egypt_trust/models/utils/themes/ui_constants.dart';
import 'package:fl_egypt_trust/ui/screens/main/home/subs/appointments/screen_book_appointment.dart';
import 'package:fl_egypt_trust/ui/screens/main/home/subs/certifications/certification_documents.dart';
import 'package:fl_egypt_trust/ui/screens/main/home/subs/certifications/screen_certification.dart';
import 'package:fl_egypt_trust/ui/screens/widgets/bottom_message_notification.dart';
import 'package:fl_egypt_trust/ui/screens/widgets/row_dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../models/utils/themes/app_general_trans.dart';
import '../../../../../../models/utils/themes/colors.dart';
import '../../../../widgets/custom_app_bar.dart';
import '../../../redesign_home/pages/new_home_screen.dart';


class ScreenOrderInquiry extends StatefulWidget {


  const ScreenOrderInquiry({Key? key}) : super(key: key);

  @override
  _StateScreenOrderInquiry createState() => _StateScreenOrderInquiry();
}

class _StateScreenOrderInquiry extends State<ScreenOrderInquiry> {
  static const double _verticalInputPadding = 10;

  final _nationalIdController = TextEditingController();


  String? _errorNational;


  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as HomeScreenArgs;


    // TODO: implement build
    return Scaffold(
      appBar:CustomAppBar(context:context,pageTitle:args.ordersQueryTxt,onPop: ()=>Navigator.pop(context)).call(),
      body: BlocBuilder<CertificationCubit, CertificationCubitState>(
          builder: (context, state) {
          return IgnorePointer(
            ignoring: state.isSearchLoading == true,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: [

                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Text(
                        AppGeneralTrans.orderInquiryMessage,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.bodyText1?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: UiConstants.colorTitle
                        ),

                      ),
                    ),


                    Padding(
                      padding:
                      const EdgeInsets.only(top: _verticalInputPadding),
                      child: TextFormField(
                        onChanged: (value) {
                          setState(() {
                            _errorNational = null;
                            state.searchFailMessage = null;
                          });
                        },
                        style: Theme.of(context).textTheme.bodyMedium,
                        controller: _nationalIdController,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.done,
                        maxLength: 14,
                        decoration: InputDecoration(
                          errorMaxLines: 3,
                          errorText: _errorNational ?? state.searchFailMessage,
                          labelText: AppGeneralTrans.nationalId,
                          fillColor: UiConstants.colorTextFieldFill,
                          filled: true,
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                                width: 2,
                                color: UiConstants
                                    .colorTextFieldEnabledUnderline),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16),
                      child: Center(
                        child: TextButton(
                          onPressed: state.isSearchLoading == true
                              ? null
                              : ()async{
                            if((await _validate()) == false) return;
                            _search();
                          },
                          child: state.isSearchLoading == true
                              ? const SizedBox(width: 35 , height: 35 ,child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white)))
                              : Text(AppGeneralTrans.search.toUpperCase(),style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Palette.white),),
                          style: ButtonStyle(
                              minimumSize: MaterialStateProperty.all<Size>(
                                  Size(state.isSearchLoading == true ? 45 : double.infinity, 45)),

                              backgroundColor: MaterialStateProperty.all<Color>(
                                  Palette.mainGreen),
                              foregroundColor:
                              MaterialStateProperty.all<Color>(Colors.white),
                              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(25.0),
                                      side:  BorderSide(
                                          color: Palette.mainGreen)))),
                        ),
                      ),
                    )

                  ],
                )
              ),
            ),
          );
        }
      ),
    );
  }





  Future<bool> _validate()  async{


    _errorNational = _nationalIdController.text.isEmpty == true
        ? AppGeneralTrans.errorEnterNationalId
        : (_nationalIdController.text.length < 14
            ? AppGeneralTrans.errorEnterCorrectNationalId
            : null);



    setState(() {});
    return _errorNational == null;
  }

  _search()async{
    FocusScope.of(context).requestFocus(FocusNode());
    await context.read<CertificationCubit>().search(
      natId: _nationalIdController.text,
    );

    var state = context.read<CertificationCubit>().state;
    if(state.orderModel != null){

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>  ScreenCertification(orderModel: state.orderModel,),
            settings: RouteSettings(
              arguments: HomeScreenArgs(issauanceCiretificationTxt: "تعديل الشهادة")
            )),
      );
    }

  }




}
