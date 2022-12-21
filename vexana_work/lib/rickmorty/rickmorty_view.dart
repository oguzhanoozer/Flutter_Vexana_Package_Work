import 'package:flutter/material.dart';
import 'package:vexana_work/rickmorty/model/character_model.dart';
import './rickmorty_view_model.dart';

class rickmortyView extends rickmortyViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      appBar: AppBar(title: Text("Rick And Morty")),
      floatingActionButton: FloatingActionButton(onPressed: () async {
        await fetchCharacterModel();
      }),
      body: ListView.builder(
        itemCount: characterModels.length,
        itemBuilder: (context, index) {
          return _buildCardDetailWidget(characterModels[index]);
        },
      ),
    );
  }

  Widget _buildCardDetailWidget(CharacterModel characterModel) => Card(
        child: ListTile(
          leading: Image.network(characterModel.image ?? ""),
          title: Text(characterModel.name ?? ""),
          subtitle: Text(characterModel.species ?? ""),
          trailing: Text(characterModel.episode?.length.toString() ?? ""),
        ),
      );
}
