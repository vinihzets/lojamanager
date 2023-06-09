import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/products/presentation/widgets/show_dialog_widget.dart';

import '../../../home/domain/entities/products_categories_entity.dart';
import '../bloc/product_bloc.dart';
import '../bloc/product_event.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool showTextFieldSizes = false;
  bool showTextFieldImages = false;
  final _formKey = GlobalKey<FormState>();
  late ProductBloc bloc;

  @override
  void initState() {
    bloc = GetIt.I.get();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
    final descripController = TextEditingController();
    final priceController = TextEditingController();
    ProductsCategoriesEntity product =
        ModalRoute.of(context)!.settings.arguments as ProductsCategoriesEntity;

    return Scaffold(
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        actions: [
          IconButton(
              onPressed: () {
                final key = _formKey.currentState!.validate();
                if (key == true) {
                  bloc.event.add(ProductEventChanges(
                      context,
                      nameController.text,
                      descripController.text,
                      priceController.text,
                      product.idCategory,
                      product.id,
                      product.sizes,
                      product.images));
                }
              },
              icon: const Icon(Icons.save)),
          IconButton(
              onPressed: () {
                showDialog(
                    context: context,
                    builder: (context) => ShowDialogWidget(
                          bloc: bloc,
                          id: product.id,
                          categoryId: product.idCategory,
                        ));
              },
              icon: const Icon(Icons.remove)),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const Text(
              'Images',
              style: TextStyle(fontSize: 16, color: Colors.white),
            ),
            const SizedBox(
              height: 6,
            ),
            SizedBox(
                height: 50,
                child: GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.5),
                    scrollDirection: Axis.horizontal,
                    children: product.images
                        .map((e) => GestureDetector(
                              onLongPress: () {
                                product.images.remove(e);
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 3.0),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                alignment: Alignment.center,
                                child: CircleAvatar(
                                  backgroundImage: NetworkImage(e),
                                ),
                              ),
                            ))
                        .toList()
                      ..add(GestureDetector(
                          child: showTextFieldImages == false
                              ? ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white)),
                                  onPressed: () {
                                    setState(() {
                                      showTextFieldImages = true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ))
                              : TextField(
                                  onSubmitted: (value) {
                                    product.images.add(value);
                                    setState(() {
                                      showTextFieldSizes = false;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Url da Imagem',
                                      labelStyle:
                                          TextStyle(color: Colors.white))))))),
            // ImagesWidget(
            //     context: context,
            //     validator: (v) {},
            //     initialValue: product.images),
            TextFormField(
              validator: (v) {
                if (v!.isEmpty) return 'Insira um titulo para o produto';
                return null;
              },
              controller: nameController,
              // initialValue: product.name ?? '',
              decoration: const InputDecoration(
                  hintText: 'Titulo',
                  hintStyle: TextStyle(color: Colors.white)),
            ),
            TextFormField(
                // initialValue: product.description ?? '',
                validator: (v) {
                  if (v!.isEmpty) return 'Insira uma descricao';
                  return null;
                },
                controller: descripController,
                maxLines: 6,
                decoration: const InputDecoration(
                    hintText: 'Descricao',
                    hintStyle: TextStyle(color: Colors.white))),
            TextFormField(
                // initialValue: product.price ?? '',
                controller: priceController,
                validator: (v) {
                  if (v != null) {
                    if (!v.contains(".") || v.split('.')[1].length != 2) {
                      return 'Utilize duas casas decimais';
                    }
                  } else {
                    return 'Preco invalido';
                  }
                  return null;
                },
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: 'Preco',
                    hintStyle: TextStyle(color: Colors.white))),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
                height: 34,
                child: GridView(
                    padding: const EdgeInsets.symmetric(horizontal: 4.0),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 1,
                            mainAxisSpacing: 8.0,
                            childAspectRatio: 0.5),
                    scrollDirection: Axis.horizontal,
                    children: product.sizes
                        .map((e) => GestureDetector(
                              onLongPress: () {
                                product.sizes.remove(e);
                                setState(() {});
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: Colors.white, width: 3.0),
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(5))),
                                alignment: Alignment.center,
                                child: Text(e),
                              ),
                            ))
                        .toList()
                      ..add(GestureDetector(
                          child: showTextFieldSizes == false
                              ? ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white)),
                                  onPressed: () {
                                    setState(() {
                                      showTextFieldSizes = true;
                                    });
                                  },
                                  child: const Icon(
                                    Icons.add,
                                    color: Colors.black,
                                  ))
                              : TextField(
                                  onSubmitted: (value) {
                                    product.sizes.add(value);
                                    setState(() {
                                      showTextFieldSizes = false;
                                    });
                                  },
                                  decoration: const InputDecoration(
                                      labelText: 'Tamanho',
                                      labelStyle:
                                          TextStyle(color: Colors.white))))))),
          ],
        ),
      ),
    );
  }
}
