class Validators {
  final String? field;
  Validators({this.field});

  String? required(String? value){
    if(value!.isEmpty){
      return '${field ?? 'This field'} is required';
    }
    return null;
  }
}