import 'package:flutter/material.dart';

class ListItem extends StatefulWidget {
  final String headerTitle;
  final int totalSales;
  final double totalRevenue;

  ListItem(this.headerTitle, this.totalSales, this.totalRevenue);

  @override
  State<StatefulWidget> createState() {
    return ListItemState();
  }
}

class ListItemState extends State<ListItem> {
  bool isExpand = false;
  @override
  void initState() {
    super.initState();
    isExpand = false;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: (isExpand == true)
          ? const EdgeInsets.all(8.0)
          : const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: (isExpand != true)
                ? BorderRadius.all(Radius.circular(8))
                : BorderRadius.all(Radius.circular(22)),
            border: Border.all(color: Colors.orangeAccent)),
        child: ExpansionTile(
          key: PageStorageKey<String>(this.widget.headerTitle),
          title: Container(
              width: double.infinity,
              child: Text(
                this.widget.headerTitle,
                style: TextStyle(fontSize: (isExpand != true) ? 18 : 22),
              )),
          trailing: (isExpand == true)
              ? Icon(
                  Icons.arrow_drop_down,
                  size: 32,
                  color: Colors.orangeAccent,
                )
              : Icon(Icons.arrow_drop_up, size: 32, color: Colors.orangeAccent),
          onExpansionChanged: (value) {
            setState(() {
              isExpand = value;
            });
          },
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                // onTap: () {
                //   Scaffold.of(context).showSnackBar(SnackBar(
                //       backgroundColor: Colors.pink,
                //       duration: Duration(microseconds: 500),
                //       content: Text(
                //           "Selected Item $item " + this.widget.headerTitle)));
                // },
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.orangeAccent)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total Sales: ${this.widget.totalSales}",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                // onTap: () {
                //   Scaffold.of(context).showSnackBar(SnackBar(
                //       backgroundColor: Colors.pink,
                //       duration: Duration(microseconds: 500),
                //       content: Text(
                //           "Selected Item $item " + this.widget.headerTitle)));
                // },
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        border: Border.all(color: Colors.orangeAccent)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Total Revenue: RM${this.widget.totalRevenue.toStringAsFixed(2)}",
                        style: TextStyle(color: Colors.white),
                      ),
                    )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
