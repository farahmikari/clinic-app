class EndPoints {
  static String baseUrl = "http://192.168.1.14:8000";

  static String getDepartmentDays(int departmentId) {
    return "/api/department/$departmentId";
  }

  static String getAppointments(String status) {
    return "/api/patient/appointments?status=$status";
  }

  static String checkCancelAbility(int appointmentId) {
    return "/api/appointments/$appointmentId/can_cancel";
  }

  static String getReservation(int appointmentId) {
    return "/api/appointments/$appointmentId";
  }

  static String cancelAppointment(int appointmentId) {
    return "/api/appointments/$appointmentId";
  }

  static String editAppointment(int appointmentId) {
    return "/api/appointments/$appointmentId";
  }

  /////send otp code to email/////
  static String sendEmailVerify() {
    return "/api/send-email";
  }

  /////submit otp code//////
  static String checkOTPcode() {
    return "/api/verify-email";
  }

  /////sign up//////
  static String signup() {
    return "/api/user_register";
  }

  //////login///////
  static String login() {
    return "/api/user_login";
  }

  //////send Email forget password////
  static String sendEmailForgetPassword() {
    return "/api/password/email";
  }

  /////submit otp forget password////
  static String checkOTPForgetPassword() {
    return "/api/password/code/check/email";
  }

  /////reset password///////
  static String resetPassword() {
    return "/api/password/reset/email";
  }

  static String logout() {
    return "/api/user_logout";
  }

  static String departments = "/api/departments";
  static String defaultDays = "/api/default_days";
  static String defaultTimes = "/api/default_times";
  static String appointments = "/api/appointments";
  static String availableSlotsByShift = "/api/availableSlotsByShift";
}

class ApiKey {
  static String accept = "Accept";
  static String authorization = 'Authorization';
  static String errorMessage = "message";
  static String startId = "start_id";
  static String endId = "end_id";
  static String canCancel = "can_cancel";
}
