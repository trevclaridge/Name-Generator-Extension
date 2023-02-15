// ignore_for_file: avoid_web_libraries_in_flutter

library model;

import 'dart:convert';
import 'dart:math';

import 'package:enum_to_string/enum_to_string.dart';
import 'package:flutter/material.dart';
import 'package:random_names_extension/view/view.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:random_names_extension/model/schema/categories/categories_package.dart';
import 'package:intl/intl.dart';

part 'app/app.dart';
part 'app/shared_prefs.dart';
part 'constants.dart';
part 'panel_settings.dart';
part 'list_extension_random_element.dart';
part 'schema/name.dart';
part 'schema/saved_name.dart';
part 'string_extension_capitalize.dart';
part 'schema/category.dart';
part 'schema/categories/categories.dart';
part 'schema/categories/gender_enum.dart';
part 'schema/categories/subcategory.dart';
part 'app/user_settings.dart';
