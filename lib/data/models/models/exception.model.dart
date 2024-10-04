abstract class ExceptionModel {
  ExceptionModel({
      this.detail, 
      this.code});



  String? detail;
  String? code;

  ExceptionModel.fromJson();
  Map<String, dynamic> toJson();

}