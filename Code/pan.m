#define rand	pan_rand
#define pthread_equal(a,b)	((a)==(b))
#if defined(HAS_CODE) && defined(VERBOSE)
	#ifdef BFS_PAR
		bfs_printf("Pr: %d Tr: %d\n", II, t->forw);
	#else
		cpu_printf("Pr: %d Tr: %d\n", II, t->forw);
	#endif
#endif
	switch (t->forw) {
	default: Uerror("bad forward move");
	case 0:	/* if without executable clauses */
		continue;
	case 1: /* generic 'goto' or 'skip' */
		IfNotBlocked
		_m = 3; goto P999;
	case 2: /* generic 'else' */
		IfNotBlocked
		if (trpt->o_pm&1) continue;
		_m = 3; goto P999;

		 /* PROC :init: */
	case 3: // STATE 1 - project.pml:26 - [(run User(toU,toL))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][1] = 1;
		if (!(addproc(II, 1, 0, now.toU, now.toL)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 4: // STATE 2 - project.pml:27 - [(run Login(toL,toU))] (0:0:0 - 0)
		IfNotBlocked
		reached[2][2] = 1;
		if (!(addproc(II, 1, 1, now.toL, now.toU)))
			continue;
		_m = 3; goto P999; /* 0 */
	case 5: // STATE 3 - project.pml:28 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[2][3] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC Login */
	case 6: // STATE 1 - project.pml:19 - [in?req2log,recbit] (0:0:1 - 0)
		reached[1][1] = 1;
		if (q_len(((P1 *)_this)->in) == 0) continue;

		XX=1;
		if (2 != qrecv(((P1 *)_this)->in, 0, 0, 0)) continue;
		(trpt+1)->bup.oval = ((int)((P1 *)_this)->recbit);
		;
		((P1 *)_this)->recbit = qrecv(((P1 *)_this)->in, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("Login:recbit", ((int)((P1 *)_this)->recbit));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P1 *)_this)->in);
			sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)((P1 *)_this)->recbit)); strcat(simvals, simtmp);
		}
#endif
		;
		_m = 4; goto P999; /* 0 */
	case 7: // STATE 2 - project.pml:20 - [out!dis_log_pg,recbit] (0:0:0 - 0)
		IfNotBlocked
		reached[1][2] = 1;
		if (q_full(((P1 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P1 *)_this)->out);
		sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P1 *)_this)->recbit)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P1 *)_this)->out, 0, 1, ((int)((P1 *)_this)->recbit), 2);
		_m = 2; goto P999; /* 0 */
	case 8: // STATE 6 - project.pml:22 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[1][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */

		 /* PROC User */
	case 9: // STATE 1 - project.pml:9 - [out!req2log,sndbit] (0:0:0 - 0)
		IfNotBlocked
		reached[0][1] = 1;
		if (q_full(((P0 *)_this)->out))
			continue;
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[64];
			sprintf(simvals, "%d!", ((P0 *)_this)->out);
		sprintf(simtmp, "%d", 2); strcat(simvals, simtmp);		strcat(simvals, ",");
		sprintf(simtmp, "%d", ((int)((P0 *)_this)->sndbit)); strcat(simvals, simtmp);		}
#endif
		
		qsend(((P0 *)_this)->out, 0, 2, ((int)((P0 *)_this)->sndbit), 2);
		_m = 2; goto P999; /* 0 */
	case 10: // STATE 2 - project.pml:10 - [in?dis_log_pg,recbit] (0:0:2 - 0)
		reached[0][2] = 1;
		if (q_len(((P0 *)_this)->in) == 0) continue;

		XX=1;
		if (1 != qrecv(((P0 *)_this)->in, 0, 0, 0)) continue;
		(trpt+1)->bup.ovals = grab_ints(2);
		(trpt+1)->bup.ovals[0] = ((int)((P0 *)_this)->recbit);
		;
		((P0 *)_this)->recbit = qrecv(((P0 *)_this)->in, XX-1, 1, 1);
#ifdef VAR_RANGES
		logval("User:recbit", ((int)((P0 *)_this)->recbit));
#endif
		;
		
#ifdef HAS_CODE
		if (readtrail && gui) {
			char simtmp[32];
			sprintf(simvals, "%d?", ((P0 *)_this)->in);
			sprintf(simtmp, "%d", 1); strcat(simvals, simtmp);
			strcat(simvals, ",");
			sprintf(simtmp, "%d", ((int)((P0 *)_this)->recbit)); strcat(simvals, simtmp);
		}
#endif
		;
		if (TstOnly) return 1; /* TT */
		/* dead 2: recbit */  (trpt+1)->bup.ovals[1] = ((P0 *)_this)->recbit;
#ifdef HAS_CODE
		if (!readtrail)
#endif
			((P0 *)_this)->recbit = 0;
		_m = 4; goto P999; /* 0 */
	case 11: // STATE 6 - project.pml:13 - [-end-] (0:0:0 - 0)
		IfNotBlocked
		reached[0][6] = 1;
		if (!delproc(1, II)) continue;
		_m = 3; goto P999; /* 0 */
	case  _T5:	/* np_ */
		if (!((!(trpt->o_pm&4) && !(trpt->tau&128))))
			continue;
		/* else fall through */
	case  _T2:	/* true */
		_m = 3; goto P999;
#undef rand
	}

