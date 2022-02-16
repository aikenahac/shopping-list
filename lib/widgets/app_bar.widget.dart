import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shopping_list/api/api.client.dart';

// Custom app bar
class SLAppBar extends StatefulWidget {
  const SLAppBar({Key? key}) : super(key: key);

  @override
  State<SLAppBar> createState() => _SLAppBarState();
}

class _SLAppBarState extends State<SLAppBar> {
  String _familyName = '';

  @override
  // Function that executes when the state is initialized
  void initState() {
    _getFamilyName();
    super.initState();
  }

  // Function that gets the family name from the API
  void _getFamilyName() async {
    final Map<String, dynamic> _info = await API.get('/family-name');

    setState(() {
      _familyName = _info['data']['attributes']['name'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          '$_familyName Family',
          style: GoogleFonts.inter(
            fontSize: 50,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
