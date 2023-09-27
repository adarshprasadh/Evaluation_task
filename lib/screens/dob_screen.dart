import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:evaltask_dob/constants/appconstants.dart';
import 'package:evaltask_dob/widgets/date_format.dart';

class CustomDob extends StatelessWidget {
  const CustomDob({Key? key}) : super(key: key);

  static List<TextInputFormatter> dob = <TextInputFormatter>[
    LengthLimitingTextInputFormatter(10),
    FilteringTextInputFormatter.allow(RegExp(AppConstants.regexValue)),
    DateFormatter()
  ];

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    final DateFormatter dateFormatter = DateFormatter();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          AppConstants.panDetails,
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          const Center(
            child: Text(
              AppConstants.dateofbirth,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Flexible(
                  flex: 2,
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      ValueListenableBuilder(
                        valueListenable: controller,
                        builder: (context, snapshot, _) {
                          return Row(
                            children: [
                              Text(
                                dateFormatter.getFormattedDate(controller.text),
                                style: const TextStyle(
                                  color: Color.fromARGB(255, 201, 200, 200),
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                      TextField(
                        controller: controller,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: false,
                        ),
                        inputFormatters: dob,
                        style: const TextStyle(fontSize: 16),
                        decoration: const InputDecoration(
                          suffixIcon: Icon(Icons.calendar_month),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
