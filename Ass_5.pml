
$ spin -a MyFile.pml
ltl fairness_in_consumption: [] ((((consumption_count[0]-consumption_count[1])<=1)) && (((consumption_count[1]-consumption_count[0])<=1)))
$ gcc -DSAFETY -o pan pan.c
$ ./pan -m100000 -X
warning: never claim + accept labels requires -a flag to fully verify
pan:1: assertion violated  !( !((((consumption_count[0]-consumption_count[1])<=1)&&((consumption_count[1]-consumption_count[0])<=1)))) (at depth 12)
pan: wrote pmlfileb10MWH.trail

(Spin Version 6.4.5 -- 1 January 2016)
Warning: Search not completed
	+ Partial Order Reduction

Full statespace search for:
	never claim         	+ (fairness_in_consumption)
	assertion violations	+ (if within scope of claim)
	cycle checks       	- (disabled by -DSAFETY)
	invalid end states	- (disabled by never claim)

State-vector 68 byte, depth reached 12, errors: 1
        5 states, stored
        0 states, matched
        5 transitions (= stored+matched)
        4 atomic steps
hash conflicts:         0 (resolved)

Stats on memory usage (in Megabytes):
    0.000	equivalent memory usage for states (stored*(State-vector + overhead))
    0.289	actual memory usage for states
  128.000	memory used for hash table (-w24)
    5.341	memory used for DFS stack (-m100000)
  133.536	total actual memory usage



pan: elapsed time 0.01 seconds
$ spin -g -l -p -r -s  -t MyFile.pml
ltl fairness_in_consumption: [] ((((consumption_count[0]-consumption_count[1])<=1)) && (((consumption_count[1]-consumption_count[0])<=1)))
spin: warning, "MyFile.pml" is newer than MyFile.pml.trail
starting claim 2
using statement merging
Never claim moves to line 4	[(1)]
  2:	proc  1 (Producer:1) MyFile.pml:11 (state 1)	[((turn==P))]
  3:	proc  1 (Producer:1) MyFile.pml:11 Send 0	-> queue 1 (ch1)
  3:	proc  1 (Producer:1) MyFile.pml:11 (state 2)	[ch1!a]
		queue 1 (ch1): [0]
              The producer 1 -->sent 0!
  3:	proc  1 (Producer:1) MyFile.pml:12 (state 3)	[printf('The producer %d -->sent %d!\\n',_pid,a)]
		queue 1 (ch1): [0]
  3:	proc  1 (Producer:1) MyFile.pml:13 (state 4)	[a = (1-a)]
		queue 1 (ch1): [0]
		Producer(1):a = 1
  3:	proc  1 (Producer:1) MyFile.pml:14 (state 5)	[turn = C]
		turn = C
		queue 1 (ch1): [0]
		Producer(1):a = 1
  5:	proc  3 (Consumer:1) MyFile.pml:25 (state 1)	[((turn==C))]
		queue 1 (ch1): [0]
  5:	proc  3 (Consumer:1) MyFile.pml:25 (state 2)	[current_consumer = _pid]
		queue 1 (ch1): [0]
		current_consumer = 3
  5:	proc  3 (Consumer:1) MyFile.pml:26 (state 3)	[index = (_pid%2)]
		queue 1 (ch1): [0]
		current_consumer = 3
		Consumer(3):index = 1
  6:	proc  3 (Consumer:1) MyFile.pml:27 Recv 0	<- queue 1 (ch1)
  6:	proc  3 (Consumer:1) MyFile.pml:27 (state 4)	[ch1?b]
		queue 1 (ch1): 
		Consumer(3):b = 0
  6:	proc  3 (Consumer:1) MyFile.pml:28 (state 5)	[consumption_count[index] = (consumption_count[index]+1)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
                      The consumer 3 -->received 0!

  6:	proc  3 (Consumer:1) MyFile.pml:29 (state 6)	[printf('The consumer %d -->received %d!\\n\\n',_pid,b)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
  6:	proc  3 (Consumer:1) MyFile.pml:30 (state 7)	[assert((current_consumer==_pid))]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
  6:	proc  3 (Consumer:1) MyFile.pml:31 (state 8)	[turn = P]
		turn = P
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
  8:	proc  1 (Producer:1) MyFile.pml:11 (state 1)	[((turn==P))]
		queue 1 (ch1): 
  9:	proc  1 (Producer:1) MyFile.pml:11 Send 1	-> queue 1 (ch1)
  9:	proc  1 (Producer:1) MyFile.pml:11 (state 2)	[ch1!a]
		queue 1 (ch1): [1]
              The producer 1 -->sent 1!
  9:	proc  1 (Producer:1) MyFile.pml:12 (state 3)	[printf('The producer %d -->sent %d!\\n',_pid,a)]
		queue 1 (ch1): [1]
  9:	proc  1 (Producer:1) MyFile.pml:13 (state 4)	[a = (1-a)]
		queue 1 (ch1): [1]
		Producer(1):a = 0
  9:	proc  1 (Producer:1) MyFile.pml:14 (state 5)	[turn = C]
		turn = C
		queue 1 (ch1): [1]
		Producer(1):a = 0
 11:	proc  3 (Consumer:1) MyFile.pml:25 (state 1)	[((turn==C))]
		queue 1 (ch1): [1]
 11:	proc  3 (Consumer:1) MyFile.pml:25 (state 2)	[current_consumer = _pid]
		queue 1 (ch1): [1]
 11:	proc  3 (Consumer:1) MyFile.pml:26 (state 3)	[index = (_pid%2)]
		queue 1 (ch1): [1]
		Consumer(3):index = 1
 12:	proc  3 (Consumer:1) MyFile.pml:27 Recv 1	<- queue 1 (ch1)
 12:	proc  3 (Consumer:1) MyFile.pml:27 (state 4)	[ch1?b]
		queue 1 (ch1): 
		Consumer(3):b = 1
 12:	proc  3 (Consumer:1) MyFile.pml:28 (state 5)	[consumption_count[index] = (consumption_count[index]+1)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
                      The consumer 3 -->received 1!

 12:	proc  3 (Consumer:1) MyFile.pml:29 (state 6)	[printf('The consumer %d -->received %d!\\n\\n',_pid,b)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
 12:	proc  3 (Consumer:1) MyFile.pml:30 (state 7)	[assert((current_consumer==_pid))]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
 12:	proc  3 (Consumer:1) MyFile.pml:31 (state 8)	[turn = P]
		turn = P
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
spin: _spin_nvr.tmp:3, Error: assertion violated
spin: text of failed assertion: assert(!(!((((consumption_count[0]-consumption_count[1])<=1)&&((consumption_count[1]-consumption_count[0])<=1)))))
Never claim moves to line 3	[assert(!(!((((consumption_count[0]-consumption_count[1])<=1)&&((consumption_count[1]-consumption_count[0])<=1)))))]
spin: trail ends after 13 steps
#processes: 4
		turn = P
		queue 1 (ch1): 
		current_consumer = 3
		consumption_count[0] = 0
		consumption_count[1] = 2
 13:	proc  3 (Consumer:1) MyFile.pml:23 (state 10)
 13:	proc  2 (Consumer:1) MyFile.pml:23 (state 10)
 13:	proc  1 (Producer:1) MyFile.pml:9 (state 7)
 13:	proc  0 (Producer:1) MyFile.pml:9 (state 7)
 13:	proc  - (fairness_in_consumption:1) _spin_nvr.tmp:2 (state 6)
4 processes created

$ spin -a MyFile.pml
ltl fairness_in_consumption: [] ((((consumption_count[0]-consumption_count[1])<=1)) && (((consumption_count[1]-consumption_count[0])<=1)))
$ gcc -DSAFETY -o pan pan.c
$ ./pan -m100000 -X
warning: never claim + accept labels requires -a flag to fully verify
pan:1: assertion violated  !( !((((consumption_count[0]-consumption_count[1])<=1)&&((consumption_count[1]-consumption_count[0])<=1)))) (at depth 12)
pan: wrote pmlfileb10MWH.trail

(Spin Version 6.4.5 -- 1 January 2016)
Warning: Search not completed
	+ Partial Order Reduction

Full statespace search for:
	never claim         	+ (fairness_in_consumption)
	assertion violations	+ (if within scope of claim)
	cycle checks       	- (disabled by -DSAFETY)
	invalid end states	- (disabled by never claim)

State-vector 68 byte, depth reached 12, errors: 1
        5 states, stored
        0 states, matched
        5 transitions (= stored+matched)
        4 atomic steps
hash conflicts:         0 (resolved)

Stats on memory usage (in Megabytes):
    0.000	equivalent memory usage for states (stored*(State-vector + overhead))
    0.289	actual memory usage for states
  128.000	memory used for hash table (-w24)
    5.341	memory used for DFS stack (-m100000)
  133.536	total actual memory usage



pan: elapsed time 0.01 seconds
$ spin -g -l -p -r -s  -t MyFile.pml
ltl fairness_in_consumption: [] ((((consumption_count[0]-consumption_count[1])<=1)) && (((consumption_count[1]-consumption_count[0])<=1)))
spin: warning, "MyFile.pml" is newer than MyFile.pml.trail
starting claim 2
using statement merging
Never claim moves to line 4	[(1)]
  2:	proc  1 (Producer:1) MyFile.pml:11 (state 1)	[((turn==P))]
  3:	proc  1 (Producer:1) MyFile.pml:11 Send 0	-> queue 1 (ch1)
  3:	proc  1 (Producer:1) MyFile.pml:11 (state 2)	[ch1!a]
		queue 1 (ch1): [0]
              The producer 1 -->sent 0!
  3:	proc  1 (Producer:1) MyFile.pml:12 (state 3)	[printf('The producer %d -->sent %d!\\n',_pid,a)]
		queue 1 (ch1): [0]
  3:	proc  1 (Producer:1) MyFile.pml:13 (state 4)	[a = (1-a)]
		queue 1 (ch1): [0]
		Producer(1):a = 1
  3:	proc  1 (Producer:1) MyFile.pml:14 (state 5)	[turn = C]
		turn = C
		queue 1 (ch1): [0]
		Producer(1):a = 1
  5:	proc  3 (Consumer:1) MyFile.pml:25 (state 1)	[((turn==C))]
		queue 1 (ch1): [0]
  5:	proc  3 (Consumer:1) MyFile.pml:25 (state 2)	[current_consumer = _pid]
		queue 1 (ch1): [0]
		current_consumer = 3
  5:	proc  3 (Consumer:1) MyFile.pml:26 (state 3)	[index = (_pid%2)]
		queue 1 (ch1): [0]
		current_consumer = 3
		Consumer(3):index = 1
  6:	proc  3 (Consumer:1) MyFile.pml:27 Recv 0	<- queue 1 (ch1)
  6:	proc  3 (Consumer:1) MyFile.pml:27 (state 4)	[ch1?b]
		queue 1 (ch1): 
		Consumer(3):b = 0
  6:	proc  3 (Consumer:1) MyFile.pml:28 (state 5)	[consumption_count[index] = (consumption_count[index]+1)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
                      The consumer 3 -->received 0!

  6:	proc  3 (Consumer:1) MyFile.pml:29 (state 6)	[printf('The consumer %d -->received %d!\\n\\n',_pid,b)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
  6:	proc  3 (Consumer:1) MyFile.pml:30 (state 7)	[assert((current_consumer==_pid))]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
  6:	proc  3 (Consumer:1) MyFile.pml:31 (state 8)	[turn = P]
		turn = P
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 1
		Consumer(3):b = 0
  8:	proc  1 (Producer:1) MyFile.pml:11 (state 1)	[((turn==P))]
		queue 1 (ch1): 
  9:	proc  1 (Producer:1) MyFile.pml:11 Send 1	-> queue 1 (ch1)
  9:	proc  1 (Producer:1) MyFile.pml:11 (state 2)	[ch1!a]
		queue 1 (ch1): [1]
              The producer 1 -->sent 1!
  9:	proc  1 (Producer:1) MyFile.pml:12 (state 3)	[printf('The producer %d -->sent %d!\\n',_pid,a)]
		queue 1 (ch1): [1]
  9:	proc  1 (Producer:1) MyFile.pml:13 (state 4)	[a = (1-a)]
		queue 1 (ch1): [1]
		Producer(1):a = 0
  9:	proc  1 (Producer:1) MyFile.pml:14 (state 5)	[turn = C]
		turn = C
		queue 1 (ch1): [1]
		Producer(1):a = 0
 11:	proc  3 (Consumer:1) MyFile.pml:25 (state 1)	[((turn==C))]
		queue 1 (ch1): [1]
 11:	proc  3 (Consumer:1) MyFile.pml:25 (state 2)	[current_consumer = _pid]
		queue 1 (ch1): [1]
 11:	proc  3 (Consumer:1) MyFile.pml:26 (state 3)	[index = (_pid%2)]
		queue 1 (ch1): [1]
		Consumer(3):index = 1
 12:	proc  3 (Consumer:1) MyFile.pml:27 Recv 1	<- queue 1 (ch1)
 12:	proc  3 (Consumer:1) MyFile.pml:27 (state 4)	[ch1?b]
		queue 1 (ch1): 
		Consumer(3):b = 1
 12:	proc  3 (Consumer:1) MyFile.pml:28 (state 5)	[consumption_count[index] = (consumption_count[index]+1)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
                      The consumer 3 -->received 1!

 12:	proc  3 (Consumer:1) MyFile.pml:29 (state 6)	[printf('The consumer %d -->received %d!\\n\\n',_pid,b)]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
 12:	proc  3 (Consumer:1) MyFile.pml:30 (state 7)	[assert((current_consumer==_pid))]
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
 12:	proc  3 (Consumer:1) MyFile.pml:31 (state 8)	[turn = P]
		turn = P
		queue 1 (ch1): 
		consumption_count[0] = 0
		consumption_count[1] = 2
		Consumer(3):b = 1
spin: _spin_nvr.tmp:3, Error: assertion violated
spin: text of failed assertion: assert(!(!((((consumption_count[0]-consumption_count[1])<=1)&&((consumption_count[1]-consumption_count[0])<=1)))))
Never claim moves to line 3	[assert(!(!((((consumption_count[0]-consumption_count[1])<=1)&&((consumption_count[1]-consumption_count[0])<=1)))))]
spin: trail ends after 13 steps
#processes: 4
		turn = P
		queue 1 (ch1): 
		current_consumer = 3
		consumption_count[0] = 0
		consumption_count[1] = 2
 13:	proc  3 (Consumer:1) MyFile.pml:23 (state 10)
 13:	proc  2 (Consumer:1) MyFile.pml:23 (state 10)
 13:	proc  1 (Producer:1) MyFile.pml:9 (state 7)
 13:	proc  0 (Producer:1) MyFile.pml:9 (state 7)
 13:	proc  - (fairness_in_consumption:1) _spin_nvr.tmp:2 (state 6)
4 processes created
mtype ={P, C};
mtype turn = P;
chan ch1 = [1] of {bit};
byte current_consumer;
int consumption_count[2];  // Array to count consumptions for each consumer

active [2] proctype Producer() {
    bit a = 0;
    do
    :: atomic {
        turn == P -> ch1 !a;
        printf("The producer %d -->sent %d!\n", _pid, a);
        a = 1 - a;
        turn = C;
    }
    od
}

active [2] proctype Consumer() {
    bit b;
    byte index;  // Local variable to store the mapped index

    do
    :: atomic {
        turn == C -> current_consumer = _pid;
        index = (_pid % 2);
        ch1 ?b;
        consumption_count[index]++; 
        printf("The consumer %d -->received %d!\n\n", _pid, b);
        assert(current_consumer == _pid);
        turn = P;
    }
    od
}


ltl fairness_in_consumption { 
    [] (consumption_count[0] - consumption_count[1] <= 1 && 
        consumption_count[1] - consumption_count[0] <= 1) 
}
