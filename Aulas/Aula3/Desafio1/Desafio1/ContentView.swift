//
//  ContentView.swift
//  Desafio1
//
//  Created by Turma01-28 on 21/03/25.
//

import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = UIColor.white
    }
    var body: some View {
        TabView {
            RosaView()
                .tabItem {
                    Label("Rosa", systemImage: "paintbrush.fill")
                }
            AzulView()
                .tabItem {
                    Label("Azul", systemImage: "paintbrush.pointed.fill")
                }
            CinzaView()
                .tabItem {
                    Label("Cinza", systemImage: "paintpalette.fill")
                }
            ListaView()
                .tabItem {
                    Label("Lista", systemImage: "list.bullet")
                }
        }
        .tint(.black)
    }
}

#Preview {
    ContentView()
}
