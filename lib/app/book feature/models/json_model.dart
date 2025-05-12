final myDepartments = [
  {"id": 1, "name": "Cardiology"},
  {"id": 2, "name": "Neurology"},
  {"id": 3, "name": "Pediatrics"},
  {"id": 4, "name": "Dermatology"},
  {"id": 5, "name": "Oncology"},
];

final myDays = {
  1: [
    {"id": 1, "date": "2025-05-10", "isAvailable": false},
    {"id": 2, "date": "2025-05-11", "isAvailable": true},
    {"id": 3, "date": "2025-05-12", "isAvailable": true},
    {"id": 4, "date": "2025-05-13", "isAvailable": false},
    {"id": 5, "date": "2025-05-14", "isAvailable": true},
  ],
  2: [
    {"id": 1, "date": "2025-05-10", "isAvailable": false},
    {"id": 2, "date": "2025-05-11", "isAvailable": true},
    {"id": 3, "date": "2025-05-12", "isAvailable": false},
    {"id": 4, "date": "2025-05-13", "isAvailable": true},
    {"id": 5, "date": "2025-05-14", "isAvailable": true},
  ],
  3: [
    {"id": 1, "date": "2025-05-10", "isAvailable": false},
    {"id": 2, "date": "2025-05-11", "isAvailable": true},
    {"id": 3, "date": "2025-05-12", "isAvailable": true},
    {"id": 4, "date": "2025-05-13", "isAvailable": true},
    {"id": 5, "date": "2025-05-14", "isAvailable": true},
  ],
  4: [
    {"id": 1, "date": "2025-05-10", "isAvailable": false},
    {"id": 2, "date": "2025-05-11", "isAvailable": true},
    {"id": 3, "date": "2025-05-12", "isAvailable": false},
    {"id": 4, "date": "2025-05-13", "isAvailable": false},
    {"id": 5, "date": "2025-05-14", "isAvailable": true},
  ],
  5: [
    {"id": 1, "date": "2025-05-10", "isAvailable": false},
    {"id": 2, "date": "2025-05-11", "isAvailable": true},
    {"id": 3, "date": "2025-05-12", "isAvailable": false},
    {"id": 4, "date": "2025-05-13", "isAvailable": false},
    {"id": 5, "date": "2025-05-14", "isAvailable": true},
  ],
};

final myDoctors = {
  1: {
    "morning_shift_doctor": {"id": 1},
    "afternoon_shift_doctor": {"id": 2},
  },
  2: {
    "morning_shift_doctor": {"id": 3},
    "afternoon_shift_doctor": {"id": 4},
  },
  3: {
    "morning_shift_doctor": {"id": 5},
    "afternoon_shift_doctor": {"id": 6},
  },
  4: {
    "morning_shift_doctor": {"id": 7},
    "afternoon_shift_doctor": {"id": 8},
  },
  5: {
    "morning_shift_doctor": {"id": 9},
    "afternoon_shift_doctor": {"id": 10},
  },
};

final myMorningTimes = {
  1: [
    {"id": 1, "name": "09:00 AM", "isAvailable": true},
    {"id": 2, "name": "09:30 AM", "isAvailable": false},
    {"id": 3, "name": "10:00 AM", "isAvailable": true},
    {"id": 4, "name": "10:30 AM", "isAvailable": false},
    {"id": 5, "name": "11:00 AM", "isAvailable": true},
    {"id": 6, "name": "11:30 AM", "isAvailable": false},
    {"id": 7, "name": "12:00 PM", "isAvailable": true},
    {"id": 8, "name": "12:30 PM", "isAvailable": false},
  ],
  2: [
    {"id": 1, "name": "09:00 AM", "isAvailable": false},
    {"id": 2, "name": "09:30 AM", "isAvailable": false},
    {"id": 3, "name": "10:00 AM", "isAvailable": false},
    {"id": 4, "name": "10:30 AM", "isAvailable": false},
    {"id": 5, "name": "11:00 AM", "isAvailable": false},
    {"id": 6, "name": "11:30 AM", "isAvailable": false},
    {"id": 7, "name": "12:00 PM", "isAvailable": true},
    {"id": 8, "name": "12:30 PM", "isAvailable": true},
  ],
  3: [
    {"id": 1, "name": "09:00 AM", "isAvailable": true},
    {"id": 2, "name": "09:30 AM", "isAvailable": true},
    {"id": 3, "name": "10:00 AM", "isAvailable": true},
    {"id": 4, "name": "10:30 AM", "isAvailable": false},
    {"id": 5, "name": "11:00 AM", "isAvailable": false},
    {"id": 6, "name": "11:30 AM", "isAvailable": false},
    {"id": 7, "name": "12:00 PM", "isAvailable": true},
    {"id": 8, "name": "12:30 PM", "isAvailable": true},
  ],
  4: [
    {"id": 1, "name": "09:00 AM", "isAvailable": false},
    {"id": 2, "name": "09:30 AM", "isAvailable": true},
    {"id": 3, "name": "10:00 AM", "isAvailable": false},
    {"id": 4, "name": "10:30 AM", "isAvailable": true},
    {"id": 5, "name": "11:00 AM", "isAvailable": false},
    {"id": 6, "name": "11:30 AM", "isAvailable": false},
    {"id": 7, "name": "12:00 PM", "isAvailable": true},
    {"id": 8, "name": "12:30 PM", "isAvailable": true},
  ],
  5: [
    {"id": 1, "name": "09:00 AM", "isAvailable": true},
    {"id": 2, "name": "09:30 AM", "isAvailable": false},
    {"id": 3, "name": "10:00 AM", "isAvailable": true},
    {"id": 4, "name": "10:30 AM", "isAvailable": true},
    {"id": 5, "name": "11:00 AM", "isAvailable": false},
    {"id": 6, "name": "11:30 AM", "isAvailable": false},
    {"id": 7, "name": "12:00 PM", "isAvailable": true},
    {"id": 8, "name": "12:30 PM", "isAvailable": true},
  ],
};

final myAfternoonTimes = {
  1: [
    {"id": 11, "name": "02:00 AM", "isAvailable": false},
    {"id": 12, "name": "02:30 AM", "isAvailable": false},
    {"id": 13, "name": "03:00 AM", "isAvailable": false},
    {"id": 14, "name": "03:30 AM", "isAvailable": false},
    {"id": 15, "name": "04:00 AM", "isAvailable": false},
    {"id": 16, "name": "04:30 AM", "isAvailable": false},
    {"id": 17, "name": "05:00 PM", "isAvailable": true},
    {"id": 18, "name": "05:30 PM", "isAvailable": true},
  ],
  2: [
    {"id": 11, "name": "02:00 AM", "isAvailable": true},
    {"id": 12, "name": "02:30 AM", "isAvailable": false},
    {"id": 13, "name": "03:00 AM", "isAvailable": true},
    {"id": 14, "name": "03:30 AM", "isAvailable": false},
    {"id": 15, "name": "04:00 AM", "isAvailable": true},
    {"id": 16, "name": "04:30 AM", "isAvailable": false},
    {"id": 17, "name": "05:00 PM", "isAvailable": true},
    {"id": 18, "name": "05:30 PM", "isAvailable": false},
  ],
  3: [
    {"id": 11, "name": "02:00 AM", "isAvailable": false},
    {"id": 12, "name": "02:30 AM", "isAvailable": true},
    {"id": 13, "name": "03:00 AM", "isAvailable": false},
    {"id": 14, "name": "03:30 AM", "isAvailable": true},
    {"id": 15, "name": "04:00 AM", "isAvailable": false},
    {"id": 16, "name": "04:30 AM", "isAvailable": false},
    {"id": 17, "name": "05:00 PM", "isAvailable": true},
    {"id": 18, "name": "05:30 PM", "isAvailable": true},
  ],
  4: [
    {"id": 11, "name": "02:00 AM", "isAvailable": true},
    {"id": 12, "name": "02:30 AM", "isAvailable": true},
    {"id": 13, "name": "03:00 AM", "isAvailable": true},
    {"id": 14, "name": "03:30 AM", "isAvailable": false},
    {"id": 15, "name": "04:00 AM", "isAvailable": false},
    {"id": 16, "name": "04:30 AM", "isAvailable": false},
    {"id": 17, "name": "05:00 PM", "isAvailable": true},
    {"id": 18, "name": "05:30 PM", "isAvailable": true},
  ],
  5: [
    {"id": 11, "name": "02:00 AM", "isAvailable": true},
    {"id": 12, "name": "02:30 AM", "isAvailable": false},
    {"id": 13, "name": "03:00 AM", "isAvailable": true},
    {"id": 14, "name": "03:30 AM", "isAvailable": true},
    {"id": 15, "name": "04:00 AM", "isAvailable": false},
    {"id": 16, "name": "04:30 AM", "isAvailable": false},
    {"id": 17, "name": "05:00 PM", "isAvailable": true},
    {"id": 18, "name": "05:30 PM", "isAvailable": true},
  ],
};

final defaultDays = [
  {"id": 1, "date": "2025-05-10", "isAvailable": false},
  {"id": 2, "date": "2025-05-11", "isAvailable": false},
  {"id": 3, "date": "2025-05-12", "isAvailable": false},
  {"id": 4, "date": "2025-05-13", "isAvailable": false},
  {"id": 5, "date": "2025-05-14", "isAvailable": false},
];

final defaultMorningTimes = [
  {"id": 1, "name": "09:00 AM", "isAvailable": false},
  {"id": 2, "name": "09:30 AM", "isAvailable": false},
  {"id": 3, "name": "10:00 AM", "isAvailable": false},
  {"id": 4, "name": "10:30 AM", "isAvailable": false},
  {"id": 5, "name": "11:00 AM", "isAvailable": false},
  {"id": 6, "name": "11:30 AM", "isAvailable": false},
  {"id": 7, "name": "12:00 PM", "isAvailable": false},
  {"id": 8, "name": "12:30 PM", "isAvailable": false},
];

final defaultAfternoonTimes = [
  {"id": 11, "name": "02:00 AM", "isAvailable": false},
  {"id": 12, "name": "02:30 AM", "isAvailable": false},
  {"id": 13, "name": "03:00 AM", "isAvailable": false},
  {"id": 14, "name": "03:30 AM", "isAvailable": false},
  {"id": 15, "name": "04:00 AM", "isAvailable": false},
  {"id": 16, "name": "04:30 AM", "isAvailable": false},
  {"id": 17, "name": "05:00 PM", "isAvailable": false},
  {"id": 18, "name": "05:30 PM", "isAvailable": false},
];
