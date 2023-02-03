import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({super.key, required this.userName});
  String userName;
  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // ignore: prefer_const_constructors
              Text(
                'Profile Name:',
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                ),
              ),
              Text(
                widget.userName,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
