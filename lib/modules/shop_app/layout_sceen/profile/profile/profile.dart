// modules/shop_app/layout_sceen/profile/profile/profile.dart
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/homeScreen/Cubit/states.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/Cubit/cubit.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/profile/Cubit/states.dart';
import 'package:shop_appp/modules/shop_app/layout_sceen/profile/edit_profile/Edit_profile.dart';
import 'package:shop_appp/shared/componentes/components.dart';

class PrfileScreen extends StatefulWidget {
  @override
  State<PrfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<PrfileScreen> {
  @override
  void initState() {
    super.initState();
    if (ShopLayoutCubit.get(context).currentIndex == 3) {
      ProfileCubit.get(context).getUserData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileStates>(
      listener: (context, state) {},
      builder: (context, state) {
        //*********************** */ Get user model
        var userModel = ProfileCubit.get(context).model;

        return ConditionalBuilder(
          condition: state is ProfileSuccessState,
          //*********************** */ Builder
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.black,
              //*********************** */ Body
              body: Container(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(height: 80.0),
                      // * My Profile
                      Text(
                        'My Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 25.0),
                      // * Profile
                      MaterialButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:  (context) => BlocProvider.value(
                                    value: ProfileCubit.get(context,), // نفس الكيوبت الحالي
                                    child: EditProfile(
                                      photo: userModel!.photo,
                                      Fullname: userModel!.name,
                                      phone: userModel!.phone,
                                      emailaddress: userModel!.emailaddress,
                                      password: userModel!.password,
                                    ),
                                  ),
                            ),
                          );

                        },
                        child: Container(
                          width: double.infinity,
                          height: 115.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7.0),
                            color: Colors.pinkAccent,
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black,
                                blurRadius: 15,
                                offset: Offset(0, 3),
                              ),
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Row(
                              children: [
                                SizedBox(width: 15.0),
                                CircleAvatar(
                                  radius: 35,
                                  backgroundImage: NetworkImage(
                                    '${userModel?.photo}',
                                  ),
                                ),
                                SizedBox(width: 5.0),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 10.0,
                                    top: 15.0,
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      SizedBox(height: 3.0),
                                      Text(
                                        '${userModel?.name}',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.5,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 10.0),
                                      Text(
                                        'From El-Mahalla',
                                        style: TextStyle(
                                          color: Colors.white54,
                                          fontSize: 13.5,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                Spacer(),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.edit_outlined,
                                    color: Colors.white,
                                    size: 25,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      // * SIZEBOX
                      SizedBox(height: 20.0),
                      // * Others Items
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            buildSettingsItem(
                              iconn: Icons.dark_mode_outlined,
                              title: 'Dark Mode',
                              subtitle: 'Switch mode',
                            ),
                            SizedBox(height: 5.0),
                            buildSettingsItem(
                              iconn: Icons.language,
                              title: 'Language',
                              subtitle: 'Change application language',
                            ),
                            SizedBox(height: 5.0),
                            buildSettingsItem(
                              iconn: Icons.exit_to_app_rounded,
                              title: 'Log Out',
                              subtitle: 'Logout your account',
                            ),
                          ],
                        ),
                      ),
                      // * SIZEBOX
                      SizedBox(height: 20.0),
                      // * Others Text
                      Text(
                        'Others',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      // * SiZEBOX
                      SizedBox(height: 20.0),
                      // * Others Items
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            buildSettingsItem(
                              iconn: Icons.support_agent,
                              title: 'Support and assistance',
                              subtitle: 'For support click here',
                            ),
                            SizedBox(height: 5.0),
                            buildSettingsItem(
                              iconn: Icons.language,
                              title: 'About the application',
                              subtitle: 'Information about the application',
                            ),
                            SizedBox(height: 5.0),
                          ],
                        ),
                      ),
                      SizedBox(height: 20.0),
                    ],
                  ),
                ),
              ),
            );
          },
          fallback: (context) => Center(child: CircularProgressIndicator()),
        );
      },
    );
  }
}

//************************************** */ Other settings
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
              SizedBox(height: 5.0),
              Text(
                subtitle,
                style: TextStyle(color: Colors.white54, fontSize: 13.5),
              ),
            ],
          ),
        ),

        // السهم
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_forward_ios, color: Colors.white, size: 17),
        ),
      ],
    ),
  );
}
