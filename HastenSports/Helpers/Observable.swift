//
//  Observable.swift
//  HastenSports
//
//  Created by Jero Sánchez on 30/12/2019.
//  Copyright © 2019 Jero Sánchez. All rights reserved.
//

import Foundation

class Observable<T> {
    
    typealias Observer = (T) -> ()
    
    // MARK: - Properties
    
    private var observers = [Observer]()
    
    var value: T {
        didSet {
            notifyObservers()
        }
    }
    
    // MARK: - Intialization
    
    init (value: T) {
        self.value = value
    }
    
    // MARK: - API
    
    func bind(observer: @escaping Observer) {
        observers.append(observer)
    }
    
    func bindAndNotify(observer: @escaping Observer) {
        bind(observer: observer)
        observer(value)
    }
    
    // MARK: - Helpers
    
    private func notifyObservers() {
        for observer in observers {
            observer(value)
        }
    }
}
