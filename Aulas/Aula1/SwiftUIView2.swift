//
//  SwiftUIView2.swift
//  Aula1
//
//  Created by Turma01-28 on 19/03/25.
//

import SwiftUI

struct SwiftUIView2: View {
    @State private var name = "Fulano"
    @State private var showingAlert = false
    var body: some View {
        ZStack {
            Image("hackatruck")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
                .opacity(0.3)
            
            VStack {
                Text("Bem vindo, \(name)")
                    .font(.title)
                
                TextField("Nome", text: $name)
                
                Spacer()
                
                Image("hackalogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                
                Spacer()
                
                Button("Entrar") {
                            showingAlert = true
                        }
                .alert(isPresented: $showingAlert) {
                    Alert(
                        title: Text("ALERTA !"),
                        message: Text("Você irá iniciar o desafio da aula agora"),
                        dismissButton: .default(Text("Vamos lá!"))
                    )

                }
                    .foregroundStyle(.blue)
            }
                .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SwiftUIView2()
}
