class FormsValidator {
  
  FormsValidator();

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório!';
    } else if (value != null) {
      if (!value.contains('@')) {
        return 'E-mail deve conter "@"';
      }
    }
    return null;
  }

  String? validatePhone(String? value) {
    const String patttern = r'^(\d{2}) (\d{5}-\d{4})$';
    RegExp re = RegExp(patttern);
    if (value == null || value.isEmpty) {
      return 'Informe seu telefone';
    } else if (value.length != 13 || !re.hasMatch(value)) {
      return 'Telefone deve ser informado no formato NN NNNNN-NN';
    }
    return null;
  }

  String? nullValidate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return null;
    }
  }
}
