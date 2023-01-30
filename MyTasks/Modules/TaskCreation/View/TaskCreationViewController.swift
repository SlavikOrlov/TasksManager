//
//  TaskCreationViewController.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

final class TaskCreationViewController: UIViewController {

    // MARK: - Properties

    var output: TaskCreationViewOutput?

    // MARK: - Private properties

    private var textField = UITextField()
    private var saveButton = UIButton()

    // MARK: - View Controller

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
}

extension TaskCreationViewController: TaskCreationViewInput {
}

// MARK: - Private methods

private extension TaskCreationViewController {

    func configureUI() {
        title = "Создать задачу"
        configureBackground()
        configureTextField()
        configureSaveButton()
        configureLayout()
    }

    func configureBackground() {
        view.backgroundColor = .white
    }

    func configureTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
    }

    func configureSaveButton() {
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = .blue
        saveButton.tintColor = .white
        saveButton.layer.cornerRadius = 20
        saveButton.setTitle("Сохранить", for: .normal)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }

    func configureLayout() {
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            textField.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            textField.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16
            ),
            textField.heightAnchor.constraint(
                equalToConstant: 50
            )
        ])
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: 16
            ),
            saveButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -16
            ),
            saveButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            saveButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }

}

// MARK: - Actions

@objc
extension TaskCreationViewController {
    func saveTapped() {
        output?.saveTask(description: textField.text ?? "")
    }
}
