//
//  PetsContentViewTests.swift
//  AppCatsTestTests
//
//  Created by Jose Preatorian on 05-02-25.
//
import XCTest
import SwiftUI
@testable import AppCatsTest

class PetsContentViewTests: XCTestCase {
    
    var viewModel: PetsViewModel!
    var contentView: PetsContentView!
    
    override func setUpWithError() throws {
        super.setUp()
 
        viewModel = PetsViewModel()
        contentView = PetsContentView()

        let examplePets = [
            Pets(breeds: [Breed(weight: Weight(imperial: "50", metric: "23"), id: "1", name: "Bulldog", cfaURL: "", vetstreetURL: "", vcahospitalsURL: "", temperament: "Friendly", origin: "England", countryCodes: "", countryCode: "", description: "A sturdy dog", lifeSpan: "10 years", indoor: 1, lap: 0, adaptability: 3, affectionLevel: 5, childFriendly: 4, catFriendly: 3, dogFriendly: 5, energyLevel: 3, grooming: 2, healthIssues: 1, intelligence: 4, sheddingLevel: 2, socialNeeds: 4, strangerFriendly: 3, vocalisation: 1, bidability: 3, experimental: 0, hairless: 0, natural: 0, rare: 0, rex: 0, suppressedTail: 0, shortLegs: 0, wikipediaURL: "", hypoallergenic: 0, referenceImageID: "image")], id: "1", url: "https://google.com/image1.jpg", width: 100, height: 100)
        ]
        
        viewModel.pets = examplePets
    }
    
    override func tearDownWithError() throws {
        contentView = nil
        viewModel = nil
        super.tearDown()
    }

    func testPetsContentViewLoadedSuccessfully() throws {
        let hostingController = UIHostingController(rootView: contentView)
        XCTAssertNotNil(hostingController.view)
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text == "Pets"
            }
            return false
        }))
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text?.contains("Bulldog") == true
            }
            return false
        }))
    }
    
   
    func testSearchBarFiltering() throws {
        
        let searchText = "bulldog"
        contentView.searchText = searchText
        let filteredPets = contentView.filteredPets
        XCTAssertTrue(filteredPets.allSatisfy { pet in
            pet.breeds.first?.name.lowercased().contains(searchText.lowercased()) ?? false
        })
    }

    func testErrorMessageDisplayedWhenLoadingFails() throws {
        viewModel.errorMessage = "Error al cargar las mascotas"
        
        let hostingController = UIHostingController(rootView: contentView)
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let label = view as? UILabel {
                return label.text == "Error al cargar las mascotas"
            }
            return false
        }))
    }


    func testLoadingStateDisplayed() throws {
     
        viewModel.isLoading = true
        
        let hostingController = UIHostingController(rootView: contentView)
        XCTAssertTrue(hostingController.view.subviews.contains(where: { (view) in
            if let progressView = view as? UIActivityIndicatorView {
                return progressView.isAnimating
            }
            return false
        }))
    }

}
class MockPetsViewModel: PetsViewModel {
    var fetchArticulesCalled = false
    
    override func fetchArticules() {
        fetchArticulesCalled = true
    }
}
