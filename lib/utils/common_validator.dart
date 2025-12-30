class CommonValidator {
  static final mobileRegex = RegExp(r'^[6-9]\d{9}$');
  static final emailRegex = RegExp(r'^[\w\.-]+@[a-zA-Z\d-]+(\.[a-zA-Z\d-]+)*\.[a-zA-Z]{2,}$');
  static final doubleRegex = RegExp(r'^\d+(\.\d+)?$');
  static final intRegex = RegExp(r'^(0|[1-9]\d*)$');
  static final gstRegex = RegExp(r'^\d{2}[A-Z]{5}\d{4}[A-Z][A-Z0-9]Z[A-Z0-9]$', caseSensitive: false,);
  static final panRegex = RegExp(r'^[a-zA-Z]{5}[0-9]{4}[a-zA-Z]$',caseSensitive: false);


  static String? stringValidator(value,title){
    if(value!=null&& value!=""){
      return null;
    }
    return "${title} is Required!";
  }
  static String? passwordValidator(value){
    if(value!=null&& value!=""){
      return null;
    }
    return "Password is Required!";
  }
  static String? confirmPasswordValidator(password,confirmPassword){
    if(password!=null&& confirmPassword!=""){
      if(password==confirmPassword){
        return null;
      }
      return "Password and confirm password do not match!";
    }
    return "Confirm password  is Required!";

  }
  static String? emailValidator(value){
    if(value!=null&& value!=""){
      if(emailRegex.hasMatch(value)){
        return null;
      }
      return "Email is Invalid!";
    }
    return "Email is Required!";
  }

  static String? mobileValidator(value){
    if(value!=null&& value!=""){
      if(mobileRegex.hasMatch(value)){
        return null;
      }
      return "Mobile is Invalid!";
    }
    return "Mobile is Required!";
  }
  static String? integerValidator(value){
    if(value!=null&& value!=""){
      if(intRegex.hasMatch(value)){
        return null;
      }
      return "Number is Invalid!";
    }
    return "Number is Required!";
  }
  static String? doubleValidator(value){
    if(value!=null&& value!=""){
      if(doubleRegex.hasMatch(value)){
        return null;
      }
      return "Number is Invalid!";
    }
    return "Number is Required!";
  }
  static String? emailValidatorNotRequired(value){
    if(value!=null&& value!=""){
      if(emailRegex.hasMatch(value)){
        return null;
      }
      return "Email is Invalid!";
    }
    return null;
  }

  static String? mobileValidatorNotRequired(value){
    if(value!=null&& value!=""){
      if(mobileRegex.hasMatch(value)){
        return null;
      }
      return "Mobile is Invalid!";
    }
    return null;
  }
  static String? integerValidatorNotRequired(value){
    if(value!=null&& value!=""){
      if(intRegex.hasMatch(value)){
        return null;
      }
      return "Number is Invalid!";
    }
    return null;
  }
  static String? doubleValidatorNotRequired(value){
    if(value!=null&& value!=""){
      if(doubleRegex.hasMatch(value)){
        return null;
      }
      return "Number is Invalid!";
    }
    return null;
  }
}