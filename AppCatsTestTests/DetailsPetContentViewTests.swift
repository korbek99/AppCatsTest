//
//  DetailsPetContentViewTests.swift
//  AppCatsTestTests
//
//  Created by Jose Preatorian on 05-02-25.
//
import XCTest
import SwiftUI
@testable import AppCatsTest

class DetailsPetContentViewTests: XCTestCase {
    
    var pet: Pets!

    override func setUpWithError() throws {
        super.setUp()

        pet = Pets(breeds: [Breed(weight: Weight(imperial: "50", metric: "23"),
                                  id: "bulldog-id",
                                  name: "Bulldog",
                                  cfaURL: "https://cfa.com",
                                  vetstreetURL: "https://vetstreet.com",
                                  vcahospitalsURL: "https://vcahospitals.com",
                                  temperament: "Friendly",
                                  origin: "England",
                                  countryCodes: "GB",
                                  countryCode: "GB",
                                  description: "A sturdy dog.",
                                  lifeSpan: "10 years",
                                  indoor: 1,
                                  lap: 0,
                                  adaptability: 3,
                                  affectionLevel: 5,
                                  childFriendly: 4,
                                  catFriendly: 2,
                                  dogFriendly: 5,
                                  energyLevel: 4,
                                  grooming: 2,
                                  healthIssues: 1,
                                  intelligence: 3,
                                  sheddingLevel: 2,
                                  socialNeeds: 4,
                                  strangerFriendly: 3,
                                  vocalisation: 2,
                                  bidability: 3,
                                  experimental: 0,
                                  hairless: 0,
                                  natural: 1,
                                  rare: 0,
                                  rex: 0,
                                  suppressedTail: 0,
                                  shortLegs: 0,
                                  wikipediaURL: "https://wikipedia.org",
                                  hypoallergenic: 0,
                                  referenceImageID: "image-id")], id: "1",
                   url: "https://example.com/image.jpg",
                   width: 300, height: 300)
    }
    
    override func tearDownWithError() throws {
        pet = nil
        super.tearDown()
    }
    
    func testPetDetailsView() throws {
       
        let petDetailView = DetailsPetContentView(pet: pet)
        let hostingController = UIHostingController(rootView: petDetailView)

        XCTAssertNotNil(hostingController.view)
   
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text == "ID: 1"
            }
            return false
        }))
        
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text == "Breed: Bulldog"
            }
            return false
        }))
        
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text == "Temperament: Friendly"
            }
            return false
        }))
        
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text == "Origin: England"
            }
            return false
        }))
        
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text == "Description: A sturdy dog."
            }
            return false
        }))

        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let button = view as? UIButton {
                return button.titleLabel?.text == "View on Vetstreet"
            }
            return false
        }))
        
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let button = view as? UIButton {
                return button.titleLabel?.text == "View on Wikipedia"
            }
            return false
        }))
        
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let button = view as? UIButton {
                return button.titleLabel?.text == "View on Hospitals"
            }
            return false
        }))
    }
    
//    func testOpenURL() throws {
//     
//        let url = URL(string: "https://www.google.com")!
// 
//        let openURLMock = MockUIApplication()
//        petDetailView.openURL(url)
//
//        XCTAssertTrue(openURLMock.didOpenURL)
//    }
}

//class MockUIApplication: UIApplication {
//    var didOpenURL = false
//    
//    override func open(_ url: URL) -> Bool {
//        didOpenURL = true
//        return true
//    }
//}
