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
  var address_details = TextEditingController();
  var zip_details = TextEditingController();
  TimeOfDay _timeOfDay = TimeOfDay.now();

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
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text("cooking time")),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.alarm_outlined),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  _timeOfDay.format(context).toString(),
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ],
                            ),
                            TextButton(
                                onPressed: _showTimePicker,
                                child: Text("select")),
                          ],
                        ),
                      ),
                    ),
                    Row(children: <Widget>[
                      Expanded(child: Divider()),
                      Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Expanded(child: Divider()),
                    ]),
                    FoodTextField().buildTextArea(
                        "Pickup Addres",
                        "enter your food pickup address",
                        "address not empty",
                        address_details),
                    FoodTextField().buildPincode(
                        "Zip code",
                        "enter food pickup area code",
                        "enter pincode",
                        zip_details),
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
                              'Use my current location \n to pickup food',
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

  void _showTimePicker() {
    showTimePicker(context: context, initialTime: TimeOfDay.now())
        .then((value) {
      setState(() {
        _timeOfDay = value!;
      });
    });
  }
}
