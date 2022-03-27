	switch (t->back) {
	default: Uerror("bad return move");
	case  0: goto R999; /* nothing to undo */

		 /* PROC :init: */

	case 3: // STATE 1
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 4: // STATE 2
		;
		;
		delproc(0, now._nr_pr-1);
		;
		goto R999;

	case 5: // STATE 3
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC Login */

	case 6: // STATE 1
		;
		XX = 1;
		unrecv(((P1 *)_this)->in, XX-1, 0, 2, 1);
		unrecv(((P1 *)_this)->in, XX-1, 1, ((int)((P1 *)_this)->recbit), 0);
		((P1 *)_this)->recbit = trpt->bup.oval;
		;
		;
		goto R999;

	case 7: // STATE 2
		;
		_m = unsend(((P1 *)_this)->out);
		;
		goto R999;

	case 8: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;

		 /* PROC User */

	case 9: // STATE 1
		;
		_m = unsend(((P0 *)_this)->out);
		;
		goto R999;

	case 10: // STATE 2
		;
	/* 0 */	((P0 *)_this)->recbit = trpt->bup.ovals[1];
		XX = 1;
		unrecv(((P0 *)_this)->in, XX-1, 0, 1, 1);
		unrecv(((P0 *)_this)->in, XX-1, 1, ((int)((P0 *)_this)->recbit), 0);
		((P0 *)_this)->recbit = trpt->bup.ovals[0];
		;
		;
		ungrab_ints(trpt->bup.ovals, 2);
		goto R999;

	case 11: // STATE 6
		;
		p_restor(II);
		;
		;
		goto R999;
	}

