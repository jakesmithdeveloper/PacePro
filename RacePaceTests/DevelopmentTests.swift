//
//  DevelopmentTests.swift
//  RunnerToolsTests
//
//  Created by Jake Smith on 10/6/22.
//


import CoreData
import SwiftUI
import XCTest
@testable import RunnerTools

final class DevelopmentTests: BaseTestCase {

    func testSampleDataCreationWorks() throws {
        try dataController.createSampleData()
        
        XCTAssertEqual(dataController.count(for: Race.fetchRequest()), 6)
    }
    
    func testDeleteAllClearsEverything() throws {
        try dataController.createSampleData()
        dataController.deleteAll()
        
        XCTAssertEqual(dataController.count(for: Race.fetchRequest()), 0)
    }
    
    func testBindingOnChange() {
        var onChangeFunctionRun = false
        
        func exampleFunctionToCall() {
            onChangeFunctionRun = true
        }
        
        var storedValue = ""
        
        let binding = Binding(
            get: { storedValue },
            set: { storedValue = $0 }
        )
        
        let changedBinding = binding.onChange(exampleFunctionToCall)
        changedBinding.wrappedValue = "Test"
        
        XCTAssertTrue(onChangeFunctionRun, "The onchange function must be run when the binding is changed")
    }

}
