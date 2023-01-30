//
//  AppRouter.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

protocol AppRouter: AnyObject {
    func start()
    func dismissModule()
    func showTaskCreation(output: TaskCreationModuleOutput)
}
