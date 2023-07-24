import 'package:greengrocer/src/models/item_model.dart';

class AppData {
  ItemModel apple = ItemModel(
    description:
        'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
    imgUrl: 'assets/images/fruits/apple.png',
    itemName: 'Maçã',
    price: 5.5,
    unit: 'kg',
    category: 'Frutas',
  );

  ItemModel grape = ItemModel(
    imgUrl: 'assets/images/fruits/grape.png',
    itemName: 'Uva',
    price: 7.4,
    unit: 'kg',
    category: 'Frutas',
    description:
        'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  );

  ItemModel guava = ItemModel(
    imgUrl: 'assets/images/fruits/guava.png',
    itemName: 'Goiaba',
    price: 11.5,
    unit: 'kg',
    category: 'Frutas',
    description:
        'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  );

  ItemModel kiwi = ItemModel(
    imgUrl: 'assets/images/fruits/kiwi.png',
    itemName: 'Kiwi',
    price: 2.5,
    unit: 'un',
    category: 'Frutas',
    description:
        'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  );

  ItemModel mango = ItemModel(
    imgUrl: 'assets/images/fruits/mango.png',
    itemName: 'Manga',
    price: 2.5,
    unit: 'un',
    category: 'Frutas',
    description:
        'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  );

  ItemModel papaya = ItemModel(
    imgUrl: 'assets/images/fruits/papaya.png',
    itemName: 'Mamão papaya',
    price: 8,
    unit: 'kg',
    category: 'Frutas',
    description:
        'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  );

  List<ItemModel> getItems({String? category}) {
    List<ItemModel> itemsNoFilter = [
      apple,
      grape,
      guava,
      kiwi,
      mango,
      papaya,
    ];

    if (category == null || category == 'Tudo') return itemsNoFilter;

    List<ItemModel> itemsFiltered = [];

    for (var item in itemsNoFilter) {
      if (item.category.toLowerCase() == category.toLowerCase()) {
        itemsFiltered.add(item);
      }
    }

    return itemsFiltered;
  }

  List<String> categories = [
    'Tudo',
    'Frutas',
    'Legumes',
    'Verduras',
    'Grãos',
    'Temperos',
    'Diversos',
  ];
}
