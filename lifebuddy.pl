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

schoolnight(Day) :- weekday(Day), Day \= friday, Day \= saturday.

schedule(wakeup, start_time(5,0,0), Day) :- weekday(Day).
schedule(exercise_morning, start_time(5,5,0), Day) :- weekday(Day), Day \= saturday.
schedule(brush_teeth_morning, start_time(6,0,0), Day) :- weekday(Day).
schedule(shower, start_time(6,5,0), Day) :- weekday(Day).
schedule(breakfast, start_time(6,20,0), Day) :- weekday(Day).
schedule(travel_to_work, start_time(7,0,0), Day) :- workday(Day).
schedule(laundry, start_time(11,0,0), sunday).
schedule(work_before_lunch, start_time(8,0,0), Day) :- workday(Day).
schedule(lunch, start_time(12,0,0), Day) :- weekday(Day).
schedule(work_after_lunch, start_time(12,45,0), Day) :- workday(Day).
schedule(travel_from_work, start_time(16,15,0), Day) :- workday(Day).
schedule(exercise_afternoon, start_time(17,15,0), Day) :- schoolnight(Day).
schedule(dinner, start_time(18,15,0), Day) :- weekday(Day).
schedule(prepare_for_next_day, start_time(19,15,0), Day) :- schoolnight(Day).
schedule(leisure, start_time(20,15,0), Day) :- schoolnight(Day).
schedule(brush_teeth_evening, start_time(20,30,0), Day) :- weekday(Day).
schedule(prepare_for_bed, start_time(20,35,0), Day) :- weekday(Day).
schedule(slumber, start_time(21,0,0), Day) :- weekday(Day).
