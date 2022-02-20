import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc/app/core/blocs/brand/bloc/brand_bloc.dart';
import 'package:forms_bloc/app/core/blocs/model/bloc/model_bloc.dart';
import 'package:forms_bloc/app/features/product/page/bloc/form_product_bloc.dart';
import 'package:forms_bloc/app/features/product/page/widgets/select_brands.dart';
import 'package:forms_bloc/app/features/product/page/widgets/select_models.dart';

import 'features/product/models/product_form.dart';
import 'features/product/page/product_page.dart';

import 'injection_container.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MultiBlocProvider(
        providers: [
          BlocProvider<FormProductBloc>(
            create: (context) => sl(),
          ),
          BlocProvider<BrandBloc>(create: (context) => sl()),
          BlocProvider<ModelBloc>(create: (context) => sl()),
        ],
        child: const ProductPage(),
      ),
    );
  }
}
