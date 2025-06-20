class FormModelItem {
  final String value;
  final String? error;

 FormModelItem({this.value = '',  this.error});
  FormModelItem copyWith({final String? value, final String? error}) {
    return FormModelItem(
      value: value ?? this.value,
      error: error ,
    );
  }
}
