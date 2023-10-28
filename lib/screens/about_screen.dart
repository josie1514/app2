import 'package:flutter/material.dart';
import 'package:meal_app/widgets/side_drawer.dart';
// About screen: includes a project description, a list of the team members, and a logo.

class AboutScreen extends StatelessWidget{
  const AboutScreen({super.key});

  static const routName = '/about';

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
      title: const Text(
        "About Us",
      ),
    ),
    drawer: const MainDrawer(),
    body: ListView(
      children:const[
        ExpansionTile(
          title: Text('What is The Optimized Meal Assistance Robot (OMAR)?'),
          children: [
            Text('The Optimized Meal Assistance Robot (OMAR) is an assistive robotic arm that empowers physically impaired individuals to independently feed themselves, reducing the workload on caregivers. This innovative technology incorporates facial tracking software, customized utensils, and a mobile application for enhanced functionality.'),
          ],
        ),
        ExpansionTile(
          title: Text('Who is the Assistive Robotics Team?'),
          children: [
            Text('The Assistive Robotics team is a team of dedicated professionals responsible for creating the Optimized Meal Assistance Robot (OMAR), with a focus on assistive technology for individuals with physical impairments.\n\nOur multidisciplinary expertise in robotics, artificial intelligence, and human-computer interaction drives us to pioneer innovative solutions that enhance the quality of life by providing more independent and fulfilling experiences for those with physical challenges.'),
          ],
        ),
        ExpansionTile(
          title: Text('Why is it called "OMAR"?'),
          children: [
            Text('Omar is the inspiration and driving force behind the Optimized Meal Assistance Robot (OMAR). In 2016 Omar tragically lost his life to a type of cancer known as Fibromyxoid sarcoma. \n\nDuring his final months, he faced the challenging ordeal of physical paralysis, relying on the devoted care of loved ones and caregivers for his daily needs. The purpose of the OMAR Robot is to grant patients with physical disabilities the opportunity to feel physically independent by being able to feed themselves. just as simply as being able to feed yourself. '),
          ],
        ),
      ],
      ),
    );
  }
}