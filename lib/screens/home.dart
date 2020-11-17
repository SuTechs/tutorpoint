import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tutorpoint/constants.dart';

class NavScreen {
  final String title;
  final Widget screens;
  final Widget icon;

  NavScreen(
      {@required this.title, @required this.screens, @required this.icon});
}

class NavigationHome extends StatefulWidget {
  @override
  _NavigationHomeState createState() => _NavigationHomeState();
}

class _NavigationHomeState extends State<NavigationHome> {
  final List<NavScreen> _screens = [
    NavScreen(
      title: 'Home',
      screens: Home(),
      icon: Icon(
        Icons.home,
        size: 30,
        color: Colors.white,
      ),
    ),
    NavScreen(
      title: 'Work',
      screens: Work(),
      icon: Icon(
        Icons.work,
        size: 30,
        color: Colors.white,
      ),
    ),
    NavScreen(
      title: 'Chat',
      screens: Center(
        child: Text('WhatsApp will open'),
      ),
      icon: Icon(
        Icons.chat,
        size: 30,
        color: Colors.white,
      ),
    ),
    NavScreen(
      title: 'Profile',
      screens: Center(
        child: Text('Profile'),
      ),
      icon: Icon(
        Icons.person,
        size: 30,
        color: Colors.white,
      ),
    ),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: const Color(0xff011E4C),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        height: 50,
        items: [for (NavScreen screen in _screens) screen.icon],
        onTap: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 1,
        iconTheme: IconThemeData(
          color: const Color(0xff011E4C), //change your color here
        ),
        backgroundColor: Colors.white,
        title: Text(
          '${_screens[_selectedIndex].title}',
          style: TextStyle(color: const Color(0xff011E4C)),
        ),
      ),
      body: _screens[_selectedIndex].screens,
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset('assets/images/top.jpg'),
        AssignmentTile(
          title: 'Newton Law',
          subject: 'Physics',
          price: '500',
          dueBy: 'Due by : 08/12/20',
          image: 'assets/icons/atom.svg',
        ),
        AssignmentTile(
          title: 'Bio-tech operation',
          subject: 'Biology',
          price: '4500',
          dueBy: 'Due by : 09/12/20',
          image: 'assets/icons/research.svg',
        ),
        AssignmentTile(
          title: 'Organic Salt',
          subject: 'Chemistry',
          price: '100',
          dueBy: 'Due by : 28/11/20',
          image: 'assets/icons/chemistry.svg',
        ),

        ///
        AssignmentTile(
          title: 'Newton Law',
          subject: 'Physics',
          price: '500',
          dueBy: 'Due by : 08/12/20',
          image: 'assets/icons/atom.svg',
        ),
        AssignmentTile(
          title: 'Bio-tech operation',
          subject: 'Biology',
          price: '4500',
          dueBy: 'Due by : 09/12/20',
          image: 'assets/icons/research.svg',
        ),
        AssignmentTile(
          title: 'Organic Salt',
          subject: 'Chemistry',
          price: '100',
          dueBy: 'Due by : 28/11/20',
          image: 'assets/icons/chemistry.svg',
        ),

        ///
        AssignmentTile(
          title: 'Newton Law',
          subject: 'Physics',
          price: '500',
          dueBy: 'Due by : 08/12/20',
          image: 'assets/icons/atom.svg',
        ),
        AssignmentTile(
          title: 'Bio-tech operation',
          subject: 'Biology',
          price: '4500',
          dueBy: 'Due by : 09/12/20',
          image: 'assets/icons/research.svg',
        ),
        AssignmentTile(
          title: 'Organic Salt',
          subject: 'Chemistry',
          price: '100',
          dueBy: 'Due by : 28/11/20',
          image: 'assets/icons/chemistry.svg',
        ),

        SizedBox(height: 20),
      ],
    );
  }
}

class Work extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Image.asset('assets/images/top.jpg'),
        AssignmentTile(
          title: 'Newton Law',
          subject: 'Physics',
          price: '500',
          dueBy: 'Due by : 08/12/20',
          image: 'assets/icons/atom.svg',
        ),
        AssignmentTile(
          title: 'Bio-tech operation',
          subject: 'Biology',
          price: '4500',
          dueBy: 'Due by : 09/12/20',
          image: 'assets/icons/research.svg',
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class AssignmentTile extends StatelessWidget {
  final String title;
  final String subject;
  final String price;
  final String dueBy;
  final String image;

  const AssignmentTile({
    Key key,
    @required this.title,
    @required this.subject,
    @required this.price,
    @required this.dueBy,
    @required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Material(
        color: Colors.transparent,
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
          child: ListTile(
            isThreeLine: true,
            leading: SvgPicture.asset(
              image,
              height: 50,
              width: 50,
            ),
            title: Text(title),
            subtitle: Text(dueBy),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  subject,
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  '$kRupeesSymbol $price',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// login

// class Login extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Column(
//         children: [
//           SizedBox(height: 16),
//           Image.asset(
//             'assets/images/login.png',
//             fit: BoxFit.cover,
//           ),
//         ],
//       ),
//     );
//   }
// }
