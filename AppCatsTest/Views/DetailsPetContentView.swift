//
//  DetailsPetContentView.swift
//  AppCatsTest
//
//  Created by Jose Preatorian on 03-02-25.
//
import SwiftUI

struct DetailsPetContentView: View {
    let pet: Pets
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                AsyncImage(url: URL(string: pet.url)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image.resizable()
                             .scaledToFit()
                             .frame(width: 300, height: 300)
                             .clipShape(RoundedRectangle(cornerRadius: 20))
                             .padding()
                    case .failure:
                        Image(systemName: "photo.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 300, height: 300)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .padding()
                    @unknown default:
                        EmptyView()
                    }
                }

  
                Text("ID: \(pet.id)")
                    .font(.headline)
                    .padding([.top, .bottom])

  
                if let breedName = pet.breeds.first?.name {
                    Text("Breed: \(breedName)")
                        .font(.title2)
                        .padding(.bottom)
                } else {
                    Text("Breed: Sin raza")
                        .font(.title2)
                        .padding(.bottom)
                }

        
                if let description = pet.breeds.first?.description {
                    Text("Description: \(description)")
                        .padding([.top, .bottom])
                }
                
 
                Text("Temperament: \(pet.breeds.first?.temperament ?? "Unknown")")
                    .padding(.bottom)

                Text("Origin: \(pet.breeds.first?.origin ?? "Unknown")")
                    .padding(.bottom)

                if let vetstreetUrl = pet.breeds.first?.vetstreetURL,
                   let url = URL(string: vetstreetUrl) {
                    Button(action: {
                        openURL(url)
                    }) {
                        HStack {
                            Image(systemName: "link.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                            Text("View on Vetstreet")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                }
                
                if let vcahospitalurl = pet.breeds.first?.vcahospitalsURL,
                   let url = URL(string: vcahospitalurl) {
                    Button(action: {
                        openURL(url)
                    }) {
                        HStack {
                            Image(systemName: "link.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                            Text("View on Hospitals")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                }
                
                if let wikipediaurl = pet.breeds.first?.wikipediaURL,
                   let url = URL(string: wikipediaurl) {
                    Button(action: {
                        openURL(url)
                    }) {
                        HStack {
                            Image(systemName: "link.circle.fill")
                                .font(.title)
                                .foregroundColor(.blue)
                            Text("View on Wikipedia")
                                .font(.headline)
                                .foregroundColor(.blue)
                        }
                        .padding()
                    }
                }
            }
            .padding()
        }
        .navigationTitle("Pet Details")
    }

    public func openURL(_ url: URL) {
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}
