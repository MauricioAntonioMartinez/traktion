import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tracktion/bloc/auth/auth_cubit.dart';
import 'package:tracktion/screens/index.dart';
import 'package:tracktion/screens/routine/routine-main-screen.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: BlocBuilder<AuthCubit, AuthState>(builder: (context, state) {
        var name = "";
        var email = "";
        var photoUrl = "";
        if (state is AuthSuccess) {
          name = state.user.displayName;
          photoUrl = state.user.photoURL;
          email = state.user.email;
        }

        return ListView(
          padding: EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              arrowColor: Colors.black,
              accountEmail: Text(email),
              accountName: Text(name),
              decoration: BoxDecoration(color: Colors.black),
              currentAccountPicture:  CircleAvatar(
                  backgroundImage: NetworkImage(photoUrl),
                  backgroundColor: Colors.transparent,
                  
                ),
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.home),
              title: Text("Home"),
              onTap: () {
                print("Home Clicked");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MainScreen()),
                );
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.running),
              title: Text("Exercises"),
              onTap: () {
                print("Categories Clicked");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => BodyPartsScreen()),
                );
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.dumbbell,
                size: 20,
              ),
              title: Text("Workouts"),
              onTap: () {
                print("Categories Clicked");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WorkOutScreen()),
                );
              },
            ),
            ListTile(
              leading: FaIcon(
                FontAwesomeIcons.blog,
                size: 20,
              ),
              title: Text("Routines"),
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => RoutineMainScreen()),
                );
              },
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.userAlt),
              title: Text("Profile"),
              onTap: () {
                print("Categories Clicked");
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => WorkOutScreen()),
                );
              },
            ),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.signOutAlt),
                title: Text("LogOut"),
                onTap: () => BlocProvider.of<AuthCubit>(context).logut()),
          ],
        );
      }),
    );
  }
}
