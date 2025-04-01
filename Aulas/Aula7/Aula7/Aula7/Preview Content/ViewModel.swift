//
//  ViewModel.swift
//  Aula7
//
//  Created by Turma01-28 on 27/03/25.
//

import Foundation
class ViewModel: ObservableObject {
    
    @Published var personagens: [SUChars] = []
    
    func fetch() {
        
        guard let url = URL(string: "http://127.0.0.1:1880/characters/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                let parsed = try JSONDecoder().decode([SUChars].self, from: data)
                
                DispatchQueue.main.async {
                    
                    self?.personagens = parsed
                }
                
            } catch {
                
                print(error)
            }
        }
        
        task.resume()
    }
}

