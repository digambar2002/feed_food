import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

class VDonatePage extends StatefulWidget {
  const VDonatePage({super.key});

  @override
  State<VDonatePage> createState() => _VDonatePageState();
}

class _VDonatePageState extends State<VDonatePage> {
  final _formKey = GlobalKey<FormState>();
  String title = '';
  String description = '';
  DateTime date = DateTime.now();
  double maxValue = 0;
  bool? brushedTeeth = false;
  bool enableFeature = false;
  var food_details = TextEditingController();
  var location_details = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Create New Post",
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          elevation: 0.5,
          leading: IconButton(
            onPressed: (() {
              print("hello");
            }),
            icon: const Icon(Icons.close),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: (() => print("hello")),
                  child: Text(
                    "Post",
                    style: TextStyle(
                        color: Colors.deepPurple, fontWeight: FontWeight.w600),
                  ),
                )
              ],
            ),
          ]),
      body: Form(
        key: _formKey,
        child: Align(
          alignment: Alignment.topCenter,
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ...[
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg"),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Text(
                          "Johan Macron",
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    FoodTextField().PostTextArea(
                        "enter food details you have", "hello", food_details),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Food quantity',
                              style: Theme.of(context).textTheme.bodyLarge,
                            ),
                            Row(
                              children: [
                                Text(
                                  intl.NumberFormat.decimalPatternDigits(
                                    decimalDigits: 0,
                                  ).format(maxValue),
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text("person"),
                              ],
                            )
                          ],
                        ),
                        Slider(
                          min: 0,
                          max: 500,
                          divisions: 500,
                          value: maxValue,
                          onChanged: (value) {
                            setState(() {
                              maxValue = value;
                            });
                          },
                        ),
                      ],
                    ),
                    FoodTextField().buildTimeFiled(),
                    FoodTextField()
                        .buildLocation(location_details, "no location found"),
                    _FormDatePicker(
                      date: date,
                      onChanged: (value) {
                        setState(() {
                          date = value;
                        });
                      },
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: brushedTeeth,
                          onChanged: (checked) {
                            setState(() {
                              brushedTeeth = checked;
                            });
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Text(
                              'I assure that food quality and \n hygiene has maintained  ',
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                      width: 360,
                      child: ElevatedButton(
                        onPressed: (() async {
                          await VDonatePage();
                        }),
                        child: Text(
                          "Post",
                          style: TextStyle(fontSize: 24),
                        ),
                        style: ElevatedButton.styleFrom(
                            primary: Colors.deepPurple[400],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                      ),
                    ),
                  ].expand(
                    (widget) => [
                      widget,
                      const SizedBox(
                        height: 24,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _FormDatePicker extends StatefulWidget {
  final DateTime date;
  final ValueChanged<DateTime> onChanged;

  const _FormDatePicker({
    required this.date,
    required this.onChanged,
  });

  @override
  State<_FormDatePicker> createState() => _FormDatePickerState();
}

class _FormDatePickerState extends State<_FormDatePicker> {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Date',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              intl.DateFormat.yMd().format(widget.date),
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
        TextButton(
          child: const Text('Edit'),
          onPressed: () async {
            var newDate = await showDatePicker(
              context: context,
              initialDate: widget.date,
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

            // Don't change the date if the date picker returns null.
            if (newDate == null) {
              return;
            }

            widget.onChanged(newDate);
          },
        )
      ],
    );
  }
}
