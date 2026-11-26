import 'package:evently_app/ui/screen/add_event/widget/add_event_section.dart';
import 'package:evently_app/ui/screen/add_event/widget/custom_date_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../core/utils/app_colors.dart';
import '../../../core/utils/app_styles.dart';
import '../../../core/utils/size_utils.dart';
import '../../../l10n/app_localizations.dart';
import '../../../model/category.dart';
import '../../../providers/app_language_provider.dart';
import '../../../providers/app_theme_provider.dart';
import '../../common/widgets/custom_elevated_button.dart';
import '../../common/widgets/custom_text_field.dart';
import '../home/taps/widget/category_item.dart';

class AddEventScreen extends StatefulWidget {
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  List<Category> categoryEvent = Category.getCategories();
  int selectedIndex = 0;
  DateTime? selectedDate;
  String formatDate = '';
  TimeOfDay? selectedTime;
  String formatTime = '';
  String title = '';
  String description = '';
  late AppLanguageProvider languageProvider;
  var formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var width = context.width;
    var height = context.height;
    var local = AppLocalizations.of(context)!;
    languageProvider = Provider.of<AppLanguageProvider>(context);
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          local.add_event,
          style: Theme.of(context).textTheme.titleSmall,
        ),
        leading: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.01,
          ),
          child: IconButton(
            style: IconButton.styleFrom(
              backgroundColor: Theme.of(context).highlightColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6),
                side: BorderSide(
                  color: Theme.of(context).dividerColor,
                  width: 2,
                ),
              ),
            ),
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_outlined,
              color: themeProvider.isDarkMode()
                  ? AppColors.whiteColor
                  : AppColors.mainLightColor,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: width * 0.02,
            vertical: height * 0.01,
          ),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              spacing: height * 0.015,
              children: [
                AddEventSection(selectedIndex: selectedIndex),
                SizedBox(
                  height: height * 0.05,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return InkWell(
                        splashColor: AppColors.transparentColor,
                        onTap: () {
                          selectedIndex = index;
                          setState(() {});
                        },
                        child: CategoryItem(
                          category: categoryEvent[index],
                          isSelected: selectedIndex == index,
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return SizedBox(width: width * 0.02);
                    },
                    itemCount: categoryEvent.length,
                  ),
                ),
                Text(
                  local.title,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CustomTextField(
                  hintText: local.event_title,
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  onChanged: (text) {
                    title = text;
                  },
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return local.please_enter_title;
                    }
                    return null;
                  },
                ),
                Text(
                  local.event_description,
                  style: Theme.of(context).textTheme.headlineMedium,
                ),
                CustomTextField(
                  maxLines: 3,
                  hintText: local.event_description,
                  hintStyle: Theme.of(context).textTheme.bodyLarge,
                  onChanged: (text) {
                    description = text;
                  },
                  validator: (text) {
                    if (text == null || text.trim().isEmpty) {
                      return local.please_enter_description;
                    }
                    return null;
                  },
                ),
                CustomDateTimeWidget(
                  icon: Icons.date_range_outlined,
                  eventDateOrTime: local.event_date,
                  chooseDateOrTime: selectedDate == null
                      ? local.choose_date
                      : formatDate,
                  onPressed: chooseDate,
                ),
                CustomDateTimeWidget(
                  icon: Icons.timer_outlined,
                  eventDateOrTime: local.event_time,
                  chooseDateOrTime: selectedTime == null
                      ? local.choose_time
                      : formatTime,
                  onPressed: chooseTime,
                ),
                CustomElevatedButton(
                  verticalPadding: height * 0.01,
                  onPressed: addEvent,
                  child: Text(local.add_event, style: AppStyles.medium20White),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void addEvent() {
    if (formKey.currentState?.validate() == true) {
      //todo: add event to database
    }
  }

  void chooseDate() async {
    var chooseDate = await showDatePicker(
      context: context,
      locale: Locale(languageProvider.language),
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(Duration(days: 365)),
    );
    if (chooseDate != null) {
      selectedDate = chooseDate;
    }
    formatDate = DateFormat(
      'dd/MM/yyy',
      languageProvider.language,
    ).format(selectedDate!);
    setState(() {});
  }

  void chooseTime() async {
    var chooseTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (chooseTime != null) {
      selectedTime = chooseTime;
    }
    formatTime = selectedTime!.format(context);
    setState(() {});
  }
}
