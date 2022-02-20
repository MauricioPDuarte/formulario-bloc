import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc/app/core/blocs/brand/bloc/brand_bloc.dart';
import 'package:forms_bloc/app/features/product/page/bloc/form_product_bloc.dart';

import '../../../../core/models/brand.dart';
import '../../../../injection_container.dart';

class SelectBrands extends StatefulWidget {
  const SelectBrands({Key? key}) : super(key: key);

  @override
  State<SelectBrands> createState() => _SelectBrandsState();
}

class _SelectBrandsState extends State<SelectBrands> {
  Brand? brandSelected;

  @override
  void initState() {
    sl.get<BrandBloc>().add(FetchAllBrandsEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var bloc = sl.get<BrandBloc>();

    return BlocBuilder<BrandBloc, BrandState>(
      bloc: bloc,
      builder: (context, state) {
        BrandState state = bloc.state;

        return DropdownButton<Brand>(
          items: bloc.brands
              .map((model) => DropdownMenuItem<Brand>(
                    child: Text(model.name),
                    value: model,
                  ))
              .toList(),
          onChanged: (value) {
            bloc.add(
              ChangeSelectedBrandEvent(
                selectedBrand: value!,
              ),
            );
          },
          icon: state is BrandLoadingState
              ? const CircularProgressIndicator()
              : null,
          hint: const Text("Selecione uma marca..."),
          value: bloc.selectedBrand,
        );
      },
    );
  }
}
