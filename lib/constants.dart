final nameRegExp = RegExp('[a-zA-Z]');
final passwordRegExp =
    RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d@$!%*#?&]{8,}$');

const kMaxNameLength = 50;
const kMinNameLength = 3;

const kMinPasswordLength = 3;
