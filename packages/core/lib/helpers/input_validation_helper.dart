import 'package:form_validator/form_validator.dart';

class InputValidationHelper {
  static final String? Function(String?) required =
      ValidationBuilder().required().build();

  static String? Function(String?) requiredWithLabel(String label) =>
      ValidationBuilder(requiredMessage: '$label diperlukan')
          .required(label)
          .build();
}
