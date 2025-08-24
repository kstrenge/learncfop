import 'package:flutter/material.dart';
import 'package:learncfop/data/preferences.dart';

class Username extends StatelessWidget {
  const Username({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: Preferences.loadUsername(),
      builder: (context, snapshot) {
        return IntrinsicWidth(
          child: snapshot.hasData
              ? TextFormField(
                  initialValue: snapshot.data,
                  decoration: InputDecoration(
                    isDense: true,
                    hintText: "cuber",
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide.none,
                    ),
                    focusedBorder: UnderlineInputBorder(),
                  ),
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                  onFieldSubmitted: (value) => Preferences.saveUsername(value),
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                )
              : SizedBox(),
        );
      },
    );
  }
}
