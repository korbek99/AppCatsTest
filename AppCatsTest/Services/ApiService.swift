//
//  ApiService.swift
//  AppCatsTest
//
//  Created by Jose Preatorian on 03-02-25.
//
import Foundation
import UIKit

class webServicesHits {
    var urlbase: String = ""
    var utils = UtilServices()

    func getArticles(completion: @escaping ([Pets]?) -> ()) {
        
        guard let endpointData = utils.getEndpoint(fromName: "crearIssue") else {
            print("Error: No se pudo obtener el endpoint.")
            return
        }
        
        print(endpointData.url)
        
        guard let url = URL(string: endpointData.url.absoluteString) else {
            print("Error: URL no válida.")
            completion(nil)
            return
        }
        URLSession.shared.dataTask(with: url) { [weak self] data, response, error in

            if let error = error {
                print("Error en la solicitud: \(error.localizedDescription)")
                completion(nil)
                return
            }

            guard let data = data else {
                print("Error: No se recibieron datos.")
                completion(nil)
                return
            }
            do {
                let petsList = try JSONDecoder().decode([Pets].self, from: data)
                let allBreeds = petsList
                
                print("Breeds recibidos: \(allBreeds)")
                completion(allBreeds)
            } catch {
                print("Error al decodificar JSON: \(error.localizedDescription)")
                completion(nil)
            }
            
        }.resume()
    }
}
