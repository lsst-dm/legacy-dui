
-- LSST Database Metadata
-- $Revision$
-- $Date$
--
-- See <http://dev.lsstcorp.org/trac/wiki/Copyrights>
-- for copyright information.


DROP DATABASE IF EXISTS lsst_schema_browser_ImSim;
CREATE DATABASE lsst_schema_browser_ImSim;
USE lsst_schema_browser_ImSim;


CREATE TABLE md_Table (
	tableId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	engine VARCHAR(255),
	description VARCHAR(255)
);

CREATE TABLE md_Column (
	columnId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	tableId INTEGER NOT NULL REFERENCES md_Table (tableId),
	name VARCHAR(255) NOT NULL,
	description VARCHAR(255),
	type VARCHAR(255),
	notNull INTEGER DEFAULT 0,
	defaultValue VARCHAR(255),
	unit VARCHAR(255),
	ucd VARCHAR(255),
        displayOrder INTEGER NOT NULL,
	INDEX md_Column_idx (tableId, name)
);

CREATE TABLE md_DbDescr (
	schemaFile VARCHAR(255),
	revision VARCHAR(64)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 


INSERT INTO md_DbDescr
SET schemaFile = "lsstImSimSchema4mysql.sql", revision = "1.0.0";

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 1, name = "SimRefGalaxy";

	INSERT INTO md_Column
	SET columnId = 1, tableId = 1, name = "refGalaxyId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 2, tableId = 1, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 3, tableId = 1, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 4, tableId = 1, name = "uMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 5, tableId = 1, name = "gMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 6, tableId = 1, name = "rMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 7, tableId = 1, name = "iMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 8, tableId = 1, name = "zMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 9, tableId = 1, name = "yMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 10, tableId = 1, name = "redshift",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 2, name = "SimRefGalaxy_11032010";

	INSERT INTO md_Column
	SET columnId = 11, tableId = 2, name = "refGalaxyId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 12, tableId = 2, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 13, tableId = 2, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 14, tableId = 2, name = "uMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 15, tableId = 2, name = "gMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 16, tableId = 2, name = "rMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 17, tableId = 2, name = "iMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 18, tableId = 2, name = "zMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 19, tableId = 2, name = "yMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 20, tableId = 2, name = "redshift",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 3, name = "SimRefObject";

	INSERT INTO md_Column
	SET columnId = 21, tableId = 3, name = "refObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 22, tableId = 3, name = "isStar",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 23, tableId = 3, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 24, tableId = 3, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 25, tableId = 3, name = "gLat",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 26, tableId = 3, name = "gLon",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 27, tableId = 3, name = "sedName",
		type = "CHAR(32)",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 28, tableId = 3, name = "uMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 29, tableId = 3, name = "gMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 30, tableId = 3, name = "rMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 31, tableId = 3, name = "iMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 32, tableId = 3, name = "zMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 33, tableId = 3, name = "yMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 34, tableId = 3, name = "muRa",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 35, tableId = 3, name = "muDecl",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 36, tableId = 3, name = "parallax",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 37, tableId = 3, name = "vRad",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 38, tableId = 3, name = "isVar",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 39, tableId = 3, name = "redshift",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 4, name = "SimRefObject_11032010";

	INSERT INTO md_Column
	SET columnId = 40, tableId = 4, name = "refObjectId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 41, tableId = 4, name = "isStar",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 42, tableId = 4, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 43, tableId = 4, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 44, tableId = 4, name = "gLat",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 45, tableId = 4, name = "gLon",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 46, tableId = 4, name = "sedName",
		type = "CHAR(32)",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 47, tableId = 4, name = "uMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 48, tableId = 4, name = "gMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 49, tableId = 4, name = "rMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 50, tableId = 4, name = "iMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 51, tableId = 4, name = "zMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 52, tableId = 4, name = "yMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 53, tableId = 4, name = "muRa",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 54, tableId = 4, name = "muDecl",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 55, tableId = 4, name = "parallax",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 56, tableId = 4, name = "vRad",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 57, tableId = 4, name = "isVar",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 58, tableId = 4, name = "redshift",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 5, name = "SimRefStar";

	INSERT INTO md_Column
	SET columnId = 59, tableId = 5, name = "refStarId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 60, tableId = 5, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 61, tableId = 5, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 62, tableId = 5, name = "gLat",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 63, tableId = 5, name = "gLon",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 64, tableId = 5, name = "sedName",
		type = "CHAR(32)",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 65, tableId = 5, name = "uMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 66, tableId = 5, name = "gMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 67, tableId = 5, name = "rMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 68, tableId = 5, name = "iMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 69, tableId = 5, name = "zMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 70, tableId = 5, name = "yMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 71, tableId = 5, name = "muRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 72, tableId = 5, name = "muDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 73, tableId = 5, name = "parallax",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 74, tableId = 5, name = "vRad",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 75, tableId = 5, name = "isVar",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 17;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- 

INSERT INTO md_Table
SET tableId = 6, name = "SimRefStar_11032010";

	INSERT INTO md_Column
	SET columnId = 76, tableId = 6, name = "refStarId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 77, tableId = 6, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 78, tableId = 6, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 79, tableId = 6, name = "gLat",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 80, tableId = 6, name = "gLon",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 81, tableId = 6, name = "sedName",
		type = "CHAR(32)",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 82, tableId = 6, name = "uMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 83, tableId = 6, name = "gMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 84, tableId = 6, name = "rMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 85, tableId = 6, name = "iMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 86, tableId = 6, name = "zMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 87, tableId = 6, name = "yMag",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 88, tableId = 6, name = "muRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 89, tableId = 6, name = "muDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 90, tableId = 6, name = "parallax",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 91, tableId = 6, name = "vRad",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 92, tableId = 6, name = "isVar",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 17;

