import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mybadidukkan/constants.dart';

class OptionsSheet extends StatelessWidget {
  const OptionsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        Container(
          color: Colors.grey.shade100,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 80,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: AspectRatio(
                            aspectRatio: 4 / 5,
                            child: Image.network(
                                "https://static.toiimg.com/thumb/53110049.cms?width=1200&height=900",
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      const SizedBox(width: 12),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 4),
                          const Text(
                            "Indi Tandoori Paneer Pizza",
                            style: TextStyle(
                              // fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          const Text("Category : Snacks",
                              style: TextStyle(fontSize: 13)),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "₹269",
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: kPrimaryColor,
                                ),
                              ),
                              const SizedBox(width: 20),
                              const Text(
                                "₹299",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey,
                                  decoration: TextDecoration.lineThrough,
                                  decorationColor: Colors.black,
                                  decorationThickness: 1,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      const Expanded(child: SizedBox()),
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(CupertinoIcons.xmark),
                        padding: const EdgeInsets.all(6),
                        constraints: const BoxConstraints(),
                      )
                    ],
                  ),
                ),
              ),
              const Divider(height: 1, thickness: 1, color: Colors.black12),
              Card(
                elevation: 1,
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(top: 12, bottom: 6, left: 12),
                      child: Text(
                        "Quantity",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          // fontSize: 16,
                        ),
                      ),
                    ),
                    Divider(height: 1, thickness: 1, color: Colors.black12),
                    SizedBox(height: 4),
                    OptionsButton(),
                    OptionsButton(),
                    OptionsButton(),
                    SizedBox(height: 4),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    minimumSize: const Size.fromHeight(48),
                  ),
                  child: const Text(
                    "ADD TO CART",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class OptionsButton extends StatelessWidget {
  const OptionsButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      child: Row(
        children: [
          const SizedBox(width: 4),
          const Text("2 Pcs(300 Ml Box)"),
          const Expanded(child: SizedBox()),
          Row(
            children: [
              const Text("₹269"),
              Radio(
                value: true,
                groupValue: Object(),
                onChanged: (object) {},
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              )
            ],
          ),
        ],
      ),
    );
  }
}
