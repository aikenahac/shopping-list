import 'dart:io';

class ForbiddenException extends HttpException {
  ForbiddenException(String message) : super(message);
}
