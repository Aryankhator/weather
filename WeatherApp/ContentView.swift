//
//  ContentView.swift
//  WeatherApp
//
//  Created by Preeti NK on 01/05/24.
//

import SwiftUI

struct ContentView: View {
    @State var isNight: Bool = false

    var body: some View {
        ZStack {
            LinearGradient (gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray :  Color("lightblue")]),
                            startPoint: .topLeading, endPoint: .bottomTrailing)
                    .edgesIgnoringSafeArea(.all)
            VStack {
                Text("Delhi, India")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundStyle(.white)
                    .padding()
                VStack(spacing: 0) {
                    Image(systemName: "cloud.sun.fill")
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 100, height: 100)
                    Text("45°")
                        .font(.system(size: 70, weight: .medium))
                        .foregroundStyle(.white)
                }
                .padding(.bottom, 40)
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", temp: 40)
                    WeatherDayView(dayOfWeek: "WDE", imageName: "sun.max.fill", temp: 45)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", temp: 25)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sunset.fill", temp: 30)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snow", temp: 7)
                    
                }
                Spacer()
                Button {
                    withAnimation {
                        isNight.toggle()
                    }
                    print("tapped")
                } label: {
                    Text("Change Day Time")
                        .frame(width: 280, height: 50)
                        .font(.system(size: 20, weight: .bold, design: .default))
                        .background(.white)
                        .cornerRadius(10)
                }
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temp: Int
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundStyle(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            Text("\(temp)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}
