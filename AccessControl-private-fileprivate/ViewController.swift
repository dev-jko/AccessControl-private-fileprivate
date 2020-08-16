//
//  ViewController.swift
//  AccessControl-private-fileprivate
//
//  Created by Jaedoo Ko on 2020/08/16.
//  Copyright © 2020 jko. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}



private class PrivateClass {
    let property = 1
    fileprivate let fileprivateProperty = 2
    private let privateProperty = 3
    
    internal let internalProperty = 4
    public let publicProperty = 5
    open var openProperty = 6
}


fileprivate class FileprivateClass {
    let property = 1
    fileprivate let fileprivateProperty = 2
    private let privateProperty = 3
}


public final class SomeClass {
    fileprivate let p = PrivateClass()
    fileprivate let fp = FileprivateClass()

    private let p2 = PrivateClass()
    private let fp2 = FileprivateClass()
    
    public init() {}
    
    public func someFunc() {
        p.property
        p.fileprivateProperty
        // p.privateProperty // error!

        fp.property
        fp.fileprivateProperty
        // fp.privateProperty // error!

        p2.property
        p2.fileprivateProperty
        // p2.privateProperty // error!

        fp2.property
        fp2.fileprivateProperty
        // fp2.privateProperty // error!
        
    }
}



class SomeClass2 {
    private class PrivateClass {
        let a = 1
        fileprivate let b = 2
        private let c = 3
        
        func f() { }
    }
    
    class InternalClass {
        func f() {
            let p = PrivateClass()
            p.a
            p.b
            // p.c // error!
            p.f()
        }
    }
    
    func f() {
        let p = PrivateClass()
        p.a
        p.b
        // p.c // error!
        p.f()
    }
}


