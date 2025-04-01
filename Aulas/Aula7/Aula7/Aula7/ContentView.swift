//
//  ContentView.swift
//  Aula7
//
//  Created by Turma01-28 on 27/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var itemSelecionado: [SUChars] = []
    @State private var fusion: String = ""
    @StateObject var viewModel = ViewModel()
    
    func handleSelection(_ item: SUChars) {
        if itemSelecionado.contains(where: { $0.name == item.name }) {
            //Remover se ja estiver selecionado
            itemSelecionado.removeAll { $0.name == item.name }
        } else {
            // Adicionar se ainda não tiver dois itens selecionados
            if itemSelecionado.count < 5 {
                itemSelecionado.append(item)
            }
        }
        
        // Ver se há dois itens selecionados
        if itemSelecionado.count < 5 {
            // Lógica com os dois itens selecionados
            for c in viewModel.personagens {
                var cont = 0
                if c.isFusion == true {
                    for i in itemSelecionado {
                        for j in c.fusionGems! {
                            if (j == i.name) {
                                cont += 1
                            }
                        }
                    }
                    if cont == c.fusionGems!.count {
                        fusion = "\(c.img)"
                        print(fusion)
                    }
                }
            }
        }
    }
    
    var body: some View {
        ZStack {
            Color.pink.opacity(0.2)
                .ignoresSafeArea()
            VStack {
                AsyncImage(url: URL(string: fusion)){
                    image in image.resizable()
                } placeholder: {
                    ProgressView()
                }
                    .frame(width: 300, height: 300)
                
                Spacer()
                
                ScrollView {
                    LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 4)) {
                        ForEach(viewModel.personagens, id: \.self) { item in
                            if item.isFusion == false {
                                AsyncImage(url: URL(string: item.img)){
                                    image in image.resizable()
                                } placeholder: {
                                    ProgressView()
                                }
                                    .frame(width: 50, height: 50)
                                    .padding()
                                    .background(itemSelecionado.contains(where: { $0.name == item.name }) ? Color.blue : Color.pink)
                                    .cornerRadius(8)
                                    .onTapGesture {
                                        handleSelection(item)
                                }
                            }
                        }
                    }
                }
                .tint(.white)
                .onAppear() { viewModel.fetch() }
                .padding()
            }
        }
    }
}

#Preview {
    ContentView()
}

