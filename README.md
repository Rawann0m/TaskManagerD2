# To-Do List App
A simple and intuitive To-Do List app built with SwiftUI. This app allows users to:

Add new tasks.
Mark tasks as completed.
Delete tasks.
Toggle between Dark Mode and Light Mode.

# Features
Task Management: Users can add tasks, mark them as completed, and delete them.
Dark Mode Support: Toggle between dark and light modes based on user preference.
Task Completion Indicator: Completed tasks are visually distinguished with a checkmark and strikethrough.

# Usage
Adding Tasks: Enter a new task in the text field and press the "+" button to add it to the list.
Marking Tasks as Completed: Tap on the circle icon next to the task to mark it as completed. A checkmark will appear and the task will be struck through.
Deleting Tasks: Swipe left on a task to reveal the delete button.
Dark Mode: Toggle the switch at the bottom to enable/disable dark mode.

# Code Overview
ContentView.swift
This is the main view of the app, containing:

State Properties:

tasks: An array of Task objects representing the task list.
newTask: A string for holding the new task input from the user.
isDarkMode: A boolean to track whether dark mode is enabled.
UI Elements:

A text field to input new tasks.
A button (+) to add a new task.
A list displaying tasks with the option to mark them as completed or delete them.
A toggle switch for enabling dark mode.
Functions:

addTask(): Adds a new task to the task list.
toggleTaskCompletion(task:): Marks a task as completed or not.
deleteTask(at:): Deletes a task from the list.
Task.swift
The Task struct represents a task in the app, with the following properties:

id: A unique identifier for each task (using UUID).
title: The title/description of the task.
isCompleted: A boolean indicating whether the task is completed or not
