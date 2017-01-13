weekday(monday).
weekday(tuesday).
weekday(wednesday).
weekday(thursday).
weekday(friday).
weekday(saturday).
weekday(sunday).

workday(monday).
workday(tuesday).
workday(wednesday).
workday(thursday).
workday(friday).

weekend(saturday).
weekend(sunday).

schoolnight(Day) :-
  weekday(Day),
  Day \= friday,
  Day \= saturday.

return_time(Minutes, Time) :-
  get_time(CurrentTime),
  stamp_date_time(CurrentTime, CurrentTimeStamp, local),
  date_time_value(year, CurrentTimeStamp, Year),
  date_time_value(month, CurrentTimeStamp, Month),
  date_time_value(day, CurrentTimeStamp, Day),
  date_time_stamp(date(Year, Month, Day, 0, Minutes, 0, 0, -, -), Stamp),
  stamp_date_time(Stamp, D, 0),
  date_time_value(time, D, Time).

schedule(wakeup, TaskLength, TaskStartTime, Day) :- 
  weekday(Day),
  TaskLength is 0,
  TaskStartTime is 300.

schedule(exercise_morning, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60,
  schedule(wakeup, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(brush_teeth_morning, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 10,
  schedule(exercise_morning, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(brush_teeth_morning, TaskLength, TaskStartTime, Day) :-
  weekend(Day),
  TaskLength is 5,
  schedule(wakeup, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(shower, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 15,
  schedule(brush_teeth_morning, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(shower, TaskLength, TaskStartTime, Day) :-
  weekend(Day),
  TaskLength is 20,
  schedule(brush_teeth_morning, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(breakfast, TaskLength, TaskStartTime, Day) :-
  weekday(Day),
  TaskLength is 30,
  schedule(shower, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(travel_to_work, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60,
  schedule(breakfast, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(laundry, TaskLength, TaskStartTime, Day) :-
  Day == sunday,
  TaskLength is 5,
  schedule(breakfast, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(work_before_lunch, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60 * 3.5,
  schedule(travel_to_work, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(lunch, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 45,
  schedule(work_before_lunch, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(work_after_lunch, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60 * 4,
  schedule(lunch, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(travel_from_work, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60,
  schedule(work_after_lunch, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(exercise_afternoon, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60,
  schedule(travel_from_work, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(dinner, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60,
  schedule(exercise_afternoon, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(prepare_for_next_day, TaskLength, TaskStartTime, Day) :-
  workday(Day),
  TaskLength is 60,
  schedule(dinner, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(leisure, TaskLength, TaskStartTime, Day) :-
  schoolnight(Day),
  TaskLength is 15,
  schedule(prepare_for_next_day, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(brush_teeth_evening, TaskLength, TaskStartTime, Day) :-
  schoolnight(Day),
  TaskLength is 5,
  schedule(leisure, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(prepare_for_bed, TaskLength, TaskStartTime, Day) :-
  schoolnight(Day),
  TaskLength is 30,
  schedule(brush_teeth_evening, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.

schedule(slumber, TaskLength, TaskStartTime, Day) :-
  schoolnight(Day),
  TaskLength is 0,
  schedule(prepare_for_bed, PreviousTaskLength, PreviousTaskStartTime, Day),
  TaskStartTime is PreviousTaskStartTime + PreviousTaskLength.
