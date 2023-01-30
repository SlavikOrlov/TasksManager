//
//  Presentable.swift
//  MyTasks
//
//  Created by Slava Orlov on 30.01.2023.
//

import UIKit

protocol Presentable: AnyObject {
    var viewContoller: UIViewController { get }
}
