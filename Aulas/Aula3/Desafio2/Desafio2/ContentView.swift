//
//  ContentView.swift
//  Desafio2
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var showingSheet = false
    var body: some View {
       NavigationStack {
            ZStack {
                Color.black.opacity(0.8)
                    .ignoresSafeArea()
                VStack {
                    Image("hackalogo")
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .foregroundColor(.white)
                        .padding(EdgeInsets(top: 10, leading: 50, bottom: 10, trailing: 50))
                    
                    Spacer()
                    
                    NavigationLink("Modo 1") { Modo1() }
                        .padding(EdgeInsets(top: 30, leading: 80, bottom: 30, trailing: 80))
                        .font(.headline)
                        .background(.pink.opacity(0.8))
                        .clipShape(.buttonBorder)
                        .foregroundStyle(.white)
                        
                    NavigationLink("Modo 2") { Modo2() }
                        .padding(EdgeInsets(top: 30, leading: 80, bottom: 30, trailing: 80))
                        .font(.headline)
                        .background(.pink.opacity(0.8))
                        .clipShape(.buttonBorder)
                        .foregroundStyle(.white)
                    
                        Button("Modo 3") {
                            showingSheet.toggle() }
                        .sheet(isPresented: $showingSheet) {
                            SheetView()
                        }
                        .padding(EdgeInsets(top: 30, leading: 80, bottom: 30, trailing: 80))
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
    ContentView()
}
