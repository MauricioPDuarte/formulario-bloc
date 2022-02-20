import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forms_bloc/app/core/blocs/model/bloc/model_bloc.dart';
import 'package:forms_bloc/app/core/models/model.dart';

import '../../../../injection_container.dart';

class SelectModels extends StatefulWidget {
  const SelectModels({Key? key}) : super(key: key);

  @override
  State<SelectModels> createState() => _SelectModelsState();
}

class _SelectModelsState extends State<SelectModels> {
  @override
  Widget build(BuildContext context) {
    var bloc = sl.get<ModelBloc>();

    return BlocBuilder<ModelBloc, ModelState>(
      builder: (context, state) {
        return DropdownButton<Model>(
          items: bloc.models
              .map((model) => DropdownMenuItem<Model>(
                    child: Text(model.name),
                    value: model,
                  ))
              .toList(),
          onChanged: (value) {
            bloc.add(
              ChangeSelectedModelEvent(
                selectedModel: value,
              ),
            );
          },
          icon: state is ModelLoadingState
              ? const CircularProgressIndicator()
              : null,
          hint: const Text("Selecione um modelo..."),
          value: bloc.selectedModel,
        );
      },
    );
  }
}
