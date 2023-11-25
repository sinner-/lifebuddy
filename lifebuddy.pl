% prolog

day(monday).
day(tuesday).
day(wednesday).
day(thursday).
day(friday).
day(saturday).
day(sunday).

activity(brush_teeth).
activity(exercise).
activity(work_morning).
activity(work_afternoon).
activity(date_night).
activity(sleep).
activity(visit_family).
activity(computer_chores).
activity(breakfast).
activity(lunch).
activity(dinner).

workday(Day) :-
  Day \= saturday,
  Day \= sunday.

weekend(Day) :-
  \+ workday(Day).

schoolnight(Day) :-
  day(Day),
  Day \= friday,
  Day \= saturday.

day_constraint(brush_teeth, Day) :- day(Day).
day_constraint(sleep, Day) :- day(Day).
day_constraint(exercise, Day) :- day(Day).
day_constraint(breakfast, Day) :- day(Day).
day_constraint(lunch, Day) :- day(Day).
day_constraint(dinner, Day) :- day(Day).
day_constraint(date_night, friday).
day_constraint(visit_family, wednesday).
day_constraint(work_morning, Day) :- workday(Day).
day_constraint(work_afternoon, Day) :- workday(Day).
day_constraint(computer_chores, Day) :- Day = sunday.

duration(brush_teeth, 5).
duration(sleep, 480).
duration(exercise, 60).
duration(breakfast, 30).
duration(lunch, 30).
duration(dinner, 30).
duration(date_night, 120).
duration(visit_family, 120).
duration(work_morning, 240).
duration(work_afternoon, 240).
duration(computer_chores, 60).

next(brush_teeth, exercise).
next(exercise, breakfast).
next(breakfast, work_morning).

time_constraint(brush_teeth, 420).
time_constraint(Activity, Timeslot) :-
  next(PreviousActivity, Activity),
  duration(PreviousActivity, Duration),
  time_constraint(PreviousActivity, PreviousTimeslot),
  Timeslot is Duration + PreviousTimeslot.

schedule(Day, Schedule) :-
  bagof([Activity, Timeslot], (
    day_constraint(Activity, Day),
    time_constraint(Activity, Timeslot)
  ), Schedule).
