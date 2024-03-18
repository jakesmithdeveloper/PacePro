////
////  RaceTests.swift
////  RunnerToolsTests
////
////  Created by Jake Smith on 10/5/22.
////
//
//import CoreData
//import XCTest
////@testable import RunnerTools
//
//class RaceTests: BaseTestCase {
//
//    func testCreatingRaces() {
//        let targetCount = 10
//        for _ in 0..<targetCount {
//            let _ = Race(context: managedObjectContext)
//        }
//        
//        XCTAssertEqual(dataController.count(for: Race.fetchRequest()), targetCount)
//    }
//    
//    func testDeletingRaces() throws {
//        try dataController.createSampleData()
//        
//        let request = NSFetchRequest<Race>(entityName: "Race")
//        let races = try managedObjectContext.fetch(request)
//        
//        XCTAssertEqual(dataController.count(for: Race.fetchRequest()), 6)
//        
//        dataController.delete(races[0])
//        
//        XCTAssertEqual(dataController.count(for: Race.fetchRequest()), 5)
//    }
//    
//}
