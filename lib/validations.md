## Username

String? validateUsername(String username) {
if (username.length < 3 || username.length > 30) {
return 'Username must be between 3 and 30 characters long';
}

if (username.contains(' ')) {
return 'Username cannot contain spaces';
}

final validUsernameRegex = RegExp(r'^[a-zA-Z-]+$');
if (!validUsernameRegex.hasMatch(username)) {
return 'Username can only contain letters and hyphens';
}

if (username.contains('"') || username.contains("'")) {
return 'Username cannot contain quotation marks';
}

final nameParts = username.split('-');
if (nameParts.length > 2) {
return 'Username can only contain two names';
}

return null;
}

## email

String? validateEmail(String email) {
if (email.length < 3 || email.length > 320) {
return 'Email must be between 3 and 320 characters long';
}

if (!email.contains('@')) {
return 'Email must contain the "@" symbol';
}

final localPart = email.split('@')[0];
final localPartRegex = RegExp(r'^[a-zA-Z0-9]+$');
if (!localPartRegex.hasMatch(localPart)) {
return 'The part before the "@" can only contain alphanumeric characters';
}

final domainPart = email.split('@')[1];
final domainRegex = RegExp(r'^[a-zA-Z0-9-]+\.[a-zA-Z]{2,}$');
if (!domainRegex.hasMatch(domainPart)) {
return 'Email domain is invalid';
}

if (email.contains(' ')) {
return 'Email cannot contain spaces';
}

return null;
}

## Passwort

String? validatePassword(String password) {
if (password.length < 8 || password.length > 100) {
return 'Password length must be between 8 and 100 characters';
}

if (!RegExp(r'[A-Z]').hasMatch(password)) {
return 'Password must have at least one uppercase letter';
}

if (!RegExp(r'[a-z]').hasMatch(password)) {
return 'Password must have at least one lowercase letter';
}

if (!RegExp(r'[0-9]').hasMatch(password)) {
return 'Password must have at least one number';
}

if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
return 'Password must include at least one special character';
}

if (RegExp(r'12345678').hasMatch(password) || RegExp(r'1234').hasMatch(password)) {
return 'Password contains simple number sequences';
}

if (RegExp(r'(.)\1\1').hasMatch(password)) {
return 'Password contains repeated characters';
}

return null;
}

String? validatePasswordConfirmation(String password, String confirmPassword) {
if (password != confirmPassword) {
return 'Password and confirmation do not match';
}

return null;
}
