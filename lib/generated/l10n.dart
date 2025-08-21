// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Home`
  String get home {
    return Intl.message(
      'Home',
      name: 'home',
      desc: 'home_screen , bottom_navigation_bar_screen',
      args: [],
    );
  }

  /// `Search`
  String get search {
    return Intl.message(
      'Search',
      name: 'search',
      desc:
          'home_screen , appointments_screen , departments_screen , bills_screen , department_doctors_screen , ',
      args: [],
    );
  }

  /// `Latest Offers`
  String get latest_offers {
    return Intl.message(
      'Latest Offers',
      name: 'latest_offers',
      desc: '',
      args: [],
    );
  }

  /// `See More`
  String get see_more {
    return Intl.message('See More', name: 'see_more', desc: '', args: []);
  }

  /// `Most Rated`
  String get most_rated {
    return Intl.message('Most Rated', name: 'most_rated', desc: '', args: []);
  }

  /// `Discover Your Wellbeing`
  String get card_title {
    return Intl.message(
      'Discover Your Wellbeing',
      name: 'card_title',
      desc: '',
      args: [],
    );
  }

  /// `Your path to better health starts here!`
  String get card_subtitle {
    return Intl.message(
      'Your path to better health starts here!',
      name: 'card_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Services`
  String get services {
    return Intl.message('Services', name: 'services', desc: '', args: []);
  }

  /// `Book Now`
  String get book_now {
    return Intl.message('Book Now', name: 'book_now', desc: '', args: []);
  }

  /// `Find The Best Doctors In Syria`
  String get book_now_subtitle {
    return Intl.message(
      'Find The Best Doctors In Syria',
      name: 'book_now_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Prescriptions`
  String get prescriptions {
    return Intl.message(
      'Prescriptions',
      name: 'prescriptions',
      desc: '',
      args: [],
    );
  }

  /// `Your Medications, Treatment & Drugs`
  String get prescriptions_subtitle {
    return Intl.message(
      'Your Medications, Treatment & Drugs',
      name: 'prescriptions_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Lab Tests`
  String get lab_tests {
    return Intl.message('Lab Tests', name: 'lab_tests', desc: '', args: []);
  }

  /// `All Required Laboratory Tests`
  String get lab_tests_subtitle {
    return Intl.message(
      'All Required Laboratory Tests',
      name: 'lab_tests_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Medical Reports`
  String get medical_reports {
    return Intl.message(
      'Medical Reports',
      name: 'medical_reports',
      desc: '',
      args: [],
    );
  }

  /// `All Your Medical Reports in One Place`
  String get medical_reports_subtitle {
    return Intl.message(
      'All Your Medical Reports in One Place',
      name: 'medical_reports_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Appointments`
  String get appointments {
    return Intl.message(
      'Appointments',
      name: 'appointments',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get all {
    return Intl.message('All', name: 'all', desc: '', args: []);
  }

  /// `Pending`
  String get pending {
    return Intl.message('Pending', name: 'pending', desc: '', args: []);
  }

  /// `Completed`
  String get completed {
    return Intl.message('Completed', name: 'completed', desc: '', args: []);
  }

  /// `Check-Up`
  String get check_up {
    return Intl.message('Check-Up', name: 'check_up', desc: '', args: []);
  }

  /// `Follow-Up`
  String get follow_up {
    return Intl.message('Follow-Up', name: 'follow_up', desc: '', args: []);
  }

  /// `With Report`
  String get with_report {
    return Intl.message('With Report', name: 'with_report', desc: '', args: []);
  }

  /// `Without Report`
  String get without_report {
    return Intl.message(
      'Without Report',
      name: 'without_report',
      desc: '',
      args: [],
    );
  }

  /// `Departments`
  String get departments {
    return Intl.message('Departments', name: 'departments', desc: '', args: []);
  }

  /// `Morning Dr`
  String get morning_doctor {
    return Intl.message(
      'Morning Dr',
      name: 'morning_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Afternoon Dr`
  String get afternoon_doctor {
    return Intl.message(
      'Afternoon Dr',
      name: 'afternoon_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Bills`
  String get bills {
    return Intl.message('Bills', name: 'bills', desc: '', args: []);
  }

  /// `Paid`
  String get paid {
    return Intl.message('Paid', name: 'paid', desc: '', args: []);
  }

  /// `Unpaid`
  String get unpaid {
    return Intl.message('Unpaid', name: 'unpaid', desc: '', args: []);
  }

  /// `Total Amount`
  String get total_amount {
    return Intl.message(
      'Total Amount',
      name: 'total_amount',
      desc: '',
      args: [],
    );
  }

  /// `Doctor`
  String get doctor {
    return Intl.message('Doctor', name: 'doctor', desc: '', args: []);
  }

  /// `Department`
  String get department {
    return Intl.message('Department', name: 'department', desc: '', args: []);
  }

  /// `Appointment Date`
  String get appointment_date {
    return Intl.message(
      'Appointment Date',
      name: 'appointment_date',
      desc: '',
      args: [],
    );
  }

  /// `Appointment Time`
  String get appointment_time {
    return Intl.message(
      'Appointment Time',
      name: 'appointment_time',
      desc: '',
      args: [],
    );
  }

  /// `Bill Details`
  String get bill_details {
    return Intl.message(
      'Bill Details',
      name: 'bill_details',
      desc: '',
      args: [],
    );
  }

  /// `Treatments`
  String get treatments_title {
    return Intl.message(
      'Treatments',
      name: 'treatments_title',
      desc: '',
      args: [],
    );
  }

  /// `treatment`
  String get treatment_unit {
    return Intl.message(
      'treatment',
      name: 'treatment_unit',
      desc: '',
      args: [],
    );
  }

  /// `treatments`
  String get treatments_unit {
    return Intl.message(
      'treatments',
      name: 'treatments_unit',
      desc: '',
      args: [],
    );
  }

  /// `Experience`
  String get experiences_title {
    return Intl.message(
      'Experience',
      name: 'experiences_title',
      desc: '',
      args: [],
    );
  }

  /// `year`
  String get year_unit {
    return Intl.message('year', name: 'year_unit', desc: '', args: []);
  }

  /// `years`
  String get years_unit {
    return Intl.message('years', name: 'years_unit', desc: '', args: []);
  }

  /// `Morning`
  String get morning {
    return Intl.message('Morning', name: 'morning', desc: '', args: []);
  }

  /// `Afternoon`
  String get afternoon {
    return Intl.message('Afternoon', name: 'afternoon', desc: '', args: []);
  }

  /// `About Doctor`
  String get about_doctor {
    return Intl.message(
      'About Doctor',
      name: 'about_doctor',
      desc: '',
      args: [],
    );
  }

  /// `Qualifications`
  String get qualifications {
    return Intl.message(
      'Qualifications',
      name: 'qualifications',
      desc: '',
      args: [],
    );
  }

  /// `Offers`
  String get offers {
    return Intl.message('Offers', name: 'offers', desc: '', args: []);
  }

  /// `Well done! here's your total point balance`
  String get points_title {
    return Intl.message(
      'Well done! here\'s your total point balance',
      name: 'points_title',
      desc: '',
      args: [],
    );
  }

  /// `point`
  String get point_unit {
    return Intl.message('point', name: 'point_unit', desc: '', args: []);
  }

  /// `points`
  String get points_unit {
    return Intl.message('points', name: 'points_unit', desc: '', args: []);
  }

  /// `Book Appointment`
  String get book_appointment {
    return Intl.message(
      'Book Appointment',
      name: 'book_appointment',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Type`
  String get reservation_type {
    return Intl.message(
      'Reservation Type',
      name: 'reservation_type',
      desc: '',
      args: [],
    );
  }

  /// `Days`
  String get days {
    return Intl.message('Days', name: 'days', desc: '', args: []);
  }

  /// `Morning Times`
  String get morning_times {
    return Intl.message(
      'Morning Times',
      name: 'morning_times',
      desc: '',
      args: [],
    );
  }

  /// `Afternoon Times`
  String get afternoon_times {
    return Intl.message(
      'Afternoon Times',
      name: 'afternoon_times',
      desc: '',
      args: [],
    );
  }

  /// `More`
  String get more {
    return Intl.message('More', name: 'more', desc: '', args: []);
  }

  /// `Less`
  String get less {
    return Intl.message('Less', name: 'less', desc: '', args: []);
  }

  /// `Do you need a medical report`
  String get need_medical_report {
    return Intl.message(
      'Do you need a medical report',
      name: 'need_medical_report',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message('Confirm', name: 'confirm', desc: '', args: []);
  }

  /// `Reservation Info`
  String get reservation_info {
    return Intl.message(
      'Reservation Info',
      name: 'reservation_info',
      desc: '',
      args: [],
    );
  }

  /// `Times`
  String get times {
    return Intl.message('Times', name: 'times', desc: '', args: []);
  }

  /// `Specialty`
  String get specialty {
    return Intl.message('Specialty', name: 'specialty', desc: '', args: []);
  }

  /// `Notifications`
  String get notifications {
    return Intl.message(
      'Notifications',
      name: 'notifications',
      desc: '',
      args: [],
    );
  }

  /// `Manage Booking`
  String get manage_booking {
    return Intl.message(
      'Manage Booking',
      name: 'manage_booking',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Editing`
  String get editing {
    return Intl.message('Editing', name: 'editing', desc: '', args: []);
  }

  /// `cancel`
  String get cancel {
    return Intl.message('cancel', name: 'cancel', desc: '', args: []);
  }

  /// `Prescription`
  String get prescription {
    return Intl.message(
      'Prescription',
      name: 'prescription',
      desc: '',
      args: [],
    );
  }

  /// `Medications`
  String get medications {
    return Intl.message('Medications', name: 'medications', desc: '', args: []);
  }

  /// `Surgeries`
  String get surgeries {
    return Intl.message('Surgeries', name: 'surgeries', desc: '', args: []);
  }

  /// `Advices`
  String get advices {
    return Intl.message('Advices', name: 'advices', desc: '', args: []);
  }

  /// `View Medical Report`
  String get view_medical_report {
    return Intl.message(
      'View Medical Report',
      name: 'view_medical_report',
      desc: '',
      args: [],
    );
  }

  /// `Medical Report`
  String get medical_report {
    return Intl.message(
      'Medical Report',
      name: 'medical_report',
      desc: '',
      args: [],
    );
  }

  /// `Reservation Price`
  String get reservation_price {
    return Intl.message(
      'Reservation Price',
      name: 'reservation_price',
      desc: '',
      args: [],
    );
  }

  /// `The total price for this reservation is`
  String get know_reservation_price {
    return Intl.message(
      'The total price for this reservation is',
      name: 'know_reservation_price',
      desc: '',
      args: [],
    );
  }

  /// `Do you want to continue with the booking?`
  String get need_booking {
    return Intl.message(
      'Do you want to continue with the booking?',
      name: 'need_booking',
      desc: '',
      args: [],
    );
  }

  /// `Keep going`
  String get keep_going {
    return Intl.message('Keep going', name: 'keep_going', desc: '', args: []);
  }

  /// `Oops`
  String get oops {
    return Intl.message('Oops', name: 'oops', desc: '', args: []);
  }

  /// `Ok`
  String get ok {
    return Intl.message('Ok', name: 'ok', desc: '', args: []);
  }

  /// `How was your visit with Dr.`
  String get need_opinion {
    return Intl.message(
      'How was your visit with Dr.',
      name: 'need_opinion',
      desc: '',
      args: [],
    );
  }

  /// `? You can leave a quick rating if you’d like.`
  String get need_rating {
    return Intl.message(
      '? You can leave a quick rating if you’d like.',
      name: 'need_rating',
      desc: '',
      args: [],
    );
  }

  /// `Share Rating`
  String get share_rating {
    return Intl.message(
      'Share Rating',
      name: 'share_rating',
      desc: '',
      args: [],
    );
  }

  /// `No, Thanks!`
  String get no_thanks {
    return Intl.message('No, Thanks!', name: 'no_thanks', desc: '', args: []);
  }

  /// `Login`
  String get login {
    return Intl.message('Login', name: 'login', desc: '', args: []);
  }

  /// `Welcom Back!`
  String get welcom_back {
    return Intl.message(
      'Welcom Back!',
      name: 'welcom_back',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email {
    return Intl.message('Email', name: 'email', desc: '', args: []);
  }

  /// `Password`
  String get password {
    return Intl.message('Password', name: 'password', desc: '', args: []);
  }

  /// `Forget Password ?`
  String get forget_password {
    return Intl.message(
      'Forget Password ?',
      name: 'forget_password',
      desc: '',
      args: [],
    );
  }

  /// `Continue as a guest`
  String get continue_as_a_guest {
    return Intl.message(
      'Continue as a guest',
      name: 'continue_as_a_guest',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account ?`
  String get dont_have_an_account {
    return Intl.message(
      'Don\'t have an account ?',
      name: 'dont_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up {
    return Intl.message('Sign up', name: 'sign_up', desc: '', args: []);
  }

  /// `Success`
  String get success {
    return Intl.message('Success', name: 'success', desc: '', args: []);
  }

  /// `Login Successfully`
  String get login_successfully {
    return Intl.message(
      'Login Successfully',
      name: 'login_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed`
  String get failed {
    return Intl.message('Failed', name: 'failed', desc: '', args: []);
  }

  /// `Login Failed`
  String get login_failed {
    return Intl.message(
      'Login Failed',
      name: 'login_failed',
      desc: '',
      args: [],
    );
  }

  /// `Glad to see you :)`
  String get glad_to_see_you {
    return Intl.message(
      'Glad to see you :)',
      name: 'glad_to_see_you',
      desc: '',
      args: [],
    );
  }

  /// `Verify`
  String get verify {
    return Intl.message('Verify', name: 'verify', desc: '', args: []);
  }

  /// `Do you have an account ?`
  String get do_you_have_an_account {
    return Intl.message(
      'Do you have an account ?',
      name: 'do_you_have_an_account',
      desc: '',
      args: [],
    );
  }

  /// `Verify code is sent Successfully`
  String get verify_code_is_sent_successfully {
    return Intl.message(
      'Verify code is sent Successfully',
      name: 'verify_code_is_sent_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed to send verify code`
  String get failed_to_send_verify_code {
    return Intl.message(
      'Failed to send verify code',
      name: 'failed_to_send_verify_code',
      desc: '',
      args: [],
    );
  }

  /// `OTP Verification`
  String get otp_verification {
    return Intl.message(
      'OTP Verification',
      name: 'otp_verification',
      desc: '',
      args: [],
    );
  }

  /// `We sent your code to`
  String get we_sent_your_code_to {
    return Intl.message(
      'We sent your code to',
      name: 'we_sent_your_code_to',
      desc: '',
      args: [],
    );
  }

  /// `\nThis code will expired in 05:00`
  String get this_code_will_expired_in {
    return Intl.message(
      '\nThis code will expired in 05:00',
      name: 'this_code_will_expired_in',
      desc: '',
      args: [],
    );
  }

  /// `Submit`
  String get submit {
    return Intl.message('Submit', name: 'submit', desc: '', args: []);
  }

  /// `Resend OTP Code`
  String get resend_otp_code {
    return Intl.message(
      'Resend OTP Code',
      name: 'resend_otp_code',
      desc: '',
      args: [],
    );
  }

  /// `Verification Success`
  String get verification_success {
    return Intl.message(
      'Verification Success',
      name: 'verification_success',
      desc: '',
      args: [],
    );
  }

  /// `Verification Failed`
  String get verification_failed {
    return Intl.message(
      'Verification Failed',
      name: 'verification_failed',
      desc: '',
      args: [],
    );
  }

  /// `Set your information`
  String get set_your_information {
    return Intl.message(
      'Set your information',
      name: 'set_your_information',
      desc: '',
      args: [],
    );
  }

  /// `First Name`
  String get first_name {
    return Intl.message('First Name', name: 'first_name', desc: '', args: []);
  }

  /// `Last Name`
  String get last_name {
    return Intl.message('Last Name', name: 'last_name', desc: '', args: []);
  }

  /// `Birthday Date`
  String get birthday_date {
    return Intl.message(
      'Birthday Date',
      name: 'birthday_date',
      desc: '',
      args: [],
    );
  }

  /// `Gender`
  String get gender {
    return Intl.message('Gender', name: 'gender', desc: '', args: []);
  }

  /// `Phone`
  String get phone {
    return Intl.message('Phone', name: 'phone', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password',
      desc: '',
      args: [],
    );
  }

  /// `Male`
  String get male {
    return Intl.message('Male', name: 'male', desc: '', args: []);
  }

  /// `Female`
  String get female {
    return Intl.message('Female', name: 'female', desc: '', args: []);
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `Gallery`
  String get gallery {
    return Intl.message('Gallery', name: 'gallery', desc: '', args: []);
  }

  /// `Sign Up Successfully`
  String get sign_up_successfully {
    return Intl.message(
      'Sign Up Successfully',
      name: 'sign_up_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed Sign Up`
  String get failed_sign_up {
    return Intl.message(
      'Failed Sign Up',
      name: 'failed_sign_up',
      desc: '',
      args: [],
    );
  }

  /// `Set Your Email`
  String get set_your_email {
    return Intl.message(
      'Set Your Email',
      name: 'set_your_email',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password`
  String get reset_password {
    return Intl.message(
      'Reset Password',
      name: 'reset_password',
      desc: '',
      args: [],
    );
  }

  /// `Reset`
  String get reset {
    return Intl.message('Reset', name: 'reset', desc: '', args: []);
  }

  /// `Reset Password Successfully`
  String get reset_password_successfully {
    return Intl.message(
      'Reset Password Successfully',
      name: 'reset_password_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Reset Password Failed`
  String get reset_password_failed {
    return Intl.message(
      'Reset Password Failed',
      name: 'reset_password_failed',
      desc: '',
      args: [],
    );
  }

  /// `Field is required!`
  String get field_is_required {
    return Intl.message(
      'Field is required!',
      name: 'field_is_required',
      desc: '',
      args: [],
    );
  }

  /// `Invalid email`
  String get invalid_email {
    return Intl.message(
      'Invalid email',
      name: 'invalid_email',
      desc: '',
      args: [],
    );
  }

  /// `Less than 10 numbers`
  String get less_than_10_numbers {
    return Intl.message(
      'Less than 10 numbers',
      name: 'less_than_10_numbers',
      desc: '',
      args: [],
    );
  }

  /// `Password must be 8 letters at least`
  String get password_must_be_8_letters_at_least {
    return Intl.message(
      'Password must be 8 letters at least',
      name: 'password_must_be_8_letters_at_least',
      desc: '',
      args: [],
    );
  }

  /// `The password don't match`
  String get the_password_dont_match {
    return Intl.message(
      'The password don\'t match',
      name: 'the_password_dont_match',
      desc: '',
      args: [],
    );
  }

  /// `Taking care of your health has never been this simple`
  String get onboarding_1 {
    return Intl.message(
      'Taking care of your health has never been this simple',
      name: 'onboarding_1',
      desc: '',
      args: [],
    );
  }

  /// `We’re here to make healthcare simple , so we have the best doctors available!`
  String get onboarding_2 {
    return Intl.message(
      'We’re here to make healthcare simple , so we have the best doctors available!',
      name: 'onboarding_2',
      desc: '',
      args: [],
    );
  }

  /// `Book your doctor’s visit in just a few taps`
  String get onboarding_3 {
    return Intl.message(
      'Book your doctor’s visit in just a few taps',
      name: 'onboarding_3',
      desc: '',
      args: [],
    );
  }

  /// `Skip`
  String get skip {
    return Intl.message('Skip', name: 'skip', desc: '', args: []);
  }

  /// `Get Started`
  String get get_started {
    return Intl.message('Get Started', name: 'get_started', desc: '', args: []);
  }

  /// `Profile`
  String get profile {
    return Intl.message('Profile', name: 'profile', desc: '', args: []);
  }

  /// `Vital signals`
  String get vital_signs {
    return Intl.message(
      'Vital signals',
      name: 'vital_signs',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `About Us`
  String get about_us {
    return Intl.message('About Us', name: 'about_us', desc: '', args: []);
  }

  /// `Logout`
  String get logout {
    return Intl.message('Logout', name: 'logout', desc: '', args: []);
  }

  /// `Login first to show your data`
  String get login_first_to_show_your_data {
    return Intl.message(
      'Login first to show your data',
      name: 'login_first_to_show_your_data',
      desc: '',
      args: [],
    );
  }

  /// `Data not found`
  String get data_not_found {
    return Intl.message(
      'Data not found',
      name: 'data_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Edit profile`
  String get edit_profile {
    return Intl.message(
      'Edit profile',
      name: 'edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Edit password`
  String get edit_password {
    return Intl.message(
      'Edit password',
      name: 'edit_password',
      desc: '',
      args: [],
    );
  }

  /// `change theme Dark / Light mode : `
  String get change_theme_Dark_Light_mode {
    return Intl.message(
      'change theme Dark / Light mode : ',
      name: 'change_theme_Dark_Light_mode',
      desc: '',
      args: [],
    );
  }

  /// `Light`
  String get light {
    return Intl.message('Light', name: 'light', desc: '', args: []);
  }

  /// `Dark`
  String get dark {
    return Intl.message('Dark', name: 'dark', desc: '', args: []);
  }

  /// `Logout Successfully`
  String get logout_successfully {
    return Intl.message(
      'Logout Successfully',
      name: 'logout_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed Logout`
  String get failed_logout {
    return Intl.message(
      'Failed Logout',
      name: 'failed_logout',
      desc: '',
      args: [],
    );
  }

  /// `Are you sure you want to logout ?!`
  String get are_you_sure_you_want_to_logout {
    return Intl.message(
      'Are you sure you want to logout ?!',
      name: 'are_you_sure_you_want_to_logout',
      desc: '',
      args: [],
    );
  }

  /// `yes`
  String get yes {
    return Intl.message('yes', name: 'yes', desc: '', args: []);
  }

  /// `No`
  String get No {
    return Intl.message('No', name: 'No', desc: '', args: []);
  }

  /// `save`
  String get save {
    return Intl.message('save', name: 'save', desc: '', args: []);
  }

  /// `Edit profile successfully`
  String get edit_profile_successfully {
    return Intl.message(
      'Edit profile successfully',
      name: 'edit_profile_successfully',
      desc: '',
      args: [],
    );
  }

  /// `failed edit profile`
  String get failed_edit_profile {
    return Intl.message(
      'failed edit profile',
      name: 'failed_edit_profile',
      desc: '',
      args: [],
    );
  }

  /// `Enter new email`
  String get enter_new_email {
    return Intl.message(
      'Enter new email',
      name: 'enter_new_email',
      desc: '',
      args: [],
    );
  }

  /// `Edit email`
  String get edit_email {
    return Intl.message('Edit email', name: 'edit_email', desc: '', args: []);
  }

  /// `cotinue`
  String get cotinue {
    return Intl.message('cotinue', name: 'cotinue', desc: '', args: []);
  }

  /// `old password`
  String get old_password {
    return Intl.message(
      'old password',
      name: 'old_password',
      desc: '',
      args: [],
    );
  }

  /// `new password`
  String get new_password {
    return Intl.message(
      'new password',
      name: 'new_password',
      desc: '',
      args: [],
    );
  }

  /// `change password`
  String get change_password {
    return Intl.message(
      'change password',
      name: 'change_password',
      desc: '',
      args: [],
    );
  }

  /// `Failed changed password`
  String get failed_changed_password {
    return Intl.message(
      'Failed changed password',
      name: 'failed_changed_password',
      desc: '',
      args: [],
    );
  }

  /// `Edit password successfully`
  String get edit_password_successfully {
    return Intl.message(
      'Edit password successfully',
      name: 'edit_password_successfully',
      desc: '',
      args: [],
    );
  }

  /// `Failed loading image`
  String get failed_loading_image {
    return Intl.message(
      'Failed loading image',
      name: 'failed_loading_image',
      desc: '',
      args: [],
    );
  }

  /// `Heart Rate`
  String get heart_rate {
    return Intl.message('Heart Rate', name: 'heart_rate', desc: '', args: []);
  }

  /// `Blood Group`
  String get blood_group {
    return Intl.message('Blood Group', name: 'blood_group', desc: '', args: []);
  }

  /// `Temprature`
  String get temprature {
    return Intl.message('Temprature', name: 'temprature', desc: '', args: []);
  }

  /// `Weight`
  String get weight {
    return Intl.message('Weight', name: 'weight', desc: '', args: []);
  }

  /// `Height`
  String get height {
    return Intl.message('Height', name: 'height', desc: '', args: []);
  }

  /// `Blood Pressure`
  String get blood_pressure {
    return Intl.message(
      'Blood Pressure',
      name: 'blood_pressure',
      desc: '',
      args: [],
    );
  }

  /// `Blood Sugar`
  String get blood_sugar {
    return Intl.message('Blood Sugar', name: 'blood_sugar', desc: '', args: []);
  }

  /// `Language`
  String get language {
    return Intl.message('Language', name: 'language', desc: '', args: []);
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'ar'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
