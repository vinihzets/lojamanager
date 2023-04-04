import 'package:flutter/material.dart';

import 'image_getter.dart';

class ImagesWidget extends FormField<List> {
  ImagesWidget({
    super.key,
    required BuildContext context,
    // required FormFieldSetter<List> onSaved,
    required FormFieldValidator<List> validator,
    required List initialValue,
    bool autoValidate = false,
  }) : super(
            // onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            builder: (state) {
              return Column(
                children: [
                  Container(
                    height: 124,
                    padding: const EdgeInsets.only(top: 16, bottom: 8),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.value!
                          .map((e) => Container(
                                height: 100,
                                width: 100,
                                margin: const EdgeInsets.only(right: 8),
                                child: GestureDetector(
                                  child: e is String
                                      ? Image.network(
                                          e,
                                          fit: BoxFit.cover,
                                        )
                                      : Image.file(
                                          e,
                                          fit: BoxFit.cover,
                                        ),
                                  onLongPress: () {
                                    state.didChange(state.value!..remove(e));
                                  },
                                ),
                              ))
                          .toList()
                        ..add(Container(
                          width: 100,
                          height: 100,
                          child: GestureDetector(
                            child: const Icon(
                              Icons.camera_enhance,
                              color: Colors.white,
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                  context: context,
                                  builder: (context) => const ImageGetter());
                            },
                          ),
                        )),
                    ),
                  )
                ],
              );
            });
}
