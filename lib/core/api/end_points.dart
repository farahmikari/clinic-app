class EndPoints {
  static String baseUrl = "http://10.2.0.2:8000";

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
