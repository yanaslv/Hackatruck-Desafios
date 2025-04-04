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
                        if cont == c.fusionGems!.count {
                            fusion = "\(c.img)"
                        }
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
                Text("Fusion Maker")
                    .padding()
                    .font(.largeTitle)
                    .foregroundStyle(.pink)
                
                Spacer()
                
                AsyncImage(url: URL(string: fusion)){
                    image in image.resizable()
                } placeholder: {
                    ProgressView()
                }
                    .frame(width: 300, height: 350)
                
                Spacer()
                
                LazyVGrid(columns: Array(repeating: GridItem(.flexible()), count: 5)) {
                    ForEach(viewModel.personagens, id: \.self) { item in
                        if item.isFusion == false {
                            AsyncImage(url: URL(string: item.img)){
                                image in image.resizable()
                            } placeholder: {
                                ProgressView()
                            }
                                .frame(width: 40, height: 40)
                                .padding()
                                .background(itemSelecionado.contains(where: { $0.name == item.name }) ? Color.pink.opacity(0.8) : Color.pink.opacity(0.4))
                                .cornerRadius(8)
                                .onTapGesture {
                                    handleSelection(item)
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

