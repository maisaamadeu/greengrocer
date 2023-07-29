import 'package:greengrocer/src/models/cart_item_model.dart';
import 'package:greengrocer/src/models/item_model.dart';
import 'package:greengrocer/src/models/order_model.dart';
import 'package:greengrocer/src/models/user_model.dart';

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

  List<CartItemModel> getCartItems() => [
        CartItemModel(item: apple, quantity: 2),
        CartItemModel(item: grape, quantity: 4),
        CartItemModel(item: guava, quantity: 8),
        CartItemModel(item: kiwi, quantity: 16),
        CartItemModel(item: mango, quantity: 32),
        CartItemModel(item: papaya, quantity: 64),
      ];

  UserModel user = UserModel(
    fullName: 'Maísa Amadeu',
    userName: 'Deheane',
    phoneNumber: '15998998999',
    email: 'email@example.com',
    cpf: '12345678900',
    password: '12345678',
  );

  List<OrderModel> getOrders() => [
        // Pedido 01
        OrderModel(
          copyAndPaste: 'q1w2e3r4t5y6',
          createdDateTime: DateTime.parse(
            '2022-06-08 10:00:10.458',
          ),
          overdueDateTime: DateTime.parse(
            '2023-08-08 11:00:10.458',
          ),
          id: 'asd6a54da6s2d1',
          status: 'pending_payment',
          total: 11.0,
          items: [
            CartItemModel(
              item: apple,
              quantity: 2,
            ),
            CartItemModel(
              item: mango,
              quantity: 2,
            ),
          ],
        ),

        // Pedido 02
        OrderModel(
          copyAndPaste: 'q1w2e3r4t5y6',
          createdDateTime: DateTime.parse(
            '2022-06-08 10:00:10.458',
          ),
          overdueDateTime: DateTime.parse(
            '2025-06-08 11:00:10.458',
          ),
          id: 'a65s4d6a2s1d6a5s',
          status: 'delivered',
          total: 11.5,
          items: [
            CartItemModel(
              item: guava,
              quantity: 1,
            ),
          ],
        ),
      ];
}
