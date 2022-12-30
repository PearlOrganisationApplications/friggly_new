import 'package:call_log/call_log.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:workmanager/workmanager.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Iterable<CallLogEntry> _callLogEntries = <CallLogEntry>[];
  void getPermission() async {
    if (await Permission.phone.request().isGranted) {
      //getLogQuery();
    } else {
      await Permission.phone.request();
    }
  }

  @override
  void initState() {
    getPermission();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 15.0,
                right: 15.0,
                top: 50.0,
              ),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      alignment: Alignment.center,
                      height: 45,
                      width: MediaQuery.of(context).size.width * 0.95,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.0),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 8.0,
                            spreadRadius: 1.5,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Search number,name",
                        style: TextStyle(
                          fontSize: 15.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  FutureBuilder(
                      future: CallLog.query(),
                      builder: (context, snapshot) {
                        if (!snapshot.hasData) {
                          return const Padding(
                            padding: EdgeInsets.only(top: 100.0),
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          );
                        }
                        List<CallLogEntry> entries = snapshot.data!.toList();
                        return Scrollbar(
                          child: ListView.builder(
                              shrinkWrap: true,
                              physics: const ScrollPhysics(),
                              itemCount: entries.length,
                              itemBuilder: (context, index) {
                                var entry = entries[index];
                                var date = DateTime.fromMillisecondsSinceEpoch(
                                    entry.timestamp!);
                                var fromattedDate =
                                    DateFormat.yMMMd().format(date);

                                var mono = TextStyle(
                                  fontFamily: 'monospace',
                                  fontSize: 18.0,
                                  color: entry.callType == CallType.missed
                                      ? Colors.red
                                      : Colors.black,
                                );
                                return Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ListTile(
                                      onTap: () {},
                                      leading: CircleAvatar(
                                        backgroundColor:
                                            entry.callType == CallType.missed
                                                ? Colors.red
                                                : Colors.grey,
                                        radius: 15.0,
                                        child:
                                            // Text(entry.name!
                                            //     .substring(0, 1)
                                            //     .toUpperCase()),
                                            Icon(
                                          entry.callType == CallType.incoming
                                              ? Icons.call_received
                                              : entry.callType ==
                                                      CallType.outgoing
                                                  ? Icons.call_made_sharp
                                                  : entry.callType ==
                                                          CallType.missed
                                                      ? Icons.call_missed
                                                      : Icons.call_end_sharp,
                                        ),
                                      ),
                                      title: Text(
                                        entry.name == null
                                            ? "Unkonw numer"
                                            : entry.name.toString(),
                                        style: mono,
                                      ),
                                      subtitle: Column(
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                entry.formattedNumber
                                                    .toString(),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              entry.callType == CallType.missed
                                                  ? const Text(
                                                      "Missed call",
                                                      style: TextStyle(
                                                          color: Colors.red),
                                                    )
                                                  : entry.callType ==
                                                          CallType.incoming
                                                      ? const Text(
                                                          "Received call",
                                                          //style: TextStyle(color: Colors.red),
                                                        )
                                                      : entry.callType ==
                                                              CallType.outgoing
                                                          ? const Text(
                                                              "Outgoing call",
                                                              //style: TextStyle(color: Colors.red),
                                                            )
                                                          : const Text(
                                                              "Rejected call"),
                                              const SizedBox(
                                                width: 10.0,
                                              ),
                                              Text(fromattedDate),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
                        );
                      }),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
