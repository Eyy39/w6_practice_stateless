import 'package:flutter/material.dart';

// EX 2 – The buttons (handout page: EX 2)
// A StatelessWidget called CustomButton. Use one enum for the button type
// and one enum for the icon position.
enum ButtonType { Primary, Secondary, Disable }
enum IconPosition { left, right }
void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Custom buttons", style: TextStyle(fontSize: 20)),
              SizedBox(height: 40,),
              CustomButton(label: "Submit", icon: Icons.check, buttonType: ButtonType.Primary,),
              SizedBox(height: 20,),

              CustomButton(label: "Time", icon: Icons.access_time, buttonType: ButtonType.Secondary, iconPosition: IconPosition.right,),

              SizedBox(height: 20,),

              CustomButton(label: "Account", icon: Icons.account_tree, buttonType: ButtonType.Disable, iconPosition: IconPosition.right,)
            ],
          ),
        ), // YOUR CODE
      ),
    ),
  );
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.iconPosition = IconPosition.left, required this.label, required this.icon, this.buttonType = ButtonType.Primary,
  });

  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  Color getButtonColor() {
    switch (buttonType) {
      case ButtonType.Primary:
        return Colors.blue;

      case ButtonType.Secondary:
        return Colors.green;

      case ButtonType.Disable:
        return Colors.grey;
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(color: getButtonColor(), borderRadius: BorderRadius.circular(20)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (iconPosition == IconPosition.left) ...[
            Icon(icon),
            SizedBox(width: 5),
          ],
          
          Text(label,),

          if (iconPosition == IconPosition.right) ...[
            SizedBox(width: 5),
            Icon(icon),
          ],
        ],
      ),
    );
  }
}
