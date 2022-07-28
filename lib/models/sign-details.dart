import 'dart:typed_data';

class Details {
  String firstName;
  String secondName;
  String occupation;
  Uint8List signature;

  Details(this.firstName, this.secondName, this.occupation,this.signature);

  Map<String, dynamic> toJson() => {
      'firstName': firstName,
      'secondName':secondName,
      'occupation':occupation,
      'signature': signature,
  };
}
