phone: MACRO
	db  \1, \2 ; trainer
	map_id \3 ; map
	db  \4
	dba \5 ; script 1
	db  \6
	dba \7 ; script 2
ENDM

PhoneContacts:
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_MOM,      KRISS_HOUSE_1F,            7, MomPhoneScript,      0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BIKESHOP, OAKS_LAB,                  0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BILL,     N_A,                       7, BillPhoneScript1,    0, BillPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_ELM,      ELMS_LAB,                  7, ElmPhoneScript1,     0, ElmPhoneScript2
	phone TRAINER_NONE, PHONECONTACT_LYRA,     LYRAS_HOUSE_1F,            7, LyraPhoneScript,     0, LyraPhoneScript2
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone SAILOR,       HUEY1,                 N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone COOLTRAINERM, GAVEN1,                ROUTE_26,                  7, GavenPhoneScript1,   7, GavenPhoneScript2
	phone COOLTRAINERF, BETH1,                 ROUTE_26,                  7, BethPhoneScript1,    7, BethPhoneScript2
	phone BIRD_KEEPER,  JOSE1,                 ROUTE_27,                  7, JosePhoneScript1,    7, JosePhoneScript2
	phone COOLTRAINERF, REENA1,                ROUTE_27,                  7, ReenaPhoneScript1,   7, ReenaPhoneScript2
	phone YOUNGSTER,    JOEY1,                 ROUTE_30,                  7, JoeyPhoneScript1,    7, JoeyPhoneScript2
	phone BUG_CATCHER,  WADE1,                 ROUTE_31,                  7, WadePhoneScript1,    7, WadePhoneScript2
	phone FISHER,       RALPH1,                ROUTE_32,                  7, RalphPhoneScript1,   7, RalphPhoneScript2
	phone PICNICKER,    LIZ1,                  ROUTE_32,                  7, LizPhoneScript1,     7, LizPhoneScript2
	phone HIKER,        ANTHONY1,              ROUTE_33,                  7, AnthonyPhoneScript1, 7, AnthonyPhoneScript2
	phone CAMPER,       TODD1,                 ROUTE_34,                  7, ToddPhoneScript1,    7, ToddPhoneScript2
	phone PICNICKER,    GINA1,                 ROUTE_34,                  7, GinaPhoneScript1,    7, GinaPhoneScript2
	phone JUGGLER,      IRWIN1,                ROUTE_35,                  7, IrwinPhoneScript1,   7, IrwinPhoneScript2
	phone BUG_CATCHER,  ARNIE1,                ROUTE_35,                  7, ArniePhoneScript1,   7, ArniePhoneScript2
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone POKEMANIAC,   BRENT1,                ROUTE_43,                  7, BrentPhoneScript1,   7, BrentPhoneScript2
	phone PICNICKER,    TIFFANY1,              ROUTE_43,                  7, TiffanyPhoneScript1, 7, TiffanyPhoneScript2
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONE_00,              N_A,                       0, UnusedPhoneScript,   0, UnusedPhoneScript
	phone TRAINER_NONE, PHONECONTACT_BUENA,    GOLDENROD_DEPT_STORE_ROOF, 7, BuenaPhoneScript1,   7, BuenaPhoneScript2
