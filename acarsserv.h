/**
 * \file arsserv.h
 * \brief Defines the functionality for the acarsserv
 */

#ifndef ACARSSERV_H_
#define ACARSSERV_H_


/**
 * \brief Data structure defining the contents of an ACARS message
 */
typedef struct {
	time_t tm;		/*!< The unix timestamp of the ACARS message */
	int chn;		/*!<  */
	char idst[9];	/*!<  */
	int err;		/*!<  */
	int lvl;		/*!<  */
	char mode;		/*!<  */
	char reg[8];	/*!<  */
	char ack;		/*!<  */
	char label[3];	/*!<  */
	char bid;		/*!<  */
	char no[5];		/*!<  */
	char fid[7];	/*!<  */
	char txt[250];	/*!<  */
} acarsmsg_t;


/* (from dbmgr.c) */
extern int initdb(char *dbname);

/* (from dbmgr.c) */
extern int updatedb(acarsmsg_t *msg, int lm, char *ipaddr);

/* (does not appear to actually reference any function, nor does it appear to be called by any function in the program) */
extern int posconv(const char*, const unsigned char*, double*, double*, int*, int*);


#endif	/* !ACARSSERV_H_ */
