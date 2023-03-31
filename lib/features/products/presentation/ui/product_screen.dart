import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:lojamanager/features/home/domain/entities/products_categories_entity.dart';
import 'package:lojamanager/features/products/presentation/bloc/product_bloc.dart';
import 'package:lojamanager/features/products/presentation/bloc/product_event.dart';

class ProductScreen extends StatefulWidget {
  const ProductScreen({super.key});

  @override
  State<ProductScreen> createState() => _ProductScreenState();
}

class _ProductScreenState extends State<ProductScreen> {
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
                      product.id));
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
          ],
        ),
      ),
    );
  }
}
