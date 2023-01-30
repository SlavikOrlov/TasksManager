//
//  AppRouter.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

protocol AppRouter: AnyObject {
    init(window: UIWindow)
    func start()
}
