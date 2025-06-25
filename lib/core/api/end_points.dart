class EndPoints {
  static String baseUrl = "http://192.168.1.2:8000";

  static String departmentId(int departmentId) {
    return "/api/department/$departmentId";
  }

  static String canCancel(int appointmentId) {
    return "/api/appointments/$appointmentId/can_cancel";
  }

  static String appointmentId(int appointmentId) {
    return "/api/appointments/$appointmentId";
  }

  static String departments = "/api/departments";
  static String defaultDays = "/api/default_days";
  static String defaultTimes = "/api/default_times";
  static String appointments = "/api/appointments";
  static String patientAppointments = "/api/patient/appointments";
  static String availableSlotsByShift = "/api/availableSlotsByShift";
}

class ApiKey {
  static String accept = "Accept";
  static String authorization = 'Authorization';
  static String errorMessage = "message";
  static String startId = "start_id";
  static String endId = "end_id";
  static String canCancel = "can_cancel";
  static String departmentId = "department_id";
  static String doctorId = "doctor_id";
  static String slotId = "slot_id";
  static String date = "date";
  static String requestTypeId = "request_type_id";
  static String withMedicalReport = "with_medical_report";
  static String pending = "pending";
  static String completed = "completed";
  static String data = "data";
  static String shift = "shift";
  static String slots = "slots";
  static String day = "day";
  static String timeId = "time_id";
  static String id = "id";
  static String status = "status";
  static String doctorName = "doctor_name";
  static String doctorImage = "doctor_image";
  static String department = "department";
  static String dateTime = "date_time";
  static String isAvailable = "isAvailable";
  static String name = "name";
  static String time = "time";
}
