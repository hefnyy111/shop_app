// shared/componentes/components.dart
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_appp/shared/network/end_points.dart';



Widget defaultTextForm({
  required String text,
  Widget? iconPrefix,
  IconData? iconSuffix,
  required TextEditingController? control,
  required validatee,
  bool? obscureText,
  VoidCallback? Functionn,
  onTap,
  TextInputType? keyboard,
  bool readOnly = false,
  String? Placeholder,
}) => TextFormField(
  controller: control,
  validator: validatee,
  readOnly: readOnly,
  keyboardType: keyboard,
  onTap: onTap,
  obscureText: obscureText ?? false,
  style: TextStyle(color: Colors.white),
  cursorColor: Colors.white,
  
  decoration: InputDecoration(
    label: Text(text, style: TextStyle(color: Colors.white),),
    labelStyle: TextStyle(color: Colors.white),
    prefixIcon:
        iconPrefix != null ? iconPrefix : null ,
    suffixIcon:
        iconSuffix != null? IconButton(
              onPressed: Functionn,
              icon: Icon(iconSuffix),
              color: Colors.grey,
            )
            : null,
  ),
);

Widget defaultButton({
  required VoidCallback Functionn,
  required String texxt,
  IconData? iconn,
}) => Container(
  width: double.infinity,
  decoration: BoxDecoration(color: Colors.pinkAccent),
  child: MaterialButton(
    onPressed: Functionn,
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          texxt,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.white,
          ),
        ),

        if (iconn != null) ...
        [
          Icon(iconn, color: Colors.white, size: 25.0)
        ],
      ],
    ),
  ),
);

Future defaultMessageInfo({
  required context,
  DialogType? type,
  required String title,
  required String body,
  required String ButtonName,
  required IconData Iconn,
  VoidCallback? Functionnn,
}) =>
    AwesomeDialog(
      context: context,
      dialogType: type != null ? type : DialogType.noHeader,
      dialogBackgroundColor: Colors.black,
      animType: AnimType.rightSlide, // حركة دخول الرسالة
      title: title,
      body: Center(
        child: Text(
          body,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      btnOkText: ButtonName,
      btnOkOnPress: Functionnn,
      btnOkColor: Colors.pink,
      btnCancelColor: Colors.white,
      customHeader: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(color: Colors.pink, shape: BoxShape.circle),
        child: Icon(Iconn, size: 50.0, color: Colors.white),
      ),
    ).show();
//**************************** */
void navigatorTo(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}
//**************************** */
void navigateAndFinish(context, Widget) => Navigator.pushAndRemoveUntil(
  context,
  MaterialPageRoute(builder: (context) => Widget),
  (Route<dynamic> route) => false,
);

//**************************** *//
Widget Text_layout({
required String title,
}) => 
Text(title, 
style: TextStyle(
  color: Colors.white,
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
),);

//**************************** */

Widget default_Text_Icon({
required VoidCallback Functionnn,

}) => IconButton(onPressed: Functionnn, icon: Icon(Icons.arrow_back_ios_new , color: Colors.white, size: 22.0,));