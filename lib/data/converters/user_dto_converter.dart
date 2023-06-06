import 'package:dictionary/data/converters/base_converter.dart';
import 'package:dictionary/data/dto/user_dto.dart';
import 'package:dictionary/domains/models/user_model.dart';

class UserDTOConverter extends BaseConverter<UserDTO, UserModel> {
  @override
  UserModel processConvertInToOut(UserDTO inObject) {
    return UserModel(
      id: inObject.id,
      email: inObject.email,
      name: inObject.name,
      photoUrl: inObject.photoUrl,
    );
  }

  @override
  UserDTO processConvertOutToIn(UserModel outObject) {
    return UserDTO(
      id: outObject.id,
      email: outObject.email,
      name: outObject.name,
      photoUrl: outObject.photoUrl,
    );
  }
}
