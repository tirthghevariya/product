import 'package:flutter/material.dart';
import 'package:product/utils/color_utils.dart';

const textInputDecoration = InputDecoration(
  labelStyle: TextStyle(color: ColorUtils.black, fontWeight: FontWeight.w300),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorUtils.dartPurple,
      width: 2,
    ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: ColorUtils.normalred, width: 2),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: ColorUtils.dartPurple,
      width: 2,
    ),
  ),
);
