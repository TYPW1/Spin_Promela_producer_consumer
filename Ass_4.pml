
mtype = {P, C};

mtype turn = P;

chan ch1 = [1] of {bit};
byte current_consumer = 0;
byte previous_consumer = 1;

active [2] proctype Producer()
{
    bit a = 0;
	do
	:: atomic{turn == P -> ch1 ! a;
	   		      printf("The producer %d --> sent %d!\n", _pid, a);
			      a = 1 - a;
			      turn = C;}
	od
	
}

active [2] proctype Consumer()
{
	bit b;

	do
	:: atomic{turn == C && previous_consumer != _pid -> current_consumer = _pid;
	                       ch1 ? b;
	   		      printf("The consumer %d --> received %d!\n\n", _pid, b);
			      assert(current_consumer == _pid);
			      current_consumer = 0;
			      previous_consumer = _pid;
			      turn = P;}
	od
	
}


ltl not_the_same_consumer { [](previous_consumer != current_consumer) }

