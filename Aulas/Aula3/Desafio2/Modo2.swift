//
//  Modo2.swift
//  Desafio2
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct Modo2: View {
    var body: some View {
        NavigationStack {
            ZStack{
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                VStack {
                    Text("Modo 2")
                        .padding()
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        .bold()
                        .foregroundStyle(.white)
                    
                    Spacer()
                    
                    VStack {
                        Text("Tiago")
                        Text("Bem-vindo, Tiago")
                            .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                        NavigationLink("Acessar Tela") {
                            Modo2Parte2()
                        }
                        .padding()
                        .background(.blue)
                        .clipShape(.buttonBorder)
                        .shadow(color: .black.opacity(0.5), radius: 10, y: 5)
                    }
                    .padding(EdgeInsets(top: 50, leading: 50, bottom: 40, trailing: 50))
                    .font(.headline)
                    .background(.pink.opacity(0.8))
                    .clipShape(.buttonBorder)
                    .foregroundStyle(.white)
                    
                    Spacer()
                }
            }
        }
    }
}

#Preview {
    Modo2()
}
