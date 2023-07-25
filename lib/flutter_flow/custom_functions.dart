import 'dart:convert';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'lat_lng.dart';
import 'place.dart';
import 'uploaded_file.dart';
import '/backend/backend.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '/auth/firebase_auth/auth_util.dart';

int? numberofdays(
  DateTime? startdate,
  DateTime? enddate,
) {
  // calculating number of days from startdate and enddate
  if (startdate == null || enddate == null) {
    return null;
  }
  final difference = enddate.difference(startdate);
  return difference.inDays + 1;
}

double? subtotal(
  int? numberofdays,
  double? costperday,
) {
  // calculating subtotal given number of days and cost per day
  if (numberofdays == null || costperday == null) {
    return null;
  }
  return numberofdays * costperday;
}

double? totalcost(
  double? subtotal,
  double? tax,
) {
  // calculat total cost given the subtotal and tax which a percentage of the subtotal
// calculating total cost given subtotal and tax percentage
  if (subtotal == null || tax == null) {
    return null;
  }
  return subtotal + (subtotal * tax / 100);
}

int? daystoseconds(int? numberofdays) {
  // function to convert number of days into milliseconds
// function to convert number of days into milliseconds
  if (numberofdays == null) {
    return null;
  }
  return numberofdays * 24 * 60 * 60 * 1000;
}
