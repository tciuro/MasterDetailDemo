//
//  AppDelegate.swift
//  MasterDetailDemo
//
//  Created by Tito Ciuro on 3/18/16.
//  Copyright © 2016 Webbo, Inc. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        let splitViewController = self.window!.rootViewController as! UISplitViewController
        let navigationController = splitViewController.viewControllers[splitViewController.viewControllers.count-1] as! UINavigationController
        navigationController.topViewController!.navigationItem.leftBarButtonItem = splitViewController.displayModeButtonItem
        splitViewController.delegate = self
        return true
    }

    // MARK: - Split view

    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController:UIViewController, onto primaryViewController:UIViewController) -> Bool {
        if let primaryNav = primaryViewController as? UINavigationController {
            if let secondaryNav = secondaryViewController as? UINavigationController {
                primaryNav.viewControllers = primaryNav.viewControllers + secondaryNav.viewControllers
                return true
            }
        }
        guard let secondaryAsNavController = secondaryViewController as? UINavigationController else { return false }
        guard let topAsDetailController = secondaryAsNavController.topViewController as? DetailViewController else { return false }
        if topAsDetailController.detailItem == nil {
            // Return true to indicate that we have handled the collapse by doing nothing; the secondary controller will be discarded.
            return true
        }
        return false
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, separateSecondaryFrom primaryViewController: UIViewController) -> UIViewController? {
        if let primaryNav = primaryViewController as? UINavigationController {
            if let secondary = primaryNav.visibleViewController {
                // Depending on your requirements you may need to remove more than just the top view controller.
                primaryNav.popViewController(animated: false)
                return UINavigationController(rootViewController: secondary)
            }
        }
        return nil
    }

}

