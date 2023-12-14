//
//  CharacterViewController.swift
//  iosSchoolHH
//
//  Created by Арина Колганова on 14.11.2023.
//
import UIKit

final class CharacterViewController<View: CharactersView>: BaseViewControoler<View> {

    private var characters: [Character] = []

    private let dataProvider: CharacterDataProvider
    private let charactersUrlList: [String]
    private let updateQueue = DispatchQueue(label: "CharacterRequestQueue")
    private let imageService: ImageService

    init(dataProvider: CharacterDataProvider, data: LocationCellData, imageService: ImageService) {
        self.dataProvider = dataProvider
        charactersUrlList = data.residents
        self.imageService = imageService
        super.init(nibName: nil, bundle: nil)
        title = "Жители локации \(data.name)"
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .brown

        rootView.setView()
        rootView.update(data: CharactersViewData(cells: charactersUrlList.map { CharactersCellData(url: $0) } ))
        charactersUrlList.enumerated().forEach { idx, url in
            requestCharacter(url: url) { [weak self] character in
                guard let self else {
                    return
                }
                DispatchQueue.main.async {
                    self.rootView.updateCharacter(idx: idx, with: CharactersCellData(
                        character: character,
                        isLoading: true,
                        image: nil,
                        selectClosure: nil
                    ))
                }
                self.imageService.getImage(url: character.image, completion: { [weak self] image in
                    print(image?.size ?? 0)
                })
            }
        }
    }

    // MARK: - Private func

    private func requestCharacter(url: String, completion: @escaping (Character) -> Void) {
        if let character = characters.first(where: { $0.url == url }) {
            completion(character)
            return
        }
        DispatchQueue.global().async {
            self.dataProvider.character(url: url) { [weak self] character, error in
                if let character {
                    self?.updateQueue.async {
                        self?.characters.append(character)
                        completion(character)
                    }
                }
            }
        }
    }

    private func character() {
        dataProvider.character { character, _ in
            guard let character else {
                return
            }
            print(
                character.id,
                character.name,
                character.species,
                character.image,
                character.url,
                character.episode,
                character.gender,
                character.status
            )
        }
    }
}
