import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/products/presentation/bloc/product_bloc.dart';
import 'package:lojamanager/features/products/presentation/bloc/product_event.dart';
import 'package:lojamanager/features/products/presentation/widgets/images_widget.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
  bool showTextField = false;
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
                inspect(product.sizes);
                final key = _formKey.currentState!.validate();
                if (key == true) {
                  bloc.event.add(ProductEventChanges(
                      context,
                      nameController.text,
                      descripController.text,
                      priceController.text,
                      product.idCategory,
                      product.id,
                      product.sizes));
                }
              },
              icon: const Icon(Icons.save)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
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
            ImagesWidget(
                context: context,
                validator: (v) {},
                initialValue: product.images),
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
                  if (v!.isEmpty) return 'Insira um valor';
                  return null;
                },
                keyboardType:
                    const TextInputType.numberWithOptions(decimal: true),
                decoration: const InputDecoration(
                    hintText: 'Preco',
                    hintStyle: TextStyle(color: Colors.white))),
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
                          child: showTextField == false
                              ? ElevatedButton(
                                  style: const ButtonStyle(
                                      backgroundColor: MaterialStatePropertyAll(
                                          Colors.white)),
                                  onPressed: () {
                                    setState(() {
                                      showTextField = true;
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
                                      showTextField = false;
                                    });
                                  },
                                  decoration: InputDecoration(
                                      labelText: 'Tamanho',
                                      labelStyle:
                                          TextStyle(color: Colors.white))))))),
          ],
        ),
      ),
    );
  }
}
