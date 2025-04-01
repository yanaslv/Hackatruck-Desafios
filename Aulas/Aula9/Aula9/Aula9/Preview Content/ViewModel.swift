//
//  ViewModel.swift
//  Aula9
//
//  Created by Turma01-28 on 01/04/25.
//

import Foundation

class ViewModel: ObservableObject {
    
    @Published var value: [Umidade] = []
    
    func fetch() {
        
        guard let url = URL(string: "http://192.168.128.11:1880/sensorUmidade/") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                
                let parsed = try JSONDecoder().decode([Umidade].self, from: data)
                
                DispatchQueue.main.async {
                    
                    self?.value = parsed
                }
                
            } catch {
                
                print(error)
            }
        }
        
        task.resume()
    }
}

