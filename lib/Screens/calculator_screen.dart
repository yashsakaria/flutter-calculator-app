import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:calculator/my_circular_button.dart';
import 'package:calculator/constants.dart';
import 'package:provider/provider.dart';
import 'package:calculator/calculator_data.dart';

class Calculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: blackColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 25.0),
              child: Text(
                Provider.of<CalculatorData>(context).answer,
                textAlign: TextAlign.end,
                style: kTextStyle.copyWith(
                    fontSize: 70, fontWeight: FontWeight.w300),
              ),
            ),
            Row(
              children: [
                MyCircularButton(
                  buttonChild: const Text(
                    'AC',
                    style: TextStyle(
                      color: blackColor,
                      fontSize: 30.0,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  btnColor: greyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .clearText();
                  },
                ),
                MyCircularButton(
                  buttonChild: const Icon(
                    CupertinoIcons.plus_slash_minus,
                    color: blackColor,
                    size: 30.0,
                  ),
                  btnColor: greyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .negate();
                  },
                ),
                MyCircularButton(
                  buttonChild: const Icon(
                    CupertinoIcons.percent,
                    color: blackColor,
                    size: 30.0,
                  ),
                  btnColor: greyColor,
                  onPress: () {},
                ),
                MyCircularButton(
                  buttonChild: const Icon(
                    CupertinoIcons.divide,
                    color: Colors.white,
                    size: 30.0,
                  ),
                  btnColor: orangeColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateCodes('/');
                  },
                )
              ],
            ),
            Row(
              children: [
                MyCircularButton(
                  buttonChild: const Text(
                    '7',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('7');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Text(
                    '8',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('8');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Text(
                    '9',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('9');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Icon(
                    CupertinoIcons.multiply,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  btnColor: orangeColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateCodes('*');
                  },
                ),
              ],
            ),
            Row(
              children: [
                MyCircularButton(
                  buttonChild: const Text(
                    '4',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('4');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Text(
                    '5',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('5');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Text(
                    '6',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('6');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Icon(
                    CupertinoIcons.minus,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  btnColor: orangeColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateCodes('-');
                  },
                ),
              ],
            ),
            Row(
              children: [
                MyCircularButton(
                  buttonChild: const Text(
                    '1',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('1');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Text(
                    '2',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('2');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Text(
                    '3',
                    style: kTextStyle,
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateText('3');
                  },
                ),
                MyCircularButton(
                  buttonChild: const Icon(
                    CupertinoIcons.add,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  btnColor: orangeColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .updateCodes('+');
                  },
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  // alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width / 2,
                  height: MediaQuery.of(context).size.width / 4,
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      Provider.of<CalculatorData>(context, listen: false)
                          .updateText('0');
                    },
                    child: const Text(
                      '0',
                      style: kTextStyle,
                    ),
                    style: ButtonStyle(
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(40),
                      )),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(10)),
                      backgroundColor: MaterialStateProperty.all(darkGreyColor),
                    ),
                  ),
                ),
                MyCircularButton(
                  buttonChild: Text(
                    '.',
                    style: kTextStyle.copyWith(
                        textBaseline: TextBaseline.alphabetic),
                  ),
                  btnColor: darkGreyColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .addPoint();
                  },
                ),
                MyCircularButton(
                  buttonChild: const Icon(
                    CupertinoIcons.equal,
                    size: 30.0,
                    color: Colors.white,
                  ),
                  btnColor: orangeColor,
                  onPress: () {
                    Provider.of<CalculatorData>(context, listen: false)
                        .getResult();
                  },
                ),
              ],
            ),
            const SizedBox(
              height: 10.0,
            ),
          ],
        ),
      ),
    );
  }
}
