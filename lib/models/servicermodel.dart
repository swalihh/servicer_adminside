class ServicerModel {
  final int id;
  final String username;
  final String email;
  final String phone;
  final String password;
  final String otp;
  final String fullname;
  final String description;
  final String serviceCategory;
  final String verificationDocument;
  final double amount;
  final String location;
  final String servicerImage;
  final String servicerDocument;
  final String status;

  ServicerModel({
    required this.id,
    required this.username,
    required this.email,
    required this.phone,
    required this.password,
    required this.otp,
    required this.fullname,
    required this.description,
    required this.serviceCategory,
    required this.verificationDocument,
    required this.amount,
    required this.location,
    required this.servicerImage,
    required this.servicerDocument,
    required this.status,
  });

  factory ServicerModel.fromJson(Map<String, dynamic> json) {
    return ServicerModel(
      id: json['id'] as int,
      username: json['username'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String,
      otp: json['otp'] as String,
      fullname: json['fullname'] as String,
      description: json['description'] as String,
      serviceCategory: json['servicecatagory'] as String,
      verificationDocument: json['verificationdocument'] as String,
      amount: json['amount'] as double,
      location: json['location'] as String,
      servicerImage: json['servicerimage'] as String,
      servicerDocument: json['servicerdocument'] as String,
      status: json['status'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'username': username,
      'email': email,
      'phone': phone,
      'password': password,
      'otp': otp,
      'fullname': fullname,
      'description': description,
      'servicecatagory': serviceCategory,
      'verificationdocument': verificationDocument,
      'amount': amount,
      'location': location,
      'servicerimage': servicerImage,
      'servicerdocument': servicerDocument,
      'status': status,
    };
  }
}
 
 