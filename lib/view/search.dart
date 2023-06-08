import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:smart_home_app/utils/utils.dart';
import '../widgets/action_button.dart';
import '../widgets/device_grid_item.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            header(), // Search + Wifi
            Utils.mediumText(
                color: Colors.white, title: '3 new devices', fontsize: 17),
            const SizedBox(height: 32),
            devicesGrid(),
            const Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                //  Above code is used to align the button the end part of screen
                children: [
                  ActionButton(title: "Add device"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column devicesGrid() {
    return Column(
      children: [
        upper(),
        const SizedBox(height: 10),
        lower(),
      ],
    );
  }

  Row lower() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const DeviceGridItem(
          img: "Dem",
          title: "Xiaomi DEM-F600",
          function: "Humidifier",
        ),
        const SizedBox(width: 5),
        DottedBorder(
          color: const Color(0xff393535),
          strokeWidth: 5, // Dotted line width

          // Responsible for rounded border
          borderType: BorderType.RRect,
          radius: const Radius.circular(24),

          borderPadding: const EdgeInsets.only(
              left: 5, top: 5, bottom: 5), // Effect from outside of the border
          dashPattern: const [4, 0, 4], // Responsible of [- - - - - -]
          child: const DeviceGridItem(
            img: "Manual",
            title: "Not found \ndevice?",
            function: "Select manually",
            funcTextColor: Colors.amber,
            bgColor: Colors.transparent,
            imgHeight: 40,
          ),
        ),
      ],
    );
  }

  Row upper() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        DeviceGridItem(
          img: "Bork",
          title: "Bork V530",
          function: "Vacuum cleaner",
        ),
        SizedBox(width: 5),
        DeviceGridItem(
          img: "Led",
          title: "LIFX LED Light",
          function: "Smart bulb",
        ),
      ],
    );
  }

  Row header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Utils.mediumText(color: Colors.white, title: 'Search', fontsize: 32),
        Utils.mediumText(
            color: Colors.white, title: 'Wifi:tw1r_413_7G', fontsize: 12),
      ],
    );
  }
}
