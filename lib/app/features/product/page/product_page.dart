import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc/app/core/blocs/brand/bloc/brand_bloc.dart';
import 'package:forms_bloc/app/features/product/page/widgets/select_brands.dart';
import 'package:forms_bloc/app/features/product/page/widgets/select_models.dart';
import 'package:forms_bloc/app/injection_container.dart';

import '../../../core/models/select_item.dart';
import '../models/product_form.dart';
import 'bloc/form_product_bloc.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  final GlobalKey _formKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = context.read<FormProductBloc>();

    return Scaffold(
      appBar: AppBar(title: const Text('Novo produto')),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Nome',
                ),
                onChanged: (name) =>
                    bloc.add(FormProductChangePropsEvent(name: name)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Categoria',
                ),
                onChanged: (category) =>
                    bloc.add(FormProductChangePropsEvent(category: category)),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Imagem',
                ),
                onChanged: (image) =>
                    bloc.add(FormProductChangePropsEvent(image: image)),
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  hintText: 'Valor',
                ),
                onChanged: (value) => bloc.add(
                    FormProductChangePropsEvent(value: double.parse(value))),
              ),
              TextFormField(
                decoration: const InputDecoration(
                  hintText: 'Codigo de barras',
                ),
                onChanged: (barCode) =>
                    bloc.add(FormProductChangePropsEvent(barCode: barCode)),
              ),
              const SelectBrands(),
              const SelectModels(),
              BlocBuilder<FormProductBloc, FormProductState>(
                bloc: bloc,
                builder: (context, state) {
                  ProductForm? product;

                  if (state is FormProductChangePropsSuccess) {
                    product = state.product;
                  }

                  return Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Detalhes do prduto',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text("Name: ${product?.name}"),
                        Text("Category: ${product?.category}"),
                        Text("Image: ${product?.image}"),
                        Text("Value: ${product?.value.toString()}"),
                        Text("BarCode: ${product?.barCode}"),
                        Text("Marca: ${product?.brandSelected?.name}"),
                        Text("ModelId: ${product?.modelSelected?.name}"),
                      ],
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
