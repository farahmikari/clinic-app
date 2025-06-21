final myDepartments = [
  {"id": 1, "name": "Cardiology"},
  {"id": 2, "name": "Neurology"},
  {"id": 3, "name": "Pediatrics"},
  {"id": 4, "name": "Dermatology"},
  {"id": 5, "name": "Oncology"},
];

final myDays = {
  1: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": true},
    {"id": 4, "day": "2025-05-26", "isAvailable": false},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  2: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": false},
    {"id": 4, "day": "2025-05-26", "isAvailable": true},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  3: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": true},
    {"id": 4, "day": "2025-05-26", "isAvailable": true},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  4: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": false},
    {"id": 4, "day": "2025-05-26", "isAvailable": false},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
  5: [
    {"id": 1, "day": "2025-05-23", "isAvailable": false},
    {"id": 2, "day": "2025-05-24", "isAvailable": true},
    {"id": 3, "day": "2025-05-25", "isAvailable": false},
    {"id": 4, "day": "2025-05-26", "isAvailable": false},
    {"id": 5, "day": "2025-05-27", "isAvailable": true},
  ],
};

final myDoctors = {
  "2025-05-23": {"morning": 1, "afternoon": 2},
  "2025-05-24": {"morning": 3, "afternoon": 4},
  "2025-05-25": {"morning": 5, "afternoon": 6},
  "2025-05-26": {"morning": 7, "afternoon": 8},
  "2025-05-27": {"morning": 9, "afternoon": 10},
};

final myMorningTimes = {
  "2025-05-23": [
    {"id": 1, "time": "09:00:00", "isAvailable": true},
    {"id": 2, "time": "09:30:00", "isAvailable": false},
    {"id": 3, "time": "10:00:00", "isAvailable": true},
    {"id": 4, "time": "10:30:00", "isAvailable": false},
    {"id": 5, "time": "11:00:00", "isAvailable": true},
    {"id": 6, "time": "11:30:00", "isAvailable": false},
    {"id": 7, "time": "12:00:00", "isAvailable": true},
    {"id": 8, "time": "12:30:00", "isAvailable": false},
  ],
  "2025-05-24": [
    {"id": 1, "time": "09:00:00", "isAvailable": false},
    {"id": 2, "time": "09:30:00", "isAvailable": false},
    {"id": 3, "time": "10:00:00", "isAvailable": false},
    {"id": 4, "time": "10:30:00", "isAvailable": false},
    {"id": 5, "time": "11:00:00", "isAvailable": false},
    {"id": 6, "time": "11:30:00", "isAvailable": false},
    {"id": 7, "time": "12:00:00", "isAvailable": true},
    {"id": 8, "time": "12:30:00", "isAvailable": true},
  ],
  "2025-05-25": [
    {"id": 1, "time": "09:00:00", "isAvailable": true},
    {"id": 2, "time": "09:30:00", "isAvailable": true},
    {"id": 3, "time": "10:00:00", "isAvailable": true},
    {"id": 4, "time": "10:30:00", "isAvailable": false},
    {"id": 5, "time": "11:00:00", "isAvailable": false},
    {"id": 6, "time": "11:30:00", "isAvailable": false},
    {"id": 7, "time": "12:00:00", "isAvailable": true},
    {"id": 8, "time": "12:30:00", "isAvailable": true},
  ],
  "2025-05-26": [
    {"id": 1, "time": "09:00:00", "isAvailable": false},
    {"id": 2, "time": "09:30:00", "isAvailable": true},
    {"id": 3, "time": "10:00:00", "isAvailable": false},
    {"id": 4, "time": "10:30:00", "isAvailable": true},
    {"id": 5, "time": "11:00:00", "isAvailable": false},
    {"id": 6, "time": "11:30:00", "isAvailable": false},
    {"id": 7, "time": "12:00:00", "isAvailable": true},
    {"id": 8, "time": "12:30:00", "isAvailable": true},
  ],
  "2025-05-27": [
    {"id": 1, "time": "09:00:00", "isAvailable": true},
    {"id": 2, "time": "09:30:00", "isAvailable": false},
    {"id": 3, "time": "10:00:00", "isAvailable": true},
    {"id": 4, "time": "10:30:00", "isAvailable": true},
    {"id": 5, "time": "11:00:00", "isAvailable": false},
    {"id": 6, "time": "11:30:00", "isAvailable": false},
    {"id": 7, "time": "12:00:00", "isAvailable": true},
    {"id": 8, "time": "12:30:00", "isAvailable": true},
  ],
};

final myAfternoonTimes = {
  "2025-05-23": [
    {"id": 11, "time": "14:00:00", "isAvailable": false},
    {"id": 12, "time": "14:30:00", "isAvailable": false},
    {"id": 13, "time": "15:00:00", "isAvailable": false},
    {"id": 14, "time": "15:30:00", "isAvailable": false},
    {"id": 15, "time": "16:00:00", "isAvailable": false},
    {"id": 16, "time": "16:30:00", "isAvailable": false},
    {"id": 17, "time": "17:00:00", "isAvailable": true},
    {"id": 18, "time": "17:30:00", "isAvailable": true},
  ],
  "2025-05-24": [
    {"id": 11, "time": "14:00:00", "isAvailable": true},
    {"id": 12, "time": "14:30:00", "isAvailable": false},
    {"id": 13, "time": "15:00:00", "isAvailable": true},
    {"id": 14, "time": "15:30:00", "isAvailable": false},
    {"id": 15, "time": "16:00:00", "isAvailable": true},
    {"id": 16, "time": "16:30:00", "isAvailable": false},
    {"id": 17, "time": "17:00:00", "isAvailable": true},
    {"id": 18, "time": "17:30:00", "isAvailable": false},
  ],
  "2025-05-25": [
    {"id": 11, "time": "14:00:00", "isAvailable": false},
    {"id": 12, "time": "14:30:00", "isAvailable": true},
    {"id": 13, "time": "15:00:00", "isAvailable": false},
    {"id": 14, "time": "15:30:00", "isAvailable": true},
    {"id": 15, "time": "16:00:00", "isAvailable": false},
    {"id": 16, "time": "16:30:00", "isAvailable": false},
    {"id": 17, "time": "17:00:00", "isAvailable": true},
    {"id": 18, "time": "17:30:00", "isAvailable": true},
  ],
  "2025-05-26": [
    {"id": 11, "time": "14:00:00", "isAvailable": true},
    {"id": 12, "time": "14:30:00", "isAvailable": true},
    {"id": 13, "time": "15:00:00", "isAvailable": true},
    {"id": 14, "time": "15:30:00", "isAvailable": false},
    {"id": 15, "time": "16:00:00", "isAvailable": false},
    {"id": 16, "time": "16:30:00", "isAvailable": false},
    {"id": 17, "time": "17:00:00", "isAvailable": true},
    {"id": 18, "time": "17:30:00", "isAvailable": true},
  ],
  "2025-05-27": [
    {"id": 11, "time": "14:00:00", "isAvailable": true},
    {"id": 12, "time": "14:30:00", "isAvailable": false},
    {"id": 13, "time": "15:00:00", "isAvailable": true},
    {"id": 14, "time": "15:30:00", "isAvailable": true},
    {"id": 15, "time": "16:00:00", "isAvailable": false},
    {"id": 16, "time": "16:30:00", "isAvailable": false},
    {"id": 17, "time": "17:00:00", "isAvailable": true},
    {"id": 18, "time": "17:30:00", "isAvailable": true},
  ],
};

final myDefaultDays = [
  {"id": 1, "day": "2025-05-23", "isAvailable": false},
  {"id": 2, "day": "2025-05-24", "isAvailable": false},
  {"id": 3, "day": "2025-05-25", "isAvailable": false},
  {"id": 4, "day": "2025-05-26", "isAvailable": false},
  {"id": 5, "day": "2025-05-27", "isAvailable": false},
];

final myDefaultMorningTimes = [
  {"id": 1, "time": "09:00:00", "isAvailable": false},
  {"id": 2, "time": "09:30:00", "isAvailable": false},
  {"id": 3, "time": "10:00:00", "isAvailable": false},
  {"id": 4, "time": "10:30:00", "isAvailable": false},
  {"id": 5, "time": "11:00:00", "isAvailable": false},
  {"id": 6, "time": "11:30:00", "isAvailable": false},
  {"id": 7, "time": "12:00:00", "isAvailable": false},
  {"id": 8, "time": "12:30:00", "isAvailable": false},
];

final myDefaultAfternoonTimes = [
  {"id": 11, "time": "14:00:00", "isAvailable": false},
  {"id": 12, "time": "14:30:00", "isAvailable": false},
  {"id": 13, "time": "15:00:00", "isAvailable": false},
  {"id": 14, "time": "15:30:00", "isAvailable": false},
  {"id": 15, "time": "16:00:00", "isAvailable": false},
  {"id": 16, "time": "16:30:00", "isAvailable": false},
  {"id": 17, "time": "17:00:00", "isAvailable": false},
  {"id": 18, "time": "17:30:00", "isAvailable": false},
];
