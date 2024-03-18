import 'package:amruta_ayurveda/logic/provider/signup_provider.dart';
import 'package:amruta_ayurveda/presentation/widgets/primary_button.dart';
import 'package:amruta_ayurveda/presentation/widgets/spacer_widgets.dart';
import 'package:amruta_ayurveda/presentation/widgets/text_fields.dart';
import 'package:flutter/material.dart';

AddTreatment(
    {required BuildContext context, required SignUpProvider provider}) {
  // cubit.nameController.clear();
  // cubit.discriptionController..clear();
  // cubit.isColor = false;
  // cubit.isSize = false;
  // cubit.isProduction = false;
  // if (action == 'Edit' && item != null) {
  //   cubit.eId = item.categoryId;
  //   cubit.action = action!;
  //   cubit.nameController.text = item.categoryName;
  //   cubit.discriptionController.text = item.discription;
  //   cubit.isColor = item.isColorApplicable;
  //   cubit.isSize = item.isSizeApplicable;
  //   cubit.isProduction = item.isProductionItem;
  //   cubit.isProduct = item.isProduct;
  // }

  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Form(
            key: provider.formKeyDialog,
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Choose Treatment'),
                    Devider(
                      height: 15,
                    ),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      style: const TextStyle(fontSize: 10),
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(8))),
                        hintText: 'Choose prefered treatment',
                      ),
                    ),
                    Devider(
                      height: 15,
                    ),
                    Text('Add Petients'),
                    Devider(
                      height: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: DefaultTextFormField(
                            textController: provider.maeController,
                            label: 'Male',
                            islabel: true,
                            readOnly: true,
                          ),
                        ),
                        Devider(
                          width: 20,
                        ),
                        circularButton(
                          onPressed: '',
                          context: context,
                          icon: Icons.minimize_outlined,
                        ),
                        Expanded(
                          child: DefaultTextFormField(
                            textController: provider.maeController,
                            readOnly: true,
                          ),
                        ),
                        circularButton(
                          onPressed: '',
                          context: context,
                          icon: Icons.add,
                        ),
                      ],
                    ),
                    Devider(
                      height: 15,
                    ),
                    Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: DefaultTextFormField(
                            textController: provider.maeController,
                            label: 'Female',
                            islabel: true,
                            readOnly: true,
                          ),
                        ),
                        Devider(
                          width: 20,
                        ),
                        circularButton(
                          onPressed: '',
                          context: context,
                          icon: Icons.minimize_outlined,
                        ),
                        Expanded(
                          child: DefaultTextFormField(
                            textController: provider.maeController,
                            readOnly: true,
                          ),
                        ),
                        circularButton(
                          onPressed: '',
                          context: context,
                          icon: Icons.add,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
          actions: [
            PrimaryButton(
              label: 'Save',
              onPressed: () {},
            ),
          ],
        );
      });
}
