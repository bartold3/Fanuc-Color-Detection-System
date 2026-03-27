/PROG  A_FINAL_PROJECT_BZG
/ATTR
OWNER		= MNEDITOR;
COMMENT		= "";
PROG_SIZE	= 1993;
CREATE		= DATE 25-11-17  TIME 00:08:04;
MODIFIED	= DATE 25-11-24  TIME 01:27:02;
FILE_NAME	= ;
VERSION		= 0;
LINE_COUNT	= 70;
MEMORY_SIZE	= 2497;
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
   4:   ;
   5:  !View vertical offset ;
   6:  PR[67,1:View pos offset]=0    ;
   7:  PR[67,2:View pos offset]=0    ;
   8:  PR[67,3:View pos offset]=0    ;
   9:  PR[67,4:View pos offset]=0    ;
  10:  PR[67,5:View pos offset]=0    ;
  11:  PR[67,6:View pos offset]=0    ;
  12:   ;
  13:  !Pos reg for grab ;
  14:  PR[167,1:TOWER_POS]=0    ;
  15:  PR[167,2:TOWER_POS]=0    ;
  16:  PR[167,3:TOWER_POS]=0    ;
  17:  PR[167,4:TOWER_POS]=0    ;
  18:  PR[167,5:TOWER_POS]=0    ;
  19:  PR[167,6:TOWER_POS]=0    ;
  20:   ;
  21:  !Pos reg for placement ;
  22:  PR[168,1:PLACE_POS]=0    ;
  23:  PR[168,2:PLACE_POS]=0    ;
  24:  PR[168,3:PLACE_POS]=0    ;
  25:  PR[168,4:PLACE_POS]=0    ;
  26:  PR[168,5:PLACE_POS]=0    ;
  27:  PR[168,6:PLACE_POS]=0    ;
  28:   ;
  29:  !counters for tower hieghts ;
  30:  R[175:yellow]=0    ;
  31:  R[176:red]=0    ;
  32:  R[177:green]=0    ;
  33:   ;
  34:   ;
  35:  R[68:LOOP_COUNT]=0    ;
  36:J P[1:home_pos] 100% FINE    ;
  37:   ;
  38:  !Main loop ;
  39:  LBL[1] ;
  40:  IF R[68:LOOP_COUNT]>8,JMP LBL[2] ;
  41:   ;
  42:  IF R[68:LOOP_COUNT]=3 OR R[68:LOOP_COUNT]=6,CALL A_POS_CHANGE_BZG ;
  43:   ;
  44:  !The left top tower pos ;
  45:L P[4:left_tower] 500mm/sec FINE Offset,PR[67:View pos offset]    ;
  46:  CALL A_SCAN_BZG    ;
  47:  !place goes here ;
  48:  CALL A_PLACE_AT_BZG    ;
  49:  R[68:LOOP_COUNT]=R[68:LOOP_COUNT]+1    ;
  50:   ;
  51:   ;
  52:  !The center top view pos ;
  53:L P[9:center_tower] 500mm/sec FINE Offset,PR[67:View pos offset]    ;
  54:  CALL A_SCAN_BZG    ;
  55:  !place goes here ;
  56:  CALL A_PLACE_AT_BZG    ;
  57:  R[68:LOOP_COUNT]=R[68:LOOP_COUNT]+1    ;
  58:   ;
  59:  !The right top tower pos ;
  60:L P[3:right_tower] 500mm/sec FINE Offset,PR[67:View pos offset]    ;
  61:  CALL A_SCAN_BZG    ;
  62:  !place goes here ;
  63:  CALL A_PLACE_AT_BZG    ;
  64:  R[68:LOOP_COUNT]=R[68:LOOP_COUNT]+1    ;
  65:   ;
  66:  JMP LBL[1] ;
  67:   ;
  68:  LBL[2] ;
  69:   ;
  70:L P[1:home_pos] 500mm/sec FINE    ;
/POS
P[1:"home_pos"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   517.109  mm,	Y =    13.041  mm,	Z =   127.261  mm,
	W =  -176.587 deg,	P =   -26.388 deg,	R =    -4.628 deg
};
P[3:"right_tower"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   538.376  mm,	Y =   271.305  mm,	Z =    13.222  mm,
	W =  -179.707 deg,	P =      .942 deg,	R =    -2.605 deg
};
P[4:"left_tower"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   538.368  mm,	Y =   -83.553  mm,	Z =    13.161  mm,
	W =  -179.705 deg,	P =      .951 deg,	R =    -2.597 deg
};
P[9:"center_tower"]{
   GP1:
	UF : 0, UT : 1,		CONFIG : 'N U T, 0, 0, 0',
	X =   538.383  mm,	Y =    90.905  mm,	Z =    13.294  mm,
	W =  -179.702 deg,	P =      .934 deg,	R =    -2.597 deg
};
/END
