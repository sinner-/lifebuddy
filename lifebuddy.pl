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

schedule(wakeup, Day) :- weekday(Day).
schedule(exercise_morning, Day) :- weekday(Day), Day \= saturday.
schedule(brush_teeth_morning, Day) :- weekday(Day).
schedule(shower, Day) :- weekday(Day).
schedule(breakfast, Day) :- weekday(Day).
schedule(travel_to_work, Day) :- workday(Day).
schedule(work_before_lunch, Day) :- workday(Day).
schedule(lunch, Day) :- weekday(Day).
schedule(work_after_lunch, Day) :- workday(Day).
schedule(travel_from_work, Day) :- workday(Day).
schedule(exercise_afternoon, Day) :- schoolnight(Day).
schedule(dinner, Day) :- weekday(Day).
schedule(prepare_for_next_day, Day) :- schoolnight(Day).
schedule(leisure, Day) :- schoolnight(Day).
schedule(brush_teeth_evening, Day) :- weekday(Day).
schedule(slumber, Day) :- weekday(Day).
