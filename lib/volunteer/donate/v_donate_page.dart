import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:feed_food/models/food_post_model.dart';
import 'package:feed_food/utils/globals.dart';
import 'package:feed_food/volunteer/donate/get_location.dart';
import 'package:feed_food/widgets/text_fields.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;

import '../../utils/routes.dart';

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
  double maxValue = 2;
  bool? brushedTeeth = false;
  bool enableFeature = false;
  var food_details = TextEditingController();
  var address_details = TextEditingController();
  var zip_details = TextEditingController();
  String? lattitude;
  String? longitude;
  TimeOfDay _timeOfDay = TimeOfDay.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          // ignore: prefer_const_constructors
          title: Text(
            "Create New Post",
            // ignore: prefer_const_constructors
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 18,
              color: Colors.black87,
            ),
          ),
          elevation: 0.5,
          leading: IconButton(
            onPressed: (() {
              Navigator.pushReplacementNamed(
                  context, FeedFoodRoutes().vMainRoute);
            }),
            icon: const Icon(Icons.close),
          ),
          actions: [
            Row(
              children: [
                TextButton(
                  onPressed: (() async {
                    await postRequest(context);
                  }),
                  child: const Text(
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
                        const CircleAvatar(
                          backgroundImage: NetworkImage(
                              "https://png.pngtree.com/png-vector/20191101/ourmid/pngtree-cartoon-color-simple-male-avatar-png-image_1934459.jpg"),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          UserUsername,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                    FoodTextField().PostTextArea("enter food details you have",
                        "value cannot empty", food_details),
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
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text("person"),
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
                    const Align(
                        alignment: Alignment.topLeft,
                        child: Text("cooking time")),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.alarm_outlined),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                _timeOfDay.format(context).toString(),
                                style: const TextStyle(color: Colors.black54),
                              ),
                            ],
                          ),
                          TextButton(
                              onPressed: _showTimePicker,
                              child: const Text("select")),
                        ],
                      ),
                    ),
                    Row(children: const <Widget>[
                      Expanded(child: Divider()),
                      Text(
                        "Address",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Expanded(child: Divider()),
                    ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Checkbox(
                          value: brushedTeeth,
                          onChanged: (checked) async {
                            setState(() {
                              brushedTeeth = checked;
                            });

                            if (checked!) {
                              showDialog(
                                  context: context,
                                  barrierDismissible: false,
                                  builder: ((context) {
                                    return const Center(
                                      child: CircularProgressIndicator(),
                                    );
                                  }));

                              Map<String, dynamic?> data =
                                  await GetLocatinState().getAddress();

                              setState(() {
                                address_details.text =
                                    data['locality'] + ", " + data['country'];

                                zip_details.text = data['zip_code'];
                                lattitude = data['lattitude'].toString();
                                longitude = data['longitude'].toString();

                                Navigator.of(context).pop();
                              });
                            }
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20, horizontal: 15),
                          child: Text('use my current location',
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ],
                    ),
                    FoodTextField().buildTextArea(
                        "Pickup Addres",
                        "enter your food pickup address",
                        "address not empty",
                        address_details),
                    FoodTextField().buildPincode(
                        "Zip code",
                        "enter food pickup area code",
                        "zip code cannot empty",
                        zip_details),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 50,
                      width: 360,
                      child: ElevatedButton(
                        onPressed: (() async {
                          await postRequest(context);
                        }),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.deepPurple[400],
                            foregroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            )),
                        child: const Text(
                          "Post",
                          style: TextStyle(fontSize: 24),
                        ),
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

  Future postRequest(BuildContext context) async {
    // checking form is correct
    if (_formKey.currentState!.validate()) {
      showDialog(
          context: context,
          barrierDismissible: false,
          builder: ((context) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }));

      dynamic reponse = await FoodPostModel().InsertFoodPostData(
          UserAccountNo,
          food_details.text,
          maxValue.toString(),
          _timeOfDay.format(context).toString(),
          address_details.text,
          zip_details.text,
          longitude.toString(),
          lattitude.toString(),
          'new');

      if (reponse == true) {
        // ignore: use_build_context_synchronously
        Navigator.of(context).pop();
        AwesomeDialog(
          context: context,
          dialogType: DialogType.success,
          animType: AnimType.scale,
          title: 'Food Request Submitted',
          desc: 'Thanks for donating food',
          btnOkOnPress: () {
            Navigator.pushReplacementNamed(
                context, FeedFoodRoutes().vMainRoute);
          },
        ).show();
      }
    } else {}
  }
}
