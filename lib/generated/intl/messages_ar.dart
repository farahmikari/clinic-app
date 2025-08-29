// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a ar locale. All the
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
  String get localeName => 'ar';

  static String m0(count) =>
      "${Intl.plural(count, zero: 'لا يوجد أطباء مسائيين', one: 'طبيب مسائي واحد', two: 'طبيبين مسائيين', few: '${count} أطباء مسائيين', many: '${count} طبيب مسائي', other: '${count} طبيب مسائي')}";

  static String m1(count) =>
      "${Intl.plural(count, zero: 'لا يوجد خبرة', one: 'سنة واحدة', two: 'سنتان', few: '${count} سنوات', many: '${count} سنة', other: '${count} سنة')}";

  static String m2(count) =>
      "${Intl.plural(count, zero: 'لا يوجد أطباء صباحيين', one: 'طبيب صباحي واحد', two: 'طبيبين صباحيين', few: '${count} أطباء صباحيين', many: '${count} طبيب صباحي', other: '${count} طبيب صباحي')}";

  static String m3(count) =>
      "${Intl.plural(count, zero: 'لا يوجد نقاط', one: 'نقطة واحدة', two: 'نقطتان', few: '${count} نقاط', many: '${count} نقطة', other: '${count} نقطة')}";

  static String m4(count) =>
      "${Intl.plural(count, zero: 'لا يوجد معالجات', one: 'معالجة واحدة', two: 'معالجتين', few: '${count} معالجات', many: '${count} معالجة', other: '${count} معالجة')}";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "No": MessageLookupByLibrary.simpleMessage("لا"),
    "about_doctor": MessageLookupByLibrary.simpleMessage("لمحة عن الطبيب"),
    "about_us": MessageLookupByLibrary.simpleMessage("معلومات عن مركزنا"),
    "advices": MessageLookupByLibrary.simpleMessage("النصائح"),
    "afternoon": MessageLookupByLibrary.simpleMessage("مسائي"),
    "afternoon_doctors_count": m0,
    "afternoon_times": MessageLookupByLibrary.simpleMessage("الأوقات المسائية"),
    "all": MessageLookupByLibrary.simpleMessage("الكل"),
    "app_language_subtitle": MessageLookupByLibrary.simpleMessage(
      "اختر اللغة العربية أو الإنجليزية.",
    ),
    "app_language_title": MessageLookupByLibrary.simpleMessage("لغة التطبيق"),
    "appearance_subtitle": MessageLookupByLibrary.simpleMessage(
      "اختر الوضع الفاتح أو الداكن.",
    ),
    "appearance_title": MessageLookupByLibrary.simpleMessage("المظهر"),
    "appointment_date": MessageLookupByLibrary.simpleMessage("تاريخ الموعد"),
    "appointment_time": MessageLookupByLibrary.simpleMessage("وقت الموعد"),
    "appointments": MessageLookupByLibrary.simpleMessage("المواعيد"),
    "appointments_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "قم بتسجيل الدخول لعرض مواعيدك القادمة والمكتملة مع أطبائك.",
    ),
    "appointments_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول للوصول إلى مواعيدك",
    ),
    "appointments_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "ليس لديك أي مواعيد في العيادة.",
    ),
    "appointments_empty_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد مواعيد",
    ),
    "arabic": MessageLookupByLibrary.simpleMessage("العربية"),
    "are_you_sure_you_want_to_logout": MessageLookupByLibrary.simpleMessage(
      "!هل متأكد أنك تريد تسجيل الخروج ؟",
    ),
    "base_url": MessageLookupByLibrary.simpleMessage("الرابط"),
    "base_url_subtitle": MessageLookupByLibrary.simpleMessage(
      "افتح Terminal وشغّل الأمر ipconfig. ابحث عن عنوان IPv4 في المخرجات، ثم أدخله في حقل النص بالصّيغة التالية:\n http://<IPv4 Address>:8000",
    ),
    "base_url_title": MessageLookupByLibrary.simpleMessage("حدد الرابط"),
    "bill_details": MessageLookupByLibrary.simpleMessage("تفاصيل الفاتورة"),
    "bills": MessageLookupByLibrary.simpleMessage("الفواتير"),
    "bills_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "للوصول الآمن ومراجعة جميع تفاصيل فواتيرك، يرجى تسجيل الدخول إلى حسابك.",
    ),
    "bills_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول للوصول إلى فواتيرك",
    ),
    "bills_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "ليس لديك أي فواتير للدفع في الوقت الحالي.",
    ),
    "bills_empty_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد فواتير مستحقة",
    ),
    "birthday_date": MessageLookupByLibrary.simpleMessage("تاريخ الميلاد"),
    "blood_group": MessageLookupByLibrary.simpleMessage("زمرة الدم"),
    "blood_pressure": MessageLookupByLibrary.simpleMessage("ضغط الدم"),
    "blood_sugar": MessageLookupByLibrary.simpleMessage("سكر الدم"),
    "book_appointment": MessageLookupByLibrary.simpleMessage("حجز موعد"),
    "book_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "لحجز زيارة مع أطبائنا، يرجى تسجيل الدخول إلى حسابك أو إنشاء حساب جديد، حيث يمكنك اختيار الطبيب المفضل لديك، تحديد الوقت المناسب وتأكيد الحجز بسهولة.",
    ),
    "book_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول لحجز موعدك",
    ),
    "book_now": MessageLookupByLibrary.simpleMessage("احجز الآن"),
    "book_now_subtitle": MessageLookupByLibrary.simpleMessage(
      "عند أفضل الأطباء السوريين",
    ),
    "book_with_doctor_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "قم بتسجيل الدخول إلى حسابك لاختيار الوقت المناسب وتأكيد زيارتك للعيادة.",
    ),
    "book_with_doctor_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول لحجز موعدك",
    ),
    "book_with_offer_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "قم بتسجيل الدخول إلى حسابك للاستفادة من هذا العرض الخاص وحجز موعدك في العيادة.",
    ),
    "book_with_offer_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول لاستخدام العرض",
    ),
    "camera": MessageLookupByLibrary.simpleMessage("الكاميرا"),
    "cancel": MessageLookupByLibrary.simpleMessage("إلغاء"),
    "card_subtitle": MessageLookupByLibrary.simpleMessage(
      "طريقك نحو صحة أفضل يبدأ من هنا",
    ),
    "card_title": MessageLookupByLibrary.simpleMessage("اكتشف صحتك ورفاهيتك"),
    "change_password": MessageLookupByLibrary.simpleMessage(
      "تغيير كلمة المرور",
    ),
    "check_up": MessageLookupByLibrary.simpleMessage("معاينة"),
    "completed": MessageLookupByLibrary.simpleMessage("مكتملة"),
    "confirm": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "confirm_password": MessageLookupByLibrary.simpleMessage(
      "تأكيد كلمة المرور",
    ),
    "continue_as_a_guest": MessageLookupByLibrary.simpleMessage("متابعة كزائر"),
    "cotinue": MessageLookupByLibrary.simpleMessage("المتابعة"),
    "dark_theme": MessageLookupByLibrary.simpleMessage("الوضع الداكن"),
    "data_not_found": MessageLookupByLibrary.simpleMessage(
      "البيانات غير متوفرة",
    ),
    "days": MessageLookupByLibrary.simpleMessage("الأيام"),
    "department": MessageLookupByLibrary.simpleMessage("القسم"),
    "department_doctors_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "لا يوجد أطباء في هذا القسم حالياً. يرجى المحاولة لاحقاً أو استكشاف أقسام أخرى.",
    ),
    "department_doctors_empty_title": MessageLookupByLibrary.simpleMessage(
      "لا يوجد أطباء متاحون",
    ),
    "departments": MessageLookupByLibrary.simpleMessage("الأقسام"),
    "departments_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد أقسام مفتوحة في العيادة حالياً، يرجى المحاولة لاحقاً.",
    ),
    "departments_empty_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد أقسام متاحة",
    ),
    "do_you_have_an_account": MessageLookupByLibrary.simpleMessage(
      "هل لديك حساب؟",
    ),
    "doctor": MessageLookupByLibrary.simpleMessage("الطبيب"),
    "dont_have_an_account": MessageLookupByLibrary.simpleMessage(
      "ليس لديك حساب؟",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("تعديل"),
    "edit_email": MessageLookupByLibrary.simpleMessage(
      "تعديل البريد الالكتروني",
    ),
    "edit_password": MessageLookupByLibrary.simpleMessage("تعديل كلمة السر"),
    "edit_password_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تعديل كلمة المرور بنجاح",
    ),
    "edit_profile": MessageLookupByLibrary.simpleMessage("تعديل الملف الشخصي"),
    "edit_profile_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تعديل الملف الشخصي بنجاح",
    ),
    "editing": MessageLookupByLibrary.simpleMessage("جار التعديل"),
    "email": MessageLookupByLibrary.simpleMessage("البريد الإلكتروني"),
    "english": MessageLookupByLibrary.simpleMessage("الإنجليزية"),
    "enter_new_email": MessageLookupByLibrary.simpleMessage(
      "أدخل بريدك الالكتروني الجديد",
    ),
    "experience_count": m1,
    "experience_title": MessageLookupByLibrary.simpleMessage("الخبرة"),
    "failed": MessageLookupByLibrary.simpleMessage("فشل"),
    "failed_changed_password": MessageLookupByLibrary.simpleMessage(
      "فشل تعديل كلمة المرور",
    ),
    "failed_edit_profile": MessageLookupByLibrary.simpleMessage(
      "فشل تعديل الملف الشخصي",
    ),
    "failed_loading_image": MessageLookupByLibrary.simpleMessage(
      "فشل تحميل الصورة",
    ),
    "failed_logout": MessageLookupByLibrary.simpleMessage("فشل تسجيل الخروج"),
    "failed_sign_up": MessageLookupByLibrary.simpleMessage("فشل إنشاء الحساب"),
    "failed_to_send_verify_code": MessageLookupByLibrary.simpleMessage(
      "فشل في إرسال رمز التحقق",
    ),
    "female": MessageLookupByLibrary.simpleMessage("انثى"),
    "field_is_required": MessageLookupByLibrary.simpleMessage("الحقل مطلوب!"),
    "first_name": MessageLookupByLibrary.simpleMessage("الاسم"),
    "follow_up": MessageLookupByLibrary.simpleMessage("مراجعة"),
    "forget_password": MessageLookupByLibrary.simpleMessage(
      "نسيت كلمة المرور؟",
    ),
    "gallery": MessageLookupByLibrary.simpleMessage("المعرض"),
    "gender": MessageLookupByLibrary.simpleMessage("الجنس"),
    "get_started": MessageLookupByLibrary.simpleMessage("البدء"),
    "glad_to_see_you": MessageLookupByLibrary.simpleMessage("سعداء برؤيتك :)"),
    "heart_rate": MessageLookupByLibrary.simpleMessage("ضربات القلب"),
    "height": MessageLookupByLibrary.simpleMessage("الطول"),
    "home": MessageLookupByLibrary.simpleMessage("الرئيسية"),
    "invalid_email": MessageLookupByLibrary.simpleMessage(
      "بريد إلكتروني غير صالح",
    ),
    "keep_going": MessageLookupByLibrary.simpleMessage("استمر"),
    "know_reservation_price": MessageLookupByLibrary.simpleMessage(
      "السعر الإجمالي لهذا الحجز هو",
    ),
    "lab_tests": MessageLookupByLibrary.simpleMessage("التحليلات المخبرية"),
    "last_name": MessageLookupByLibrary.simpleMessage("الكنية"),
    "latest_offers": MessageLookupByLibrary.simpleMessage("أحدث العروض"),
    "less": MessageLookupByLibrary.simpleMessage("أقل"),
    "less_than_10_numbers": MessageLookupByLibrary.simpleMessage(
      "أقل من 10 أرقام",
    ),
    "light_theme": MessageLookupByLibrary.simpleMessage("الوضع الفاتح"),
    "login": MessageLookupByLibrary.simpleMessage("تسجيل دخول"),
    "login_failed": MessageLookupByLibrary.simpleMessage("فشل تسجيل الدخول"),
    "login_first_to_show_your_data": MessageLookupByLibrary.simpleMessage(
      "سجل الدخول أولاً لعرض بياناتك",
    ),
    "login_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الدخول بنجاح",
    ),
    "logout": MessageLookupByLibrary.simpleMessage("تسجيل خروج"),
    "logout_successfully": MessageLookupByLibrary.simpleMessage(
      "تم تسجيل الخروج بنجاح",
    ),
    "male": MessageLookupByLibrary.simpleMessage("ذكر"),
    "manage_booking": MessageLookupByLibrary.simpleMessage("إدارة الحجز"),
    "medical_report": MessageLookupByLibrary.simpleMessage("التقرير الطبي"),
    "medications": MessageLookupByLibrary.simpleMessage("الأدوية"),
    "more": MessageLookupByLibrary.simpleMessage("أكثر"),
    "morning": MessageLookupByLibrary.simpleMessage("صباحي"),
    "morning_doctors_count": m2,
    "morning_times": MessageLookupByLibrary.simpleMessage("الأوقات الصباحية"),
    "most_rated": MessageLookupByLibrary.simpleMessage("الأكثر تقييما"),
    "need_booking": MessageLookupByLibrary.simpleMessage(
      "هل تريد الاستمرار بالحجز؟",
    ),
    "need_medical_report": MessageLookupByLibrary.simpleMessage(
      "هل تريد تقرير طبي ؟",
    ),
    "need_opinion": MessageLookupByLibrary.simpleMessage(
      "كيف كانت زيارتك للطبيب",
    ),
    "need_rating": MessageLookupByLibrary.simpleMessage(
      "؟ يمكنك ترك تقييم سريع إذا كنت ترغب في ذلك",
    ),
    "new_password": MessageLookupByLibrary.simpleMessage("كلمة المرور الجديدة"),
    "no_thanks": MessageLookupByLibrary.simpleMessage("لا شكرا"),
    "notifications": MessageLookupByLibrary.simpleMessage("الإشعارات"),
    "notifications_auth_prompt_subtitle": MessageLookupByLibrary.simpleMessage(
      "قم بتسجيل الدخول للبقاء على اطلاع دائم بآخر التحديثات والتنبيهات من العيادة.",
    ),
    "notifications_auth_prompt_title": MessageLookupByLibrary.simpleMessage(
      "سجّل الدخول لتلقي الإشعارات",
    ),
    "notifications_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "لم تستلم أي إشعارات حتى الآن، ترقّب التحديثات قريباً.",
    ),
    "notifications_empty_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد إشعارات بعد",
    ),
    "offers": MessageLookupByLibrary.simpleMessage("العروض"),
    "offers_empty_subtitle": MessageLookupByLibrary.simpleMessage(
      "لا توجد عروض خاصة حالياً، لكن ترقّب العروض المميزة قريباً.",
    ),
    "offers_empty_title": MessageLookupByLibrary.simpleMessage(
      "لا توجد عروض متاحة",
    ),
    "offers_subtitle": MessageLookupByLibrary.simpleMessage(
      "اطّلع على عروض الحجز لليوم",
    ),
    "ok": MessageLookupByLibrary.simpleMessage("حسنا"),
    "old_password": MessageLookupByLibrary.simpleMessage("كلمة المرور القديمة"),
    "onboarding_1": MessageLookupByLibrary.simpleMessage(
      "لم تكن العناية بصحتك بهذه البساطة من قبل",
    ),
    "onboarding_2": MessageLookupByLibrary.simpleMessage(
      "نحن هنا لتبسيط الرعاية الصحية، لذلك لدينا أفضل الأطباء المتاحين!",
    ),
    "onboarding_3": MessageLookupByLibrary.simpleMessage(
      "احجز موعدك مع الطبيب ببضع نقرات فقط",
    ),
    "oops": MessageLookupByLibrary.simpleMessage("عذراً"),
    "or": MessageLookupByLibrary.simpleMessage("او"),
    "otp_verification": MessageLookupByLibrary.simpleMessage("التحقق من الرمز"),
    "paid": MessageLookupByLibrary.simpleMessage("مدفوعة"),
    "password": MessageLookupByLibrary.simpleMessage("كلمة المرور"),
    "password_must_be_8_letters_at_least": MessageLookupByLibrary.simpleMessage(
      "يجب أن تتكون كلمة المرور من 8 أحرف على الأقل",
    ),
    "pending": MessageLookupByLibrary.simpleMessage("قيد الانتظار"),
    "phone": MessageLookupByLibrary.simpleMessage("الهاتف"),
    "points_count": m3,
    "points_title": MessageLookupByLibrary.simpleMessage(
      "أحسنت! إليك رصيد نقاطك الإجمالي",
    ),
    "prescription": MessageLookupByLibrary.simpleMessage("الوصفة الطبية"),
    "profile": MessageLookupByLibrary.simpleMessage("الملف الشخصي"),
    "qualifications": MessageLookupByLibrary.simpleMessage("المؤهلات"),
    "resend_otp_code": MessageLookupByLibrary.simpleMessage(
      "إعادة إرسال رمز تحقق",
    ),
    "reservation_info": MessageLookupByLibrary.simpleMessage("معلومات الحجز"),
    "reservation_price": MessageLookupByLibrary.simpleMessage("سعر الحجز"),
    "reservation_type": MessageLookupByLibrary.simpleMessage("نوع الحجز"),
    "reset": MessageLookupByLibrary.simpleMessage("إعادة تعيين"),
    "reset_password": MessageLookupByLibrary.simpleMessage(
      "إعادة تعيين كلمة المرور",
    ),
    "reset_password_failed": MessageLookupByLibrary.simpleMessage(
      "فشلت إعادة تعيين كلمة المرور",
    ),
    "reset_password_successfully": MessageLookupByLibrary.simpleMessage(
      "تم إعادة تعيين كلمة المرور بنجاح",
    ),
    "save": MessageLookupByLibrary.simpleMessage("حفظ"),
    "search": MessageLookupByLibrary.simpleMessage("بحث"),
    "see_more": MessageLookupByLibrary.simpleMessage("المزيد"),
    "services": MessageLookupByLibrary.simpleMessage("الخدمات"),
    "set_your_email": MessageLookupByLibrary.simpleMessage(
      "أدخل بريدك الإلكتروني",
    ),
    "set_your_information": MessageLookupByLibrary.simpleMessage(
      "أدخل معلوماتك الشخصية",
    ),
    "settings": MessageLookupByLibrary.simpleMessage("الإعدادات"),
    "share_rating": MessageLookupByLibrary.simpleMessage("مشاركة التقييم"),
    "sign_in": MessageLookupByLibrary.simpleMessage("تسجيل دخول"),
    "sign_up": MessageLookupByLibrary.simpleMessage("إنشاء حساب"),
    "sign_up_successfully": MessageLookupByLibrary.simpleMessage(
      "تم إنشاء الحساب",
    ),
    "skip": MessageLookupByLibrary.simpleMessage("تخطي"),
    "specialty": MessageLookupByLibrary.simpleMessage("الاختصاص"),
    "submit": MessageLookupByLibrary.simpleMessage("إرسال"),
    "success": MessageLookupByLibrary.simpleMessage("نجاح"),
    "surgeries": MessageLookupByLibrary.simpleMessage("العمليات الجراحية"),
    "temprature": MessageLookupByLibrary.simpleMessage("درجة الحرارة"),
    "the_password_dont_match": MessageLookupByLibrary.simpleMessage(
      "كلمة المرور غير متطابقة",
    ),
    "this_code_will_expired_in": MessageLookupByLibrary.simpleMessage(
      "\nسيتنتهي صلاحية هذا الكود في 05:00",
    ),
    "times": MessageLookupByLibrary.simpleMessage("الأوقات"),
    "total_amount": MessageLookupByLibrary.simpleMessage("السعر الإجمالي"),
    "treatments_count": m4,
    "treatments_title": MessageLookupByLibrary.simpleMessage("المعالجات"),
    "unpaid": MessageLookupByLibrary.simpleMessage("غير مدفوعة"),
    "use_device_language": MessageLookupByLibrary.simpleMessage(
      "استخدام لغة الجهاز",
    ),
    "use_device_theme": MessageLookupByLibrary.simpleMessage(
      "استخدام مظهر الجهاز",
    ),
    "verification_failed": MessageLookupByLibrary.simpleMessage("فشل التحقق"),
    "verification_success": MessageLookupByLibrary.simpleMessage("نجاح التحقق"),
    "verify": MessageLookupByLibrary.simpleMessage("تأكيد"),
    "verify_code_is_sent_successfully": MessageLookupByLibrary.simpleMessage(
      "تم إرسال رمز التحقق بنجاح",
    ),
    "view_medical_report": MessageLookupByLibrary.simpleMessage(
      "عرض التقرير الطبي",
    ),
    "vital_signs": MessageLookupByLibrary.simpleMessage("العلامات الحيوية"),
    "we_sent_your_code_to": MessageLookupByLibrary.simpleMessage(
      "لقد أرسلنا الكود الخاص بك إلى",
    ),
    "weight": MessageLookupByLibrary.simpleMessage("الوزن"),
    "welcom_back": MessageLookupByLibrary.simpleMessage("مرحبًا بعودتك!"),
    "with_report": MessageLookupByLibrary.simpleMessage("مع تقرير"),
    "without_report": MessageLookupByLibrary.simpleMessage("بدون تقرير"),
    "yes": MessageLookupByLibrary.simpleMessage("نعم"),
  };
}
