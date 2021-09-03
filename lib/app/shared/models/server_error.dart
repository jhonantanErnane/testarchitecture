class ServerError {
  late bool hasError;
  late List<ErrorsMessage>? errorsMessage;
  late int code;

  ServerError({
    required this.hasError,
    required this.errorsMessage,
    required this.code,
  });

  ServerError.fromJson(Map<String, dynamic> json) {
    hasError = json['hasError'];
    if (json['errorsMessage'] != null) {
      errorsMessage = [];
      json['errorsMessage'].forEach((v) {
        errorsMessage!.add(new ErrorsMessage.fromJson(v));
      });
    }
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['hasError'] = this.hasError;
    if (this.errorsMessage != null) {
      data['errorsMessage'] =
          this.errorsMessage!.map((v) => v.toJson()).toList();
    }
    data['code'] = this.code;
    return data;
  }
}

class ErrorsMessage {
  late String field;
  late String message;

  ErrorsMessage({required this.field, required this.message});

  ErrorsMessage.fromJson(Map<String, dynamic> json) {
    this.field = json['field'];
    this.message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['field'] = this.field;
    data['message'] = this.message;
    return data;
  }
}
