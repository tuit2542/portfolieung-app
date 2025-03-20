import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map_cancellable_tile_provider/flutter_map_cancellable_tile_provider.dart';
import 'package:flutter_map_compass/flutter_map_compass.dart';
import 'package:latlong2/latlong.dart';
import 'package:pongsathorn_port_app/src/features/core_page.dart';
import 'package:pongsathorn_port_app/src/shared/utils/function.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/appbar_widget.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/button_widget.dart';
import 'package:pongsathorn_port_app/src/shared/widgets/hover_widget.dart';
import 'package:pongsathorn_port_app/src/styles/colors_theme.dart';
import 'package:pongsathorn_port_app/src/styles/text_style.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController =
      TextEditingController(text: "pongsathorn4542@gmail.com");
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  final MapController _mapController = MapController();

  final LatLng _currentLatLng = LatLng(13.859291, 100.513100);
  double _mapRotation = 0.0;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    bool isMobile = width < 900;

    return CorePage(
      label: "Contact",
      child: (isMobile)
          ? _contentMobileSize(height: height, width: width)
          : _contentDesktopSize(height: height, width: width),
    );
  }

  Widget _contentDesktopSize({required double height, required double width}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: const EdgeInsets.all(30),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  Text(
                    "Location",
                    style: kalam.copyWith(
                      fontSize: 50,
                      color: MyColors.lightPink,
                    ),
                  ),
                  _mapWidget(width, height),
                ],
              ),
              SizedBox(width: 50),
              Column(
                children: [
                  Text(
                    "Get In Touch",
                    style: kalam.copyWith(
                      fontSize: 50,
                      color: MyColors.lightPink,
                    ),
                  ),
                  Container(
                    width: width * 0.4,
                    height: height,
                    child: _formMailSender(height, width),
                  ),
                ],
              ),
            ],
          ),
        ),
        footerCredit(),
      ],
    );
  }

  Widget _contentMobileSize({required double height, required double width}) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Text(
            "Location",
            style: kalam.copyWith(
              fontSize: 50,
              color: MyColors.lightPink,
            ),
          ),
          _mapWidget(width, height),
          SizedBox(height: 50),
          Text(
            "Get In Touch",
            style: kalam.copyWith(
              fontSize: 50,
              color: MyColors.lightPink,
            ),
          ),
          _socialIconRow(),
          _formMailSender(height, width),
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: footerCredit(),
          ),
        ],
      ),
    );
  }

  Widget _formMailSender(double height, double width) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            enabled: false,
            style: robotoMono,
            controller: _emailController,
            decoration: textFormFieldDecorate.copyWith(
              hintText: "Email",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter an email";
              } else if (!isValidEmail(_emailController.text)) {
                return "Please enter a valid email";
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 5),
          TextFormField(
            style: robotoMono,
            controller: _subjectController,
            decoration: textFormFieldDecorate.copyWith(
              hintText: "Subject",
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter an subject";
              } else {
                return null;
              }
            },
          ),
          SizedBox(height: 5),
          TextFormField(
            style: robotoMono,
            controller: _messageController,
            decoration: textFormFieldDecorate.copyWith(
              hintText: "Your Message",
            ),
            minLines: 5,
            maxLines: null,
            keyboardType: TextInputType.multiline,
          ),
          SizedBox(height: 20),
          ButtonWidget(
            label: "Send Email",
            onTap: () {
              if (_formKey.currentState!.validate()) {
                _sendEmail();
              }
            },
          ),
        ],
      ),
    );
  }

  void _recenter() {
    _mapController.move(_currentLatLng, 15);
  }

  void _sendEmail() async {
    if (kIsWeb) return _sendEmailWeb();
    if (Platform.isAndroid || Platform.isIOS) return _sendEmailMobile();
  }

  Future<void> _sendEmailWeb() async {
    final Uri emailUri = Uri(
      scheme: 'mailto',
      path: _emailController.text,
      queryParameters: {
        'subject': _subjectController.text,
        'body': _messageController.text,
      },
    );

    if (await canLaunchUrl(emailUri)) {
      await launchUrl(emailUri);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("ไม่สามารถเปิดอีเมลไคลเอนต์ได้")),
      );
    }
  }

  Future<void> _sendEmailMobile() async {
    final Email email = Email(
      body: _messageController.text,
      subject: _subjectController.text,
      recipients: [_emailController.text],
      isHTML: false,
    );

    try {
      await FlutterEmailSender.send(email);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Email sent successfully!")),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Failed to send email: $error")),
      );
    }
  }

  Widget _mapWidget(double width, double height) {
    final String location = "Nonthaburi, Thailand";

    bool isMobile = width < 900;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: SizedBox(
        width: isMobile ? width : width * 0.5,
        height: isMobile ? 300 : 500,
        child: FlutterMap(
          mapController: _mapController,
          options: MapOptions(
            initialCenter: _currentLatLng,
            initialZoom: 15,
            onMapEvent: (event) {
              setState(() {
                _mapRotation = _mapController.camera.rotation;
              });
            },
          ),
          children: [
            TileLayer(
              urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
              tileProvider: CancellableNetworkTileProvider(),
              userAgentPackageName: "com.example.app",
            ),
            MapCompass(
                icon: Icon(
              Icons.navigation,
              color:
                  _mapRotation % 90 == 0 ? Colors.red[600] : Colors.grey[500],
            )),
            Positioned(
              top: 10,
              left: 10,
              child: Container(
                width: 200,
                height: 60,
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        location,
                        style: robotoMono.copyWith(
                            color: MyColors.darkNavy, fontSize: 12),
                      ),
                      InkWell(
                        onTap: () async {
                          final Uri googleMapsUri = Uri.parse(
                            "https://www.google.com/maps/search/?api=1&query=$location",
                          );
                          await launchUrl(googleMapsUri);
                        },
                        child: HoverRobotoMonoText(
                          label: "View larger map",
                          fontSize: 10,
                          textColor: MyColors.darkNavy,
                          hoverColor: MyColors.darkPink,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  color: MyColors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 5,
                      offset: Offset(0, 3),
                    )
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(10),
                    // highlightColor: Colors.grey,
                    // splashColor: MyColors.lightNavy,

                    onTap: _recenter,
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Icon(
                        Icons.my_location,
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _socialIconRow() {
    List<Map<String, dynamic>> iconList = [
      {'github': 'https://github.com/tuit2542'},
      {'linkedin': 'https://www.linkedin.com/in/pongsathorn-dev/'},
    ];

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(iconList.length, (index) {
          return _socialIcon(iconList[index]);
        }),
      ),
    );
  }

  Widget _socialIcon(Map<String, dynamic> socialStr) {
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: MyColors.lightNavy,
          highlightColor: MyColors.lightNavy,
          borderRadius: BorderRadius.circular(100),
          child: ImageIcon(
            AssetImage(
              "assets/logos/contact/${socialStr.keys.first}.png",
            ),
            color: MyColors.white,
          ),
          onTap: () async {
            await launchUrl(Uri.parse(socialStr.values.first));
          },
        ),
      ),
    );
  }
}
