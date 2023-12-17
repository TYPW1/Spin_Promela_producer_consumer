
mtype = {P, C};

mtype turn = P;

chan ch1 = [1] of {bit};
byte current_consumer;
bool produced = false;
bool consumed = false;

active [2] proctype Producer()
{
    bit a = 0;
    do
	:: atomic{turn == P -> ch1 ! a;
			      produced = true;
	   		      printf("The producer %d --> sent %d!\n", _pid, a);
			      a = 1 - a;			      
	              turn = C;}
	od
	
}

active [2] proctype Consumer()
{
	bit b;

	do
	:: atomic{turn == C -> current_consumer = _pid;
	              ch1 ? b;
			      consumed = true;
	   		      printf("The consumer %d --> received %d!\n\n", _pid, b);
			      assert(current_consumer == _pid);
			      turn = P;}
	od
	
}


ltl produced_eventually_consumed {[] (produced -> <> consumed)}
