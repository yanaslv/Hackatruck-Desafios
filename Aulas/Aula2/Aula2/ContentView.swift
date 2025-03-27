//
//  ContentView.swift
//  Aula2
//
//  Created by Turma01-28 on 20/03/25.
//

import SwiftUI

struct ContentView: View {
    @State private var km: Double = 0
    @State private var hrs: Double = 0
    @State private var res: Double = 0
    @State private var img: Int = 0
    @State private var cor: Color = .gray
    
    func Calcular() {
        if hrs != 0 {
            res = km / hrs
        }
        if res < 10 {
            img = 1
            cor = .green
        } else if res < 30 {
            img = 2
            cor = .blue
        } else if res < 70 {
            img = 3
            cor = .orange
        } else if res < 90 {
            img = 4
            cor = .yellow
        } else {
            img = 5
            cor = .red
        }
    }
    
    var body: some View {
        VStack {
            VStack{
                Text("Digite a distância (km)")
                    .font(.headline)
                TextField("Kilômetros", value: $km, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode) // sem sugestões ao digitar
                    .background(.white.opacity(0.8))
                    .cornerRadius(100)
                Text("Digite o tempo (h)")
                    .font(.headline)
                TextField("Horas", value: $hrs, format: .number)
                    .keyboardType(.decimalPad)
                    .textContentType(.oneTimeCode)
                    .background(.white.opacity(0.8))
                    .cornerRadius(100)
                Button("Calcular") {
                    Calcular() }
                .padding()
                .background(.black.opacity(0.8))
                .cornerRadius(10)
            }
            .multilineTextAlignment(.center)
            
            .padding(20)
            
            VStack {
                Text("\(res, specifier: "%.2f") km/h")
                        .font(.title)
                
                Image("animal\(img)")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 550, height: 300)
                    .clipShape(Circle())
                }
                
            VStack {
                HStack{
                    Text("TARTARUGA (0 - 9.9 km/h)")
                    Spacer()
                    Circle()
                        .foregroundStyle(.green)
                }
                HStack{
                    Text("ELEFANTE (10 - 29.9 km/h)")
                    Spacer()
                    Circle()
                        .foregroundStyle(.blue)
                }
                HStack{
                    Text("AVESTRUZ (30 - 69.9 km/h)")
                    Spacer()
                    Circle()
                        .foregroundStyle(.orange)
                }
                HStack{
                    Text("LEÃO (70 - 89.9 km/h)")
                    Spacer()
                    Circle()
                        .foregroundStyle(.yellow)
                }
                HStack{
                    Text("GUEPARDO (90 - 130 km/h)")
                    Spacer()
                    Circle()
                        .foregroundStyle(.red)
                }
            }
            .foregroundStyle(.white)
            .frame(width: .infinity, height: .infinity)
            .padding(10)
            .background(.black.opacity(0.8))
            .cornerRadius(10)
            .padding(5)
        }
        .background(cor.opacity(0.8))
    }
}

#Preview {
    ContentView()
}
