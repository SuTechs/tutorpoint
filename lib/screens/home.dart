import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:tutorpoint/constants.dart';
import 'package:tutorpoint/screens/profile.dart';
import 'package:tutorpoint/widgets/bottomSheet.dart';

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
      screens: Profile(),
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
            onTap: () => showDetails(context),
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

  void showDetails(BuildContext context) {
    /// open bottom sheet
    kShowOptions(context, AssignmentDetails());
  }
}

class AssignmentDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints:
          BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// info
          ListTile(
            contentPadding: EdgeInsets.all(0),
            isThreeLine: true,
            leading: SvgPicture.asset(
              'assets/icons/atom.svg',
              height: 50,
              width: 50,
            ),
            title: Text('Newton Law'),
            subtitle: Text('Due by : 08/12/20'),
            trailing: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Physics',
                  style: TextStyle(fontSize: 10),
                ),
                Text(
                  '$kRupeesSymbol 500',
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          /// medias
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                for (int i = 0; i < 4; i++)
                  Container(
                    margin: EdgeInsets.only(right: 16),
                    height: 150,
                    width: 105,
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
              ],
            ),
          ),
          SizedBox(height: 16),

          /// Description
          Expanded(
            child: SingleChildScrollView(
              controller: ModalScrollController.of(context),
              child: Text.rich(
                TextSpan(
                    text: 'Description:  ',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    children: [
                      TextSpan(
                        text: kDescriptionText + '\n\n' + kDescriptionText,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 14,
                            letterSpacing: 0.5,
                            height: 1.5),
                      ),
                    ]),
              ),
            ),
          ),

          /// buttons
          AssignmentActionButtons(),
          StatusButton(),
          StatusButton(assignmentStatus: AssignmentStatus.Rejected),
          StatusButton(assignmentStatus: AssignmentStatus.Upload),
          StatusButton(assignmentStatus: AssignmentStatus.Uploaded),
          StatusButton(assignmentStatus: AssignmentStatus.Completed),
        ],
      ),
    );
  }
}

class AssignmentActionButtons extends StatefulWidget {
  @override
  _AssignmentActionButtonsState createState() =>
      _AssignmentActionButtonsState();
}

class _AssignmentActionButtonsState extends State<AssignmentActionButtons> {
  bool isAccepting = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// chat
        Icon(
          Icons.chat,
          size: 30,
          color: kBlueColor,
        ),

        /// interested
        OutlineButton(
          onPressed: () {},
          child: Text(
            "Not Interested",
            style: TextStyle(color: kBlueColor),
          ),
          borderSide: BorderSide(color: kBlueColor),
          shape: StadiumBorder(),
        ),

        /// not interested
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.5,
          child: RaisedButton(
            color: kBlueColor,
            shape: StadiumBorder(),
            onPressed: () {
              setState(() {
                isAccepting = true;
              });

              Future.delayed(Duration(seconds: 1)).then((value) {
                setState(() {
                  isAccepting = false;
                });
              });
            },
            child: isAccepting
                ? SizedBox(
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation(Colors.white),
                    ),
                    height: 20,
                    width: 20,
                  )
                : Text(
                    "Interested",
                    style: TextStyle(color: Colors.white),
                  ),
          ),
        )
      ],
    );
  }
}

class StatusButton extends StatelessWidget {
  final AssignmentStatus assignmentStatus;
  const StatusButton(
      {Key key, this.assignmentStatus = AssignmentStatus.Pending})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        /// chat
        Icon(
          Icons.chat,
          size: 30,
          color: kBlueColor,
        ),

        SizedBox(width: 16),

        /// status
        Expanded(
          child: assignmentStatus != AssignmentStatus.Upload &&
                  assignmentStatus != AssignmentStatus.Uploaded
              ? RaisedButton(
                  color: _kButtonStatusColors[assignmentStatus],
                  shape: StadiumBorder(),
                  onPressed: () {},
                  child: Text(
                    _kButtonStatusText[assignmentStatus],
                    style: TextStyle(color: Colors.white),
                  ),
                )
              : OutlineButton(
                  onPressed: () {},
                  child: Text(
                    _kButtonStatusText[assignmentStatus],
                    style: TextStyle(
                        color: _kButtonStatusColors[assignmentStatus]),
                  ),
                  borderSide:
                      BorderSide(color: _kButtonStatusColors[assignmentStatus]),
                  shape: StadiumBorder(),
                ),
        ),
      ],
    );
  }
}

enum AssignmentStatus {
  Rejected,
  Pending,
  Upload,
  Uploaded,
  Completed,
}

const _kButtonStatusColors = {
  AssignmentStatus.Pending: kYellowColor,
  AssignmentStatus.Rejected: Colors.red,
  AssignmentStatus.Completed: kLightGreen,
  AssignmentStatus.Upload: kBlueColor,
  AssignmentStatus.Uploaded: kLightGreen,
};
const _kButtonStatusText = {
  AssignmentStatus.Pending: 'Pending',
  AssignmentStatus.Rejected: 'Rejected',
  AssignmentStatus.Completed: 'Completed',
  AssignmentStatus.Upload: 'Upload Assignments',
  AssignmentStatus.Uploaded: 'Uploaded'
};
