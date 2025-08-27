// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'No Afternoon Dr', one: '1 Afternoon Dr', other: '${count} Afternoon Dr')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'No experience', one: '1 year', other: '${count} years')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'No Morning Dr', one: '1 Morning Dr', other: '${count} Morning Dr')}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'No treatments', one: '1 treatment', other: '${count} treatments')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "No": MessageLookupByLibrary.simpleMessage("No"),
    "about_doctor": MessageLookupByLibrary.simpleMessage("About Doctor"),
    "about_us": MessageLookupByLibrary.simpleMessage("About Us"),
    "advices": MessageLookupByLibrary.simpleMessage("Advices"),
    "afternoon": MessageLookupByLibrary.simpleMessage("afternoon"),
    "afternoon_doctors_count": m0,
    "afternoon_times": MessageLookupByLibrary.simpleMessage("Afternoon Times"),
    "all": MessageLookupByLibrary.simpleMessage("All"),
    "app_language_subtitle": MessageLookupByLibrary.simpleMessage(
      "Switch between English and Arabic.",
    ),
    "app_language_title": MessageLookupByLibrary.simpleMessage("App Language"),
    "appearance_subtitle": MessageLookupByLibrary.simpleMessage(
      "Choose your light or dark theme.",
    ),
    "appearance_title": MessageLookupByLibrary.simpleMessage("Appearance"),
    "appointment_date": MessageLookupByLibrary.simpleMessage(
      "Appointment Date",
    ),
    "appointment_time": MessageLookupByLibrary.simpleMessage(
      "Appointment Time",
    ),
    "appointments": MessageLookupByLibrary.simpleMessage("Appointments"),
    "appointments_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "Log in to view your upcoming and completed appointments with your doctors.",
    ),
    "appointments_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "Sign in to access your appointments",
    ),
    "appointments_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any appointments at the clinic.",
    ),
    "appointments_empty_title": MessageLookupByLibrary.simpleMessage(
      "No appointments found",
    ),
    "arabic": MessageLookupByLibrary.simpleMessage("Arabic"),
    "are_you_sure_you_want_to_logout": MessageLookupByLibrary.simpleMessage(
      "Are you sure you want to logout ?!",
    ),
    "bill_details": MessageLookupByLibrary.simpleMessage("Bill Details"),
    "bills": MessageLookupByLibrary.simpleMessage("Bills"),
    "bills_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "To securely access and review all your billing details, please sign in to your account.",
    ),
    "bills_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "Sign in to access your bills",
    ),
    "bills_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "You don\'t have any bills to pay at the moment.",
    ),
    "bills_empty_title": MessageLookupByLibrary.simpleMessage("No bills due"),
    "birthday_date": MessageLookupByLibrary.simpleMessage("Birthday Date"),
    "blood_group": MessageLookupByLibrary.simpleMessage("Blood Group"),
    "blood_pressure": MessageLookupByLibrary.simpleMessage("Blood Pressure"),
    "blood_sugar": MessageLookupByLibrary.simpleMessage("Blood Sugar"),
    "book_appointment": MessageLookupByLibrary.simpleMessage(
      "Book Appointment",
    ),
    "book_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "To schedule a visit with our doctors, please sign in to your account or create a new one, This will allow you to choose your preferred doctor, select a convenient time and confirm your booking easily.",
    ),
    "book_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "Sign in to book your appointment",
    ),
    "book_now": MessageLookupByLibrary.simpleMessage("Book Now"),
    "book_now_subtitle": MessageLookupByLibrary.simpleMessage(
      "Find The Best Doctors In Syria",
    ),
    "book_with_doctor_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "Log in to your account to select your preferred time and confirm your clinic visit.",
    ),
    "book_with_doctor_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "Sign in to book your appointment",
    ),
    "book_with_offer_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "Log in to your account to unlock this special deal and book your appointment at the clinic.",
    ),
    "book_with_offer_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "Sign in to use your offer",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "cancel": MessageLookupByLibrary.simpleMessage("Cancel"),
    "card_subtitle": MessageLookupByLibrary.simpleMessage(
      "Your path to better health starts here!",
    ),
    "card_title": MessageLookupByLibrary.simpleMessage(
      "Discover Your Wellbeing",
    ),
    "change_password": MessageLookupByLibrary.simpleMessage("Change password"),
    "check_up": MessageLookupByLibrary.simpleMessage("Check-Up"),
    "completed": MessageLookupByLibrary.simpleMessage("completed"),
    "confirm": MessageLookupByLibrary.simpleMessage("Confirm"),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "continue_as_a_guest": MessageLookupByLibrary.simpleMessage(
      "Continue as a guest",
    ),
    "cotinue": MessageLookupByLibrary.simpleMessage("Cotinue"),
    "dark_theme": MessageLookupByLibrary.simpleMessage("Dark theme"),
    "data_not_found": MessageLookupByLibrary.simpleMessage("Data not found"),
    "days": MessageLookupByLibrary.simpleMessage("Days"),
    "department": MessageLookupByLibrary.simpleMessage("Department"),
    "department_doctors_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "There are currently no doctors in this department. Please check back soon or explore other departments.",
    ),
    "department_doctors_empty_title": MessageLookupByLibrary.simpleMessage(
      "No Doctors Available",
    ),
    "departments": MessageLookupByLibrary.simpleMessage("Departments"),
    "departments_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "There are currently no departments open at the clinic, Please check back later.",
    ),
    "departments_empty_title": MessageLookupByLibrary.simpleMessage(
      "No departments available",
    ),
    "do_you_have_an_account": MessageLookupByLibrary.simpleMessage(
      "Do you have an account ?",
    ),
    "doctor": MessageLookupByLibrary.simpleMessage("Doctor"),
    "dont_have_an_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account ?",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "edit_email": MessageLookupByLibrary.simpleMessage("Edit email"),
    "edit_password": MessageLookupByLibrary.simpleMessage("Edit password"),
    "edit_password_successfully": MessageLookupByLibrary.simpleMessage(
      "Edit password successfully",
    ),
    "edit_profile": MessageLookupByLibrary.simpleMessage("Edit profile"),
    "edit_profile_successfully": MessageLookupByLibrary.simpleMessage(
      "Edit profile successfully",
    ),
    "editing": MessageLookupByLibrary.simpleMessage("Editing"),
    "email": MessageLookupByLibrary.simpleMessage("Email"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "enter_new_email": MessageLookupByLibrary.simpleMessage("Enter new email"),
    "experience_count": m1,
    "experience_title": MessageLookupByLibrary.simpleMessage("Experience"),
    "failed": MessageLookupByLibrary.simpleMessage("Failed"),
    "failed_changed_password": MessageLookupByLibrary.simpleMessage(
      "Failed changed password",
    ),
    "failed_edit_profile": MessageLookupByLibrary.simpleMessage(
      "Failed edit profile",
    ),
    "failed_loading_image": MessageLookupByLibrary.simpleMessage(
      "Failed loading image",
    ),
    "failed_logout": MessageLookupByLibrary.simpleMessage("Failed Logout"),
    "failed_sign_up": MessageLookupByLibrary.simpleMessage("Failed Sign Up"),
    "failed_to_send_verify_code": MessageLookupByLibrary.simpleMessage(
      "Failed to send verify code",
    ),
    "female": MessageLookupByLibrary.simpleMessage("Female"),
    "field_is_required": MessageLookupByLibrary.simpleMessage(
      "Field is required!",
    ),
    "first_name": MessageLookupByLibrary.simpleMessage("First Name"),
    "follow_up": MessageLookupByLibrary.simpleMessage("Follow-Up"),
    "forget_password": MessageLookupByLibrary.simpleMessage(
      "Forget Password ?",
    ),
    "gallery": MessageLookupByLibrary.simpleMessage("Gallery"),
    "gender": MessageLookupByLibrary.simpleMessage("Gender"),
    "get_started": MessageLookupByLibrary.simpleMessage("Get Started"),
    "glad_to_see_you": MessageLookupByLibrary.simpleMessage(
      "Glad to see you :)",
    ),
    "heart_rate": MessageLookupByLibrary.simpleMessage("Heart Rate"),
    "height": MessageLookupByLibrary.simpleMessage("Height"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "invalid_email": MessageLookupByLibrary.simpleMessage("Invalid email"),
    "keep_going": MessageLookupByLibrary.simpleMessage("Keep going"),
    "know_reservation_price": MessageLookupByLibrary.simpleMessage(
      "The total price for this reservation is",
    ),
    "lab_tests": MessageLookupByLibrary.simpleMessage("Lab Tests"),
    "last_name": MessageLookupByLibrary.simpleMessage("Last Name"),
    "latest_offers": MessageLookupByLibrary.simpleMessage("Latest Offers"),
    "less": MessageLookupByLibrary.simpleMessage("Less"),
    "less_than_10_numbers": MessageLookupByLibrary.simpleMessage(
      "Less than 10 numbers",
    ),
    "light_theme": MessageLookupByLibrary.simpleMessage("Light theme"),
    "login": MessageLookupByLibrary.simpleMessage("Login"),
    "login_failed": MessageLookupByLibrary.simpleMessage("Login Failed"),
    "login_first_to_show_your_data": MessageLookupByLibrary.simpleMessage(
      "Login first to show your data",
    ),
    "login_successfully": MessageLookupByLibrary.simpleMessage(
      "Login Successfully",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("Logout"),
    "logout_successfully": MessageLookupByLibrary.simpleMessage(
      "Logout Successfully",
    ),
    "male": MessageLookupByLibrary.simpleMessage("Male"),
    "manage_booking": MessageLookupByLibrary.simpleMessage("Manage Booking"),
    "medical_report": MessageLookupByLibrary.simpleMessage("Medical Report"),
    "medications": MessageLookupByLibrary.simpleMessage("Medications"),
    "more": MessageLookupByLibrary.simpleMessage("More"),
    "morning": MessageLookupByLibrary.simpleMessage("morning"),
    "morning_doctors_count": m2,
    "morning_times": MessageLookupByLibrary.simpleMessage("Morning Times"),
    "most_rated": MessageLookupByLibrary.simpleMessage("Most Rated"),
    "need_booking": MessageLookupByLibrary.simpleMessage(
      "Do you want to continue with the booking?",
    ),
    "need_medical_report": MessageLookupByLibrary.simpleMessage(
      "Do you need a medical report",
    ),
    "need_opinion": MessageLookupByLibrary.simpleMessage(
      "How was your visit with Dr.",
    ),
    "need_rating": MessageLookupByLibrary.simpleMessage(
      "? You can leave a quick rating if you’d like.",
    ),
    "new_password": MessageLookupByLibrary.simpleMessage("New password"),
    "no_thanks": MessageLookupByLibrary.simpleMessage("No, Thanks!"),
    "notifications": MessageLookupByLibrary.simpleMessage("Notifications"),
    "notifications_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "Log in to stay updated with the latest alerts and reminders from the clinic.",
    ),
    "notifications_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "Sign in to receive notifications",
    ),
    "notifications_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "You haven\'t received any notifications so far, Stay tuned for updates.",
    ),
    "notifications_empty_title": MessageLookupByLibrary.simpleMessage(
      "No notifications yet",
    ),
    "offers": MessageLookupByLibrary.simpleMessage("Offers"),
    "offers_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "There aren\'t any special offers right now, but stay tuned exciting deals are on the way.",
    ),
    "offers_empty_title": MessageLookupByLibrary.simpleMessage(
      "No offers available",
    ),
    "offers_subtitle": MessageLookupByLibrary.simpleMessage(
      "Check out today’s booking offers",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("Ok"),
    "old_password": MessageLookupByLibrary.simpleMessage("Old password"),
    "onboarding_1": MessageLookupByLibrary.simpleMessage(
      "Taking care of your health has never been this simple",
    ),
    "onboarding_2": MessageLookupByLibrary.simpleMessage(
      "We’re here to make healthcare simple , so we have the best doctors available!",
    ),
    "onboarding_3": MessageLookupByLibrary.simpleMessage(
      "Book your doctor’s visit in just a few taps",
    ),
    "oops": MessageLookupByLibrary.simpleMessage("Oops"),
    "or": MessageLookupByLibrary.simpleMessage("OR"),
    "otp_verification": MessageLookupByLibrary.simpleMessage(
      "OTP Verification",
    ),
    "paid": MessageLookupByLibrary.simpleMessage("paid"),
    "password": MessageLookupByLibrary.simpleMessage("Password"),
    "password_must_be_8_letters_at_least": MessageLookupByLibrary.simpleMessage(
      "Password must be 8 letters at least",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("pending"),
    "phone": MessageLookupByLibrary.simpleMessage("Phone"),
    "point_unit": MessageLookupByLibrary.simpleMessage("point"),
    "points_title": MessageLookupByLibrary.simpleMessage(
      "Well done! here\'s your total point balance",
    ),
    "points_unit": MessageLookupByLibrary.simpleMessage("points"),
    "prescription": MessageLookupByLibrary.simpleMessage("Prescription"),
    "profile": MessageLookupByLibrary.simpleMessage("Profile"),
    "qualifications": MessageLookupByLibrary.simpleMessage("Qualifications"),
    "resend_otp_code": MessageLookupByLibrary.simpleMessage("Resend OTP Code"),
    "reservation_info": MessageLookupByLibrary.simpleMessage(
      "Reservation Info",
    ),
    "reservation_price": MessageLookupByLibrary.simpleMessage(
      "Reservation Price",
    ),
    "reservation_type": MessageLookupByLibrary.simpleMessage(
      "Reservation Type",
    ),
    "reset": MessageLookupByLibrary.simpleMessage("Reset"),
    "reset_password": MessageLookupByLibrary.simpleMessage("Reset Password"),
    "reset_password_failed": MessageLookupByLibrary.simpleMessage(
      "Reset Password Failed",
    ),
    "reset_password_successfully": MessageLookupByLibrary.simpleMessage(
      "Reset Password Successfully",
    ),
    "save": MessageLookupByLibrary.simpleMessage("Save"),
    "search": MessageLookupByLibrary.simpleMessage("Search"),
    "see_more": MessageLookupByLibrary.simpleMessage("See More"),
    "services": MessageLookupByLibrary.simpleMessage("Services"),
    "set_your_email": MessageLookupByLibrary.simpleMessage("Set Your Email"),
    "set_your_information": MessageLookupByLibrary.simpleMessage(
      "Set your information",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("Settings"),
    "share_rating": MessageLookupByLibrary.simpleMessage("Share Rating"),
    "sign_in": MessageLookupByLibrary.simpleMessage("Sign in"),
    "sign_up": MessageLookupByLibrary.simpleMessage("Sign up"),
    "sign_up_successfully": MessageLookupByLibrary.simpleMessage(
      "Sign Up Successfully",
    ),
    "skip": MessageLookupByLibrary.simpleMessage("Skip"),
    "specialty": MessageLookupByLibrary.simpleMessage("Specialty"),
    "submit": MessageLookupByLibrary.simpleMessage("Submit"),
    "success": MessageLookupByLibrary.simpleMessage("Success"),
    "surgeries": MessageLookupByLibrary.simpleMessage("Surgeries"),
    "temprature": MessageLookupByLibrary.simpleMessage("Temprature"),
    "the_password_dont_match": MessageLookupByLibrary.simpleMessage(
      "The password don\'t match",
    ),
    "this_code_will_expired_in": MessageLookupByLibrary.simpleMessage(
      "\nThis code will expired in 05:00",
    ),
    "times": MessageLookupByLibrary.simpleMessage("Times"),
    "total_amount": MessageLookupByLibrary.simpleMessage("Total Amount"),
    "treatments_count": m3,
    "treatments_title": MessageLookupByLibrary.simpleMessage("Treatments"),
    "unpaid": MessageLookupByLibrary.simpleMessage("unpaid"),
    "use_device_language": MessageLookupByLibrary.simpleMessage(
      "Use device language",
    ),
    "use_device_theme": MessageLookupByLibrary.simpleMessage(
      "Use device theme",
    ),
    "verification_failed": MessageLookupByLibrary.simpleMessage(
      "Verification Failed",
    ),
    "verification_success": MessageLookupByLibrary.simpleMessage(
      "Verification Success",
    ),
    "verify": MessageLookupByLibrary.simpleMessage("Verify"),
    "verify_code_is_sent_successfully": MessageLookupByLibrary.simpleMessage(
      "Verify code is sent Successfully",
    ),
    "view_medical_report": MessageLookupByLibrary.simpleMessage(
      "View Medical Report",
    ),
    "vital_signs": MessageLookupByLibrary.simpleMessage("Vital signals"),
    "we_sent_your_code_to": MessageLookupByLibrary.simpleMessage(
      "We sent your code to",
    ),
    "weight": MessageLookupByLibrary.simpleMessage("Weight"),
    "welcom_back": MessageLookupByLibrary.simpleMessage("Welcom Back!"),
    "with_report": MessageLookupByLibrary.simpleMessage("With Report"),
    "without_report": MessageLookupByLibrary.simpleMessage("Without Report"),
    "yes": MessageLookupByLibrary.simpleMessage("yes"),
  };
}
