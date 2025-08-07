import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  void _showEditBottomSheet(
      BuildContext context, String field, String currentValue, Function(String) onSave) {
    final TextEditingController _controller = TextEditingController(text: currentValue);

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          top: 20,
          left: 20,
          right: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 50,
              height: 5,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Edit $field",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                filled: true,
                fillColor: const Color(0xFFF5F5FA),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                hintText: "Enter $field",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF8E65F3),
                minimumSize: const Size.fromHeight(50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                onSave(_controller.text);
                Navigator.pop(context);
              },
              child: const Text(
                "Save",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Lato',
                ),
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromRGBO(34, 3, 136, 1),
                Color.fromRGBO(208, 195, 252, 1),
              ],
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _circleIcon(Icons.arrow_back, onTap: () => Navigator.of(context).pop()),
                    const SizedBox(width: 12),
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'My Profile',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    _circleIcon(Icons.settings),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Container(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://img.freepik.com/free-psd/3d-rendering-hair-style-avatar-design_23-2151869121.jpg?semt=ais_hybrid',
                        ),
                      ),
                      const SizedBox(width: 14),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Elizabeth Latte !',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'Level-1 - Introduction',
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'streak',
                              style: GoogleFonts.lato(
                                color: Color.fromARGB(255, 98, 84, 225),
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            const Icon(Icons.bolt, color: Color.fromRGBO(142, 85, 221, 1), size: 18),
                            const Text('432', style: TextStyle(color: Color.fromARGB(255, 91, 66, 233))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Gap(12),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                    color: Colors.white,
                  ),
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Personal Information',
                          style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                        ),
                        const SizedBox(height: 20),
                        _buildInfoTile(
                          iconWidget: _circleIcon(
                            Icons.person,
                            bgColor: const Color(0xFF9E6BFC),
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(34, 3, 136, 1),
                                Color.fromRGBO(208, 195, 252, 1),
                              ],
                            ),
                          ),
                          label: 'Full Name',
                          value: 'Adeena S A',
                          showEdit: true,
                        ),
                        const Gap(10),
                        _buildInfoTile(
                          iconWidget: _circleIcon(
                            Icons.email,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(34, 3, 136, 1),
                                Color.fromRGBO(208, 195, 252, 1),
                              ],
                            ),
                          ),
                          label: 'Email Address',
                          value: 'adeena@stackmod.io',
                        ),
                        const Gap(10),
                        _buildInfoTile(
                          iconWidget: _circleIcon(
                            Icons.phone,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(34, 3, 136, 1),
                                Color.fromRGBO(208, 195, 252, 1),
                              ],
                            ),
                          ),
                          label: 'Contact Number',
                          value: '7034567824',
                          showEdit: true,
                        ),
                        const Gap(10),
                        _buildInfoTile(
                          iconWidget: _circleIcon(
                            Icons.star,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(34, 3, 136, 1),
                                Color.fromRGBO(208, 195, 252, 1),
                              ],
                            ),
                          ),
                          label: 'Current Level',
                          value: 'Level - 1',
                        ),
                        const Gap(10),
                        _buildInfoTile(
                          iconWidget: _circleIcon(
                            Icons.feedback_outlined,
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromRGBO(34, 3, 136, 1),
                                Color.fromRGBO(208, 195, 252, 1),
                              ],
                            ),
                          ),
                          label: 'Feedback',
                          value: 'Share your thoughts with us',
                          trailingIcon: Icons.send,
                        ),
                        const Gap(10),
                        _buildInfoTile(
                          iconWidget: _circleIcon(
                            Icons.logout,
                            bgColor: const Color(0xFFFA4141),
                            onTap: () {
                              Navigator.pushReplacementNamed(context, '/login');
                            },
                          ),
                          label: 'Logout',
                          value: 'Click here to logout',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required Widget iconWidget,
    required String label,
    required String value,
    bool showEdit = false,
    IconData? trailingIcon,
    Color valueColor = Colors.grey,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 5),
      padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(45),
        border: Border.all(color: const Color(0xFFE0D6FA)),
      ),
      child: Row(
        children: [
          iconWidget,
          const SizedBox(width: 8),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(label, style: const TextStyle(fontWeight: FontWeight.w600)),
                const SizedBox(height: 2),
                Text(value, style: TextStyle(color: valueColor)),
              ],
            ),
          ),
          if (showEdit)
            InkWell(
              onTap: () {
                _showEditBottomSheet(context, label, value, (updatedValue) {
                  if (kDebugMode) {
                    print('$label updated to: $updatedValue');
                  }
                });
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  color: Color(0xFFF3F0FE),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.edit, color: Color(0xFF9E6BFC), size: 20),
              ),
            ),
          if (trailingIcon != null)
            Container(
              padding: const EdgeInsets.all(6),
              decoration: const BoxDecoration(
                color: Color(0xFFF3F0FE),
                shape: BoxShape.circle,
              ),
              child: Icon(trailingIcon, color: Color(0xFF9E6BFC), size: 20),
            ),
        ],
      ),
    );
  }

  Widget _circleIcon(
    IconData icon, {
    Color? bgColor = Colors.white,
    Gradient? gradient,
    VoidCallback? onTap,
  }) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Material(
        color: Colors.transparent,
        shape: const CircleBorder(),
        child: InkWell(
          onTap: onTap,
          customBorder: const CircleBorder(),
          child: Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: gradient == null ? bgColor : null,
              gradient: gradient,
            ),
            child: Icon(
              icon,
              size: 23,
              color: (gradient != null || bgColor != Colors.white)
                  ? Colors.white
                  : const Color(0xFF9E6BFC),
            ),
          ),
        ),
      ),
    );
  }
}
