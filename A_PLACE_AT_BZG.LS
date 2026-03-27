/PROG  A_PLACE_AT_BZG
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 2869;
CREATE		= DATE 25-11-18  TIME 19:42:52;
MODIFIED	= DATE 25-11-24  TIME 01:30:48;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 100;
MEMORY_SIZE	= 3357;
PROTECT		= READ_WRITE;
TCD:  STACK_SIZE	= 0,
      TASK_PRIORITY	= 50,
      TIME_SLICE	= 0,
      BUSY_LAMP_OFF	= 0,
      ABORT_REQUEST	= 0,
      PAUSE_REQUEST	= 0;
DEFAULT_GROUP	= 1,*,*,*,*;
CONTROL_CODE	= 00000000 00000000;
/APPL
/APPL

AUTO_SINGULARITY_HEADER;
  ENABLE_SINGULARITY_AVOIDANCE   : TRUE;
  CYCLE_REFERENCE = 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0;
  CYCLE_TARGET =   0.00 ;
/MN
   1:  UFRAME_NUM=0 ;
   2:  UTOOL_NUM=1 ;
   3:   ;
   4:  R[173:offset]=0    ;
   5:  R[174:color offset]=0    ;
   6:   ;
   7:  !tells tower pos and hieght ;
   8:  R[172:bzg_mod1]=R[68:LOOP_COUNT] MOD 3    ;
   9:  R[171:bzg_div]=R[68:LOOP_COUNT] DIV 3    ;
  10:   ;
  11:  !detects current tower ;
  12:  SELECT R[172:bzg_mod1]=0,JMP LBL[1] ;
  13:         =1,JMP LBL[2] ;
  14:         =2,JMP LBL[3] ;
  15:   ;
  16:  !left grab ;
  17:  LBL[1] ;
  18:  PR[167:TOWER_POS]=P[1:left pre]    ;
  19:  PR[168:PLACE_POS]=P[2:left grab]    ;
  20:  JMP LBL[4] ;
  21:   ;
  22:  !center grab ;
  23:  LBL[2] ;
  24:  PR[167:TOWER_POS]=P[3:center pre]    ;
  25:  PR[168:PLACE_POS]=P[4:center grab]    ;
  26:  JMP LBL[4] ;
  27:   ;
  28:  !right grab ;
  29:  LBL[3] ;
  30:  PR[167:TOWER_POS]=P[5:right pre]    ;
  31:  PR[168:PLACE_POS]=P[6:right grab]    ;
  32:  JMP LBL[4] ;
  33:   ;
  34:  !pickup ;
  35:  LBL[4] ;
  36:  R[173:offset]=40*R[171:bzg_div]    ;
  37:  PR[168,3:PLACE_POS]=PR[168,3:PLACE_POS]-R[173:offset]    ;
  38:L PR[167:TOWER_POS] 500mm/sec FINE    ;
  39:L PR[168:PLACE_POS] 500mm/sec FINE    ;
  40:  RO[1:Close Gripper]=ON ;
  41:  WAIT   1.00(sec) ;
  42:L PR[167:TOWER_POS] 500mm/sec FINE    ;
  43:   ;
  44:  !detects where to place ;
  45:  SELECT R[67:BLOCK_BZG]=1,JMP LBL[5] ;
  46:         =2,JMP LBL[6] ;
  47:         =3,JMP LBL[7] ;
  48:   ;
  49:  !yellow place ;
  50:  LBL[5] ;
  51:  PR[167:TOWER_POS]=P[7:yellow pre]    ;
  52:  PR[168:PLACE_POS]=P[8:yellow place]    ;
  53:  R[174:color offset]=R[175:yellow]    ;
  54:  R[175:yellow]=R[175:yellow]+1    ;
  55:  JMP LBL[8] ;
  56:   ;
  57:  !red place ;
  58:  LBL[6] ;
  59:  PR[167:TOWER_POS]=P[9:red pre]    ;
  60:  PR[168:PLACE_POS]=P[14:sing temp]    ;
  61:  R[174:color offset]=R[176:red]    ;
  62:  R[176:red]=R[176:red]+1    ;
  63:  JMP LBL[8] ;
  64:   ;
  65:  !green place ;
  66:  LBL[7] ;
  67:  PR[167:TOWER_POS]=P[11:green pre]    ;
  68:  PR[168:PLACE_POS]=P[12:green place]    ;
  69:  R[174:color offset]=R[177:green]    ;
  70:  R[177:green]=R[177:green]+1    ;
  71:  JMP LBL[8] ;
  72:   ;
  73:  !placing ;
  74:  LBL[8] ;
  75:L P[13:home] 500mm/sec FINE    ;
  76:  R[173:offset]=45*R[174:color offset]    ;
  77:  PR[168,3:PLACE_POS]=PR[168,3:PLACE_POS]+R[173:offset]    ;
  78:L PR[167:TOWER_POS] 500mm/sec FINE    ;
  79:L PR[168:PLACE_POS] 500mm/sec FINE    ;
  80:  RO[1:Close Gripper]=OFF ;
  81:  WAIT   1.00(sec) ;
  82:L PR[167:TOWER_POS] 500mm/sec FINE    ;
  83:L P[13:home] 500mm/sec FINE    ;
  84:   ;
  85:  JMP LBL[9] ;
  86:  //L P[1:left pre] 500mm/sec FINE    ;
  87:  //L P[2:left grab] 500mm/sec FINE    ;
  88:  //L P[3:center pre] 500mm/sec FINE    ;
  89:  //L P[4:center grab] 500mm/sec FINE    ;
  90:  //L P[5:right pre] 500mm/sec FINE    ;
  91:  //L P[6:right grab] 500mm/sec FINE    ;
  92:  //L P[7:yellow pre] 500mm/sec FINE    ;
  93:  //L P[8:yellow place] 500mm/sec FINE    ;
  94:  //L P[9:red pre] 500mm/sec FINE    ;
  95:  //L P[10:red place] 500mm/sec FINE    ;
  96:  //L P[11:green pre] 500mm/sec FINE    ;
  97:  //L P[12:green place] 500mm/sec FINE    ;
  98:  //L P[14:sing temp] 500mm/sec FINE    ;
  99:   ;
 100:  LBL[9] ;
/POS
P[1:"left pre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   665.672  mm,	Y =  -162.424  mm,	Z =   -30.709  mm,
	W =  -177.506 deg,	P =   -44.984 deg,	R =    -3.215 deg
};
P[2:"left grab"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   673.275  mm,	Y =  -159.027  mm,	Z =  -151.649  mm,
	W =  -177.106 deg,	P =   -33.046 deg,	R =    -2.637 deg
};
P[3:"center pre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   665.638  mm,	Y =    16.518  mm,	Z =   -30.787  mm,
	W =  -177.501 deg,	P =   -44.974 deg,	R =    -3.220 deg
};
P[4:"center grab"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   673.263  mm,	Y =    19.263  mm,	Z =  -151.678  mm,
	W =  -177.106 deg,	P =   -33.043 deg,	R =    -2.637 deg
};
P[5:"right pre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   665.637  mm,	Y =   201.663  mm,	Z =   -30.800  mm,
	W =  -177.503 deg,	P =   -44.974 deg,	R =    -3.218 deg
};
P[6:"right grab"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   673.251  mm,	Y =   198.977  mm,	Z =  -151.698  mm,
	W =  -177.107 deg,	P =   -33.041 deg,	R =    -2.637 deg
};
P[7:"yellow pre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   533.763  mm,	Y =  -168.209  mm,	Z =     7.199  mm,
	W =  -175.520 deg,	P =   -33.851 deg,	R =    -5.659 deg
};
P[8:"yellow place"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   533.750  mm,	Y =  -168.204  mm,	Z =  -186.960  mm,
	W =  -175.523 deg,	P =   -33.849 deg,	R =    -5.653 deg
};
P[9:"red pre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   540.043  mm,	Y =    12.605  mm,	Z =   -27.202  mm,
	W =  -179.105 deg,	P =   -28.038 deg,	R =    -2.247 deg
};
P[10:"red place"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   540.046  mm,	Y =    12.627  mm,	Z =  -198.613  mm,
	W =  -178.309 deg,	P =   -27.904 deg,	R =    -2.421 deg
};
P[11:"green pre"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   541.594  mm,	Y =   202.260  mm,	Z =   -18.179  mm,
	W =   179.124 deg,	P =   -29.863 deg,	R =    -2.210 deg
};
P[12:"green place"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   541.569  mm,	Y =   193.248  mm,	Z =  -198.214  mm,
	W =   179.129 deg,	P =   -29.859 deg,	R =    -2.223 deg
};
P[13:"home"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   517.108  mm,	Y =    13.041  mm,	Z =   127.259  mm,
	W =  -176.588 deg,	P =   -26.388 deg,	R =    -4.625 deg
};
P[14:"sing temp"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'F U T, 0, 0, 0',
	X =   456.103  mm,	Y =    13.059  mm,	Z =  -195.046  mm,
	W =  -178.101 deg,	P =   -29.740 deg,	R =    -2.491 deg
};
/END
