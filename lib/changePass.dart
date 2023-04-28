import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:lucky13capstone/classifier/lego_recognizer.dart';
import 'package:lucky13capstone/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:lucky13capstone/settings_model.dart';
import 'package:provider/provider.dart';

// This class represents the login page of the app.
class ChangePass extends StatefulWidget {
  // The LoginPage constructor.
  const ChangePass({Key? key}) : super(key: key);

  // This method creates the state for the LoginPage.
  @override
  State<ChangePass> createState() => _ChangePassState();
}

class _ChangePassState extends State<ChangePass> {
  final oldPassController = TextEditingController();
  final newPassController = TextEditingController();
  final reEnterPassController = TextEditingController();

  bool passenable = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}
