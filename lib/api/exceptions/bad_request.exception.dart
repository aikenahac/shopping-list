import 'dart:io';

class BadRequestException extends HttpException {
  BadRequestException(String message) : super(message);
}
