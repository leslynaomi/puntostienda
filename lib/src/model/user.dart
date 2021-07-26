import 'package:equatable/equatable.dart';

class MyUser extends Equatable {
  final String id;
  final String name;
  final String lastname;
  final int number;
  final String? image;

  MyUser(this.id, this.name, this.lastname, this.number, {this.image});

  @override

  List<Object?> get props => [id];
  Map<String, Object?> toFirebaseMap({String? newImage}) {
    return <String, Object?>{
      'id': id,
      'name': name,
      'lastname': lastname,
      'number': number,
      'image': newImage ?? image,
    };
  }

  MyUser.fromFirebaseMap(Map<String, Object?> data)
      : id = data['id'] as String,
        name = data['name'] as String,
        lastname = data['lastname'] as String,
        number = data['number'] as int,
        image = data['image'] as String?;
}
