# lifebuddy
What you should be doing with your life.

## Pre-requisites

 * Debian/Ubuntu: `apt-get install swipl`
 * Fedora: `dnf install pl`
 * MacOS Homebrew: `brew install swipl`

## Usage
 * Compile with: `consult('lifebuddy.pl').`
 * See the schedule with: `schedule(Task, TaskLength, TaskStartTime, monday), return_time(TaskStartTime, Time).`, pick any day of the week.
 * See what tasks are scheduled for during a particular hour with: `schedule(Task, TaskLength, TaskStartTime, monday), return_time(TaskStartTime, time(17,Minutes,_)).`
 * Check when a particular task is scheduled with: `schedule(laundry, TaskLength, TaskStartTime, sunday), return_time(TaskStartTime, Time).`
