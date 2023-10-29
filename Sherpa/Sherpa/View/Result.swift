//
//  Result.swift
//  Sherpa
//
//  Created by Lasya Kambhampati on 10/28/23.
//

import SwiftUI

struct Result: View {
    @StateObject var resultVM: ResultViewModel = .init()
    @Namespace var animation
    
    // @State var gptFunction: gptFunction = gptFunction()
    
    var vacationDays: [Date] = []
    
    var body: some View {
        ZStack {
            Color.darkBlue.opacity(0.8)
                .ignoresSafeArea()
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack(spacing: 15, pinnedViews: [.sectionHeaders]) {
                    Section {
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 10) {
                                ForEach(self.resultVM.currentWeek, id: \.self) { day in
                                    
                                    Button {
                                        // change what part of the itinerary is shown
                                    } label: {
                                        VStack(spacing: 10) {
                                            Text(self.resultVM.extractDate(date: day, format: "dd"))
                                                .font(.system(size: 14))
                                                .fontWeight(.semibold)
                                            
                                            Text(self.resultVM.extractDate(date: day, format: "EEE"))
                                                .font(.system(size: 14))
                                            
                                            Circle()
                                                .fill(.white)
                                                .frame(width: 8, height: 8)
                                                .opacity(self.resultVM.isToday(date: day) ? 1 : 0)
                                        }
                                        .foregroundStyle(self.resultVM.isToday(date: day) ? .primary : .secondary)
                                        .foregroundColor(self.resultVM.isToday(date: day) ? .white : .black)
                                        .frame(width: 45, height: 90)
                                        .background(
                                            ZStack {
                                                if self.resultVM.isToday(date: day) {
                                                    Capsule()
                                                        .fill(.black)
                                                        .matchedGeometryEffect(id: "CURRENTDAY", in: self.animation)
                                                }
                                            })
                                        .contentShape(Capsule())
                                        .onTapGesture {
                                            withAnimation {
                                                self.resultVM.currentDay = day
                                            }
                                        }
                                    }
                                }
                            }
                            .padding(.horizontal)
                        }
                        Spacer()
                        self.TaskView()
                            .padding(.horizontal, 6)
                    } header: {
                        self.HeaderView()
                    }
                }
            }
        }
    }
    
    func TaskView() -> some View {
        LazyVStack(spacing: 80) {
            ForEach(0 ..< 3) { timeIndex in
                Section {
                    HStack (spacing: 30) {
                        Circle()
                            .fill(.white)
                            .frame(width: 15, height: 15)
                            .background(
                                Circle()
                                    .stroke(.white, lineWidth: 2)
                                    .padding(-5))
                        Text("\(self.resultVM.getTasks(timeOfDay: timeIndex))")
                            .multilineTextAlignment(.leading)
                            .font(.headline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                    }
                    .padding(.horizontal, 40)
                    .hLeading()
                    
                }
            }
        }
        .onChange(of: self.resultVM.currentDay) { _ in
            self.resultVM.changeDate()
        }
    }

    func HeaderView() -> some View {
        HStack(spacing: 20) {
            VStack(alignment: .leading, spacing: 10) {
                Text(Date().formatted(date: .abbreviated, time: .omitted))
                    .foregroundStyle(.white)
                Text("Today")
                    .font(.largeTitle.bold())
                    .foregroundStyle(.white)
            }
            .hLeading()
        }
        .padding()
        .background(Color.clear)
    }
}
    
#Preview {
    Result()
}

extension View {
    func hLeading() -> some View {
        self
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
    }
    
    func hTrailing() -> some View {
        self
            .frame(maxWidth: .infinity, alignment: .trailing)
    }
    
    func hCenter() -> some View {
        self
            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity/*@END_MENU_TOKEN@*/, alignment: .center)
    }
}
