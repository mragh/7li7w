-module(doctor).
-export([loop/0]).
% Doc = spawn(fun doctor:loop/0).
% Doc ! new.
% translate_service:translate(translator, "morir").

loop() ->
    process_flag(trap_exit, true),
    receive
        new ->
            io:format("Creating and monitoring process.~n"),
            register(translator, spawn_link(fun translate_service:loop/0)),
            loop();
        crash -> 
            exit({self(),die, at, erlang:time()});

        {'EXIT', From, Reason} ->
            io:format("The translator ~p died with reason ~p.", [From, Reason]), 
                io:format("Restarting.~n"),
            self() ! new,
            loop()
        end.