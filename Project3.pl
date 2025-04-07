
% Flight data 
% Format: flight(FlightNumber, Origin, Destination, DepartureTime, ArrivalTime)

flight(6711, bos, jfk, 0815, 1005).
flight(211, lga, ord, 0700, 0830).
flight(203, lga, lax, 0730, 1335).
flight(92221, ewr, ord, 0800, 0920).
flight(2134, ord, sfo, 0930, 1345).
flight(954, phx, dfw, 1655, 1800).
flight(1176, sfo, lax, 1430, 1545).
flight(205, lax, lga, 1630, 2210).
flight(7791, lga, ord, 0815, 0945).
flight(321, lax, lga, 1645, 2225).


% ------------------------------------------------------------------
% Basic Queries


% Get destination from a given origin
destination(Origin, Destination) :-
    flight(_, Origin, Destination, _, _).

% Get origin from a given destination
origin(Origin, Destination) :-
    flight(_, Origin, Destination, _, _).

% Get arrival time of a flight
arrival_time(Origin, Destination, ArrivalTime) :-
    flight(_, Origin, Destination, _, ArrivalTime).

% Get departure time of a flight
departure_time(Origin, Destination, DepartureTime) :-
    flight(_, Origin, Destination, DepartureTime, _).

% Check if one flight departs after another flight arrives
departs_after_arrives(OriginA, DestA, OriginB, DestB) :-
    flight(_, OriginA, DestA, _, ArrivalA),
    flight(_, OriginB, DestB, DepartureB, _),
    DepartureB > ArrivalA.

% ------------------------------------------------------------------
% Route finding with any number of stopovers
% ------------------------------------------------------------------

% Public route predicate: wraps the visited list
route(Origin, Destination, Route) :-
    route(Origin, Destination, [Origin], Route).

% Base case: direct flight
route(Origin, Destination, _, [flight(FlightNum, Origin, Destination, Dep, Arr)]) :-
    flight(FlightNum, Origin, Destination, Dep, Arr).

% Recursive case: intermediate stops
route(Origin, Destination, Visited, [flight(FlightNum, Origin, Mid, Dep, Arr) | Rest]) :-
    flight(FlightNum, Origin, Mid, Dep, Arr),
    \+ member(Mid, Visited),        
    route(Mid, Destination, [Mid | Visited], Rest),
    Rest = [flight(_, _, _, NextDep, _) | _],
    NextDep > Arr.                 


