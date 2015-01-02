% BEAM => virtual machine

% Erlang provides what many other languages can’t:
% scalable concurrency and reliability.

% BUILT FOR CONCURRENCY

% Erlang is a product of years of research from Ericsson to develop near
% real-time fault-tolerant distributed applications for telecom applications.

% Concurrency experts do not always agree on the best approaches. One
% common debate is whether threads or processes lead to better concurrency.
% Many threads make up a process. Processes have their own
% resources; threads have their own execution path but share resources
% with other threads in the same process. Usually, a thread is lighter
% weight than a process, though implementations vary.

% NO THREADING

% Many languages, like Java and C, take a threading approach to concurrency.
% Threads take fewer resources, so theoretically, you should
% be able to get better performance from them. The downside to threads
% is that shared resources can lead to complex, buggy implementations
% and the need for locks that form bottlenecks. To coordinate control
% between two applications sharing resources, threading systems require
% semaphores, or operating system level locks. Erlang takes a different
% approach. It tries to make processes as lightweight as possible.

% LIGHTWEIGHT PROCESSES

% Rather than wade through the quagmire of shared resources and resource
% bottlenecks, Erlang embraces the philosophy of lightweight processes.
% Erlang’s creators spent effort to simplify the creation, management,
% and communication within applications with many processes.

% Distributed message passing is a basic language-level construct, eliminating
% the need for locking and improving concurrency.

% Erlang uses actors for concurrency, so message
% passing is a critical concept. You’ll recognize Scala’s message passing
% syntax, which is similar to Erlang’s message passing. In Scala, an actor
% represents an object, backed by a thread pool. In Erlang, an actor represents
% a lightweight process. The actor reads inbound messages from
% a queue and uses pattern matching to decide how to process it.


% RELIABILITY

% Erlang does have traditional error checking, but in a traditional application,
% you’ll see far less error handling than you would in a traditional
% fault-tolerant application. The Erlang mantra is “Let it crash.” Since
% Erlang makes it easy to monitor the death of a process, killing related
% processes and starting new ones are trivial exercises.
% You can also hot-swap code, meaning you can replace pieces of your
% application without stopping your code. This capability allows far simpler
% maintenance strategies than similar distributed applications. Erlang
% combines the robust “Let it crash” error strategies with hot-swapping
% and lightweight processes that you can start with minimal overhead.
% It’s easy to see how some applications run for years at a time
% without downtime.
% So, the Erlang concurrency story is compelling. The important primitives—
% message passing, spawning a process, monitoring a process—are
% all there. The processes that you spawn are lightweight, so you don’t
% have to worry about constrained resources in this area. The language
% is heavily slanted to remove side effects and mutability, and monitoring
% the death of a process is simple, even trivial. The combined package is
% compelling.

% ERLANG => FUNCTIONAL language

% • Your programs are going to be built entirely out of functions, with no objects anywhere.

% • Those functions will usually return the same values, given the same inputs.

% • Those functions will not usually have side effects, meaning they will not modify program state.

% • You will only be able to assign any variable once.

% ----

% NOTES

% You’ll get to the Erlang shell by typing erl

% Erlang is a compiled language.
% You’ll compile a file with c(filename). (you need the period at the end)

% You can break out of the console, or a loop, with Control+C.