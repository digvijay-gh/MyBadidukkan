import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mybadidukkan/constants.dart';

final TextStyle priceStyle = const TextStyle(
    fontWeight: FontWeight.bold, fontSize: 13, letterSpacing: 0.5);

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: const [
            TitleBar(),
            SizedBox(height: 28),
            DashedTitle(title: "ITEM(S) ADDED"),
            SizedBox(height: 28),
            ItemsAddedCard(),
            SizedBox(height: 28),
            DashedTitle(title: "BILL SUMMARY"),
            SizedBox(height: 28),
            BillCard(),
            SizedBox(height: 28),
            DashedTitle(title: "CANCELLATION POLICY"),
            SizedBox(height: 28),
            CancellationMsgCard(),
            SizedBox(height: 28),
          ],
        ),
      )),
    );
  }
}

class TitleBar extends StatelessWidget {
  const TitleBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(Icons.arrow_back_ios_new, size: 20)),
        const Text("KFC",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
      ],
    );
  }
}

class CancellationMsgCard extends StatelessWidget {
  const CancellationMsgCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: const Text(
        "100% cancellation fee will be applicable if you decide to cancel the order anytime after order placement. Avoid cancellation as it leads to food wastage.",
        style: TextStyle(fontSize: 13),
      ),
    );
  }
}

class BillCard extends StatelessWidget {
  const BillCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Cart Value",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
              ),
              Text("₹1,799", style: priceStyle),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: const [
                  Icon(Icons.electric_scooter, size: 20),
                  SizedBox(width: 8),
                  Text("Delivery Fee", style: TextStyle(fontSize: 12)),
                ],
              ),
              Text("₹19.0", style: priceStyle),
            ],
          ),
          const SizedBox(height: 4),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: const Text(
              "(The delivery fee is totally based upon the distance between Shop and You)",
              style: TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 4),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Divider(thickness: 1, color: Colors.grey.shade200),
          ),
          const SizedBox(height: 4),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Grand Total",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Text("₹1,799", style: priceStyle),
            ],
          ),
        ],
      ),
    );
  }
}

class ItemsAddedCard extends StatelessWidget {
  const ItemsAddedCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 20),
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(12)),
      child: ListView.separated(
        itemCount: 3,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 8),
                child: Icon(
                  CupertinoIcons.arrowtriangle_up_square,
                  color: Colors.red,
                  size: 18,
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(right: 20),
                      child: Text(
                        "Lazeez Bhuna Murgh [ Chicken Dum Biryani Boneless - Serves 1]",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 13),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text("₹229.25", style: priceStyle),
                    const SizedBox(height: 8),
                    Text(
                      "In this culinary jewel from Behrouz, Tender chicken pieces are marinated with exuberant bhuna spices that are freshly ground and dum pukht with aromatic rice.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 2),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    width: 72,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 254, 237, 240),
                      border: Border.all(color: kPrimaryColor),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          CupertinoIcons.minus,
                          size: 11,
                          color: kPrimaryColor,
                        ),
                        const Text("1",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 13)),
                        Icon(
                          CupertinoIcons.add,
                          size: 11,
                          color: kPrimaryColor,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text("₹229.57", style: priceStyle),
                ],
              ),
            ],
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 24);
        },
      ),
    );
  }
}

class DashedTitle extends StatelessWidget {
  const DashedTitle({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          Expanded(
              child: Divider(
            color: Colors.grey.shade300,
          )),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              title,
              style: TextStyle(
                color: Colors.grey.shade800,
                letterSpacing: 1.5,
                fontSize: 13,
              ),
            ),
          ),
          Expanded(
              child: Divider(
            color: Colors.grey.shade300,
          )),
        ],
      ),
    );
  }
}
