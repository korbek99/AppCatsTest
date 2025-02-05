//
//  PetsContentView.swift
//  AppCatsTest
//
//  Created by Jose Preatorian on 03-02-25.
//
import SwiftUI

struct PetsContentView: View {
    
    @StateObject public var viewModel = PetsViewModel()
    @State public var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                
                if viewModel.isLoading {
                    ProgressView("Cargando mascotas...")
                        .progressViewStyle(CircularProgressViewStyle())
                        .padding()
                } else {
                    
                    if let errorMessage = viewModel.errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .padding()
                    }
                
                    SearchBar(text: $searchText)
                    List(filteredPets, id: \.id) { pet in
                        NavigationLink(destination: DetailsPetContentView(pet: pet)) {
                            HStack {
                                AsyncImage(url: URL(string: pet.url)) { phase in
                                    switch phase {
                                    case .empty:
                                        ProgressView()
                                    case .success(let image):
                                        image.resizable()
                                             .scaledToFit()
                                             .frame(width: 100, height: 150)
                                             .clipShape(RoundedRectangle(cornerRadius: 10))
                                    case .failure:
                                        Image(systemName: "photo.fill")
                                            .resizable()
                                            .scaledToFit()
                                            .frame(width: 100, height: 150)
                                            .clipShape(RoundedRectangle(cornerRadius: 10))
                                    @unknown default:
                                        EmptyView()
                                    }
                                }

                                VStack(alignment: .leading, spacing: 10) {
                                    if let breedName = pet.breeds.first?.name {
                                        Text("Raza: \(breedName)")
                                            .font(.headline)
                                    } else {
                                        Text("Raza: Sin raza")
                                            .font(.headline)
                                    }
                                    
                                    if let tempe = pet.breeds.first?.temperament {
                                        Text("Temperamento: \(tempe)")
                                            .font(.headline)
                                    } else {
                                        Text("Temperamento: S/N")
                                    }

                                    if let origins = pet.breeds.first?.origin {
                                        Text("Origen: \(origins)")
                                            .font(.headline)
                                    } else {
                                        Text("Origen: S/N")
                                    }
                                }
                                Spacer()
                            }
                        }
                    }
                }
            }
            .onAppear {
                viewModel.fetchArticules()  
            }
            .navigationTitle("Pets")
        }
    }

    var filteredPets: [Pets] {
        if searchText.isEmpty {
            return viewModel.pets
        } else {
            return viewModel.pets.filter { pet in
                pet.breeds.first?.name.lowercased().contains(searchText.lowercased()) ?? false
            }
        }
    }
}

struct PetsContentView_Previews: PreviewProvider {
    static var previews: some View {
        PetsContentView()
    }
}

struct SearchBar: View {
    
    @Binding var text: String
    
    var body: some View {
        HStack {
            TextField("Buscar raza", text: $text)
                .padding(7)
                .background(Color(.secondarySystemBackground))
                .cornerRadius(8)
                .padding(.horizontal)
            
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing)
                }
            }
        }
    }
}
