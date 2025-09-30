import 'package:e_com_bloc/components/button_next_page.dart';
import 'package:e_com_bloc/utils/app_colors_path.dart';
import 'package:e_com_bloc/utils/app_label.dart';
import 'package:e_com_bloc/utils/app_size.dart';
import 'package:e_com_bloc/utils/text_input_field.dart';
import 'package:flutter/material.dart';
class CompleteProfile extends StatefulWidget {
  const CompleteProfile({super.key});

  @override
  State<CompleteProfile> createState() => _CompleteProfileState();
}

class _CompleteProfileState extends State<CompleteProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView( // Makes screen scrollable to avoid overflow
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: AppLabel(text: "Complete Your Profile", size: AppSize.s25),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: AppLabel(
                text: "is a process where a user adds missing",
                size: AppSize.s13,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50),
              child: AppLabel(
                text: "personal or account information after signing up",
                size: AppSize.s12,
                color: AppColorsPath.fromARGB,
              ),
            ),
            const SizedBox(height: 20),
            // Profile Avatar
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColorsPath.grey.withAlpha(25),
                    child: const Icon(
                      Icons.person,
                      size: 60,
                      color: Color.fromARGB(210, 128, 128, 128),
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: AppColorsPath.fromARGB,
                      child: const Icon(
                        Icons.edit,
                        size: 18,
                        color: AppColorsPath.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        
            const SizedBox(height: 30),
        
            // Name Field
            AppLabel(text: "Name", size: AppSize.s16),
            const SizedBox(height: 5),
            const TextInputField(icons: Icons.person, txt: "Millie Millie"),
        
            const SizedBox(height: 15),
        
            // Email Field
            AppLabel(text: "Email", size: AppSize.s16),
            const SizedBox(height: 5),
            const TextInputField(icons: Icons.email_outlined, txt: "Mille0678@gmail.com"),
        
            const SizedBox(height: 15),
        
            // Gender Field
            AppLabel(text: "Gender", size: AppSize.s16),
            const SizedBox(height: 5),
            const TextInputField(icons: Icons.person, txt: "Female"),
        
            const SizedBox(height: 30),
        
            // Complete Profile Button
            SizedBox(
              width: double.infinity,
              child: ButtomNextPage(txt: "Complete Profile"),
            ),
        
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
