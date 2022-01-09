//
//  UIViewController+Context.swift
//  CidadeLimpa
//
//  Created by user209392 on 1/8/22.
//

import UIKit
import CoreData

extension UIViewController {
    var context: NSManagedObjectContext{
        let appDelagate = UIApplication.shared.delegate as! AppDelegate
        return appDelagate.persistentContainer.viewContext
    }
}
