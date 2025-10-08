// modules/shop_app/layout_sceen/profile/edit_profile/Edit_profile.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/Cubit/states.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/profile.dart';
import 'package:shop_appp/shared/componentes/components.dart';

class EditProfile extends StatelessWidget {
  final String photo;
  final String Fullname;
  final String phone;
  final String emailaddress;
  final String password;

  EditProfile({required this.photo, required this.Fullname, required this.phone, required this.emailaddress, required this.password});


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {    },
    
      builder: (context, state) {
     
      return ConditionalBuilder(
        condition: state is ProfileSuccessState, 
        builder: (context) 
        {
          return Scaffold(
          appBar: AppBar(  
            backgroundColor: Colors.black,
            leading: default_Text_Icon(
              Functionnn: () {
              Navigator.pop(context);
              },),
            title: Text('Profile',
            style: TextStyle(color: Colors.white, fontSize: 25.0),),
          ),

          body: Container(
            decoration: BoxDecoration(
              color: Colors.black
            ),
    
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.0,),
                  // * PHOTO
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage('${photo}'),
                  ),
                  // * SIZEBOX
                  SizedBox(height: 15.0,),
                  // * Change Photo
                  Text('Change Photo', style: TextStyle(color: Colors.white, fontSize:  16.0, fontWeight: FontWeight.bold),),
                  // * SIZEBOX
                  SizedBox(height: 50.0,),
                  // * Name
                  buildSettingsItem(
                    iconn: Icons.person, 
                    title: "Your name", 
                    subtitle: "${Fullname}",
                  ),
                  // * SIZEBOX
                  SizedBox(height: 25.0,),
                  // * Phone
                  buildSettingsItem(
                    iconn: Icons.phone, 
                    title: "Phone Number", 
                    subtitle: "${phone}",
                  ),
                  // * SIZEBOX
                  SizedBox(height: 25.0,),
                  // * Email Address
                  buildSettingsItem(
                    iconn: Icons.email_outlined, 
                    title: "Email Address", 
                    subtitle: "${emailaddress}",
                  ),
                  // * SIZEBOX
                  SizedBox(height: 25.0,),
                  // * Password
                  buildSettingsItem(
                    iconn: Icons.password, 
                    title: "Change Password", 
                    subtitle: "**********",
                  ),
                  SizedBox(height: 25.0,),
                  
                ],
              ),
            ),
          ),
        );
        }, 
        fallback: (context) => Center(child: CircularProgressIndicator(),));
      },
    );
  }
}


//************************************** */ Other items
Widget buildSettingsItem({
  required IconData iconn,
  required String title,
  required String subtitle,
}) {
  return Padding(
    padding: const EdgeInsets.all(7.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 5.0),
        Icon(iconn, size: 25, color: Colors.white),
        SizedBox(width: 15),

        // النصوص
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 3.0),
              Text(
                subtitle,
                style: TextStyle(
                  color: Colors.white54,
                  fontSize: 13.5,
                ),
              ),
            ],
          ),
        ),
      ],
    ),
  );
}