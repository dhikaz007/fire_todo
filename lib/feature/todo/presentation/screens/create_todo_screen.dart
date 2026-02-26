import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:gap/gap.dart';
import 'package:syncfusion_flutter_core/theme.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../../constant/constant.dart';
import '../../../../extensions/extensions.dart';
import '../../../../helper/loading.dart';
import '../../../../shared/widgets/widgets.dart';
import '../cubit/todo_cubit.dart';

class CreateTodoScreen extends StatefulWidget {
  const CreateTodoScreen({super.key});

  @override
  State<CreateTodoScreen> createState() => _CreateTodoScreenState();
}

class _CreateTodoScreenState extends State<CreateTodoScreen> {
  late final TextEditingController _titleController;
  late final TextEditingController _descriptionController;
  late final TextEditingController _createdController;
  late final GlobalKey<FormState> _formKey;
  DateTime _initialDate = DateTime.now();

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController();
    _descriptionController = TextEditingController();
    _createdController = TextEditingController();
    _formKey = GlobalKey();
  }

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _createdController.dispose();
    super.dispose();
  }

  Future<DateTime?> _pickDate(
    BuildContext context, {
    DateTime? initialDate,
    DateTime? minDate,
    DateTime? maxDate,
  }) async {
    DateTime? temp = initialDate;

    final result = await showAdaptiveDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return AlertDialog.adaptive(
          backgroundColor: ColorApp.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
          contentPadding: const EdgeInsets.all(16),
          content: StatefulBuilder(
            builder: (context, setState) {
              return SizedBox(
                width: 340,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Align(
                      alignment: Alignment.centerLeft,
                      child: TextApp(
                        text: 'Select a date',
                        size: FontAppSize.font_16,
                        weight: FontAppWeight.semiBold,
                      ),
                    ),
                    const Gap(12),
                    SfDateRangePickerTheme(
                      data: SfDateRangePickerThemeData(
                        selectionColor: ColorApp.primary(50),
                        headerBackgroundColor: ColorApp.white,
                      ),
                      child: SfDateRangePicker(
                        backgroundColor: ColorApp.white,
                        initialSelectedDate: initialDate,
                        minDate: minDate,
                        maxDate: maxDate,
                        onSelectionChanged:
                            (DateRangePickerSelectionChangedArgs args) {
                          setState(() => temp = args.value as DateTime?);
                        },
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child:
                  const TextApp(text: 'Cancel', weight: FontAppWeight.medium),
            ),
            ButtonPrimary(
              radius: 20,
              onPressed:
                  temp == null ? null : () => Navigator.pop(context, temp),
              label: 'Ok',
            ),
          ],
        );
      },
    );

    if (result == null) return null;

    final base = DateTime.now();

    return DateTime(
      result.year,
      result.month,
      result.day,
      base.hour,
      base.minute,
      base.second,
      base.millisecond,
      base.microsecond,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ModularListener<TodoCubit, TodoState>(
      listener: (context, state) {
        state.maybeWhen(
          loading: () => LoadingHelper.showLoad(context),
          failed: (errorMessage) async {
            await SnackbarApp.showSnackbar(context,
                msg: errorMessage, type: SnackbarType.failed);
          },
          add: (response) async {
            await SnackbarApp.showSnackbar(
              context,
              msg: 'Success create new todo',
              type: SnackbarType.success,
            );
            if (!context.mounted) return;
            context.read<TodoCubit>().loadTodo();
            Modular.to.pop();
          },
          orElse: () => LoadingHelper.hideLoad(context),
        );
      },
      child: Scaffold(
        backgroundColor: ColorApp.white,
        // appBar: const AppbarApp(
        //   title: 'Create New Todo',
        //   canPop: true,
        // ),
        body: SafeArea(
          bottom: false,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ConstrainedBox(
                constraints: const BoxConstraints(maxHeight: kToolbarHeight),
                child: NavigationToolbar(
                  leading: BackButton(
                    color: ColorApp.black,
                    onPressed: () {
                      Modular.to.maybePop();
                    },
                  ),
                  middle: const TextApp(
                    text: 'Create New Todo',
                    size: FontAppSize.font_20,
                    weight: FontAppWeight.semiBold,
                  ),
                ),
              ),
              Expanded(
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      children: [
                        const Gap(12),
                        TextFormFieldApp(
                          controller: _titleController,
                          hintText: 'Title',
                          textInputAction: TextInputAction.next,
                          borderRadius: 8,
                          enabledBorderColor: ColorApp.grey,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          label: const TextApp(
                            text: 'Title',
                            size: FontAppSize.font_16,
                            weight: FontAppWeight.bold,
                          ),
                        ),
                        const Gap(16),
                        TextFormFieldApp(
                          controller: _descriptionController,
                          hintText: "Description",
                          textInputAction: TextInputAction.next,
                          borderRadius: 8,
                          enabledBorderColor: ColorApp.grey,
                          lines: 5,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          label: const TextApp(
                            text: 'Description',
                            size: FontAppSize.font_16,
                            weight: FontAppWeight.bold,
                          ),
                        ),
                        const Gap(16),
                        TextFormFieldApp(
                          controller: _createdController,
                          hintText: 'Due Date',
                          borderRadius: 8,
                          enabledBorderColor: ColorApp.grey,
                          readOnly: true,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Field is required';
                            }
                            return null;
                          },
                          label: const TextApp(
                            text: 'Due Date',
                            size: FontAppSize.font_16,
                            weight: FontAppWeight.bold,
                          ),
                          suffixIcon: IconButton(
                            visualDensity: VisualDensity.compact,
                            onPressed: () async {
                              final picked = await _pickDate(
                                context,
                                initialDate: _initialDate,
                                minDate: DateTime(2020),
                                maxDate: DateTime(2030),
                              );
                              if (picked != null) {
                                setState(() {
                                  _initialDate = picked;
                                  _createdController.text =
                                      _initialDate.getFullDate();
                                });
                              }
                            },
                            icon: const Icon(Icons.calendar_month,
                                color: ColorApp.black),
                          ),
                        ),
                        const Gap(16),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ButtonPrimary(
                  radius: 24,
                  size: FontAppSize.font_16,
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // print(_initialDate);
                      context.read<TodoCubit>().createTodo(
                            title: _titleController.text,
                            description: _descriptionController.text,
                            createdAt: _initialDate,
                            isDone: false,
                          );
                    }
                  },
                  label: 'Save',
                ),
              ),
              const Gap(40),
            ],
          ),
        ),
      ),
    );
  }
}
