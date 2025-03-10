//
//  TaskModel.swift
//  TaskManagerD2
//
//  Created by Rawan on 10/09/1446 AH.
//
import SwiftUI
//here is the structure of my tasks
struct Task: Identifiable {
    let id = UUID()
    var title: String
    var isCompleted: Bool
}
