//
//  TaskCreationViewController.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

final class TaskCreationViewController: UIViewController {

    // MARK: - Constants

    private enum Constants {
        static let leftConstraint: Double = 16
        static let rightConstraint: Double = -16
        static let heightConstraint: Double = 50
        static let buttonCornerRadius: Double = 20
    }

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
        title = NSLocalizedString("creation_screen_title", comment: "")
        configureBackground()
        configureTextField()
        configureSaveButton()
        configureLayout()
        setupKeyboardNotificaition()
    }

    func configureBackground() {
        view.backgroundColor = AssetColor.white
    }

    func configureTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.borderStyle = .roundedRect
    }

    func configureSaveButton() {
        view.addSubview(saveButton)
        saveButton.translatesAutoresizingMaskIntoConstraints = false
        saveButton.backgroundColor = AssetColor.blue
        saveButton.layer.cornerRadius = Constants.buttonCornerRadius
        saveButton.setTitle(NSLocalizedString("creation_screen_save_button", comment: ""), for: .normal)
        saveButton.addTarget(self, action: #selector(saveTapped), for: .touchUpInside)
    }

    func configureLayout() {
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.leftConstraint
            ),
            textField.topAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.topAnchor
            ),
            textField.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.rightConstraint
            ),
            textField.heightAnchor.constraint(
                equalToConstant: Constants.heightConstraint
            )
        ])
        NSLayoutConstraint.activate([
            saveButton.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: Constants.leftConstraint
            ),
            saveButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: Constants.rightConstraint
            ),
            saveButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor
            ),
            saveButton.heightAnchor.constraint(equalToConstant: Constants.heightConstraint)
        ])
    }

    func setupKeyboardNotificaition() {
        self.hideKeyboardOnTap()
    }

}

// MARK: - Actions

@objc
extension TaskCreationViewController {
    func saveTapped() {
        output?.saveTask(description: textField.text ?? "")
    }
}
