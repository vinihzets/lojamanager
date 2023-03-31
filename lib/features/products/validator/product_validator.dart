class ProductValidator {
  String validateTitle(String text) {
    if (text.isEmpty) return 'Preencha o titulo do produto';
    return '';
  }

  String validateDescription(String description) {
    if (description.isEmpty) return 'Preencha a descricao do produto';
    return '';
  }

  String validatePrice(String price) {
    if (price != null) {
      if (!price.contains(".") || price.split('.')[1].length != 2) {
        return 'Utilize duas casas decimais';
      }
    } else {
      return 'Preco invalido';
    }
    return '';
  }
}
