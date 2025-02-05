//
//  PetsViewModel.swift
//  AppCatsTest
//
//  Created by Jose Preatorian on 03-02-25.
//
import Foundation

class PetsViewModel: ObservableObject {
    
    private let webService: webServicesHits
    @Published var pets: [Pets] = []
    @Published var errorMessage: String?
    @Published var isLoading: Bool = false  
    
    var reloadData: (() -> Void)?
    
    init(webService: webServicesHits = webServicesHits()) {
        self.webService = webService
        self.errorMessage = nil
    }
    
    func fetchArticules() {
        isLoading = true
        webService.getArticles { [weak self] results in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isLoading = false
                if let results = results {
                    self.pets = results
                    self.reloadData?()
                } else {
                    self.errorMessage = "Failed to load data."
                }
            }
        }
    }
  
    func articulos(at index: Int) -> Pets? {
        guard index >= 0 && index < pets.count else { return nil }
        return pets[index]
    }
}
