// ignore_for_file: avoid_web_libraries_in_flutter

library model;

import 'dart:convert';
import "dart:math";
import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:random_names_extension/bin/bin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:random_names_extension/model/schema/categories/categories.dart';

part 'app/app.dart';
part 'app/shared_prefs.dart';
part 'constants.dart';
part 'panel_settings.dart';
part 'schema/name.dart';
part 'schema/saved_name.dart';
part 'string_extension.dart';
part 'schema/categories/toggle_enums.dart';
part 'schema/categories/subcategory.dart';
