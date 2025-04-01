//
//  ContentView.swift
//  Aula9
//
//  Created by Turma01-28 on 01/04/25.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        ZStack {
            Color.blue.opacity(0.1)
                .ignoresSafeArea()
            VStack {
                Text("Sensor de Umidade")
                    .font(.largeTitle)
                    .padding()
                Text("Umidade medida:")
                    .font(.title)
                ScrollView {
                    ForEach(viewModel.value.reversed(), id: \.self) { valor in
                        Text("\(valor.umidade)%")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .multilineTextAlignment(.center)
                            .background(.blue.opacity(0.4))
                            .clipShape(.buttonBorder)
                    }
                }
            }
            .padding()
            .onAppear { 
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { _ in
                    viewModel.fetch()
                }
        }
        }
    }
}

#Preview {
    ContentView()
}
