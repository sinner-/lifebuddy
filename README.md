# lifebuddy
What you should be doing with your life.

## Pre-requisites

 * Install GNU Prolog: `dnf install gprolog`

## Usage
 * Compile with: `consult('lifebuddy.pl').`.
 * See the schedule with: `schedule(X, Y, monday).`, pick any day of the week.
 * See what tasks are scheduled for during a particular hour with: `schedule(X, start_time(17, _, _), monday).`.
 * Check when a particular task is scheduled with: `schedule(laundry,X,Y).`.
