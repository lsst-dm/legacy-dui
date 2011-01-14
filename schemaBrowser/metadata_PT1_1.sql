
-- LSST Database Metadata
-- $Revision$
-- $Date$
--
-- See <http://dev.lsstcorp.org/trac/wiki/Copyrights>
-- for copyright information.


DROP DATABASE IF EXISTS lsst_schema_browser_PT1_1;
CREATE DATABASE lsst_schema_browser_PT1_1;
USE lsst_schema_browser_PT1_1;


CREATE TABLE AAA_Version_DC3b_3_2_3 (version CHAR);


CREATE TABLE md_Table (
	tableId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	name VARCHAR(255) NOT NULL UNIQUE,
	engine VARCHAR(255),
	description TEXT
);

CREATE TABLE md_Column (
	columnId INTEGER NOT NULL UNIQUE PRIMARY KEY,
	tableId INTEGER NOT NULL REFERENCES md_Table (tableId),
	name VARCHAR(255) NOT NULL,
	description TEXT,
	type VARCHAR(255),
	notNull INTEGER DEFAULT 0,
	defaultValue VARCHAR(255),
	unit VARCHAR(255),
	ucd VARCHAR(255),
        displayOrder INTEGER NOT NULL,
	INDEX md_Column_idx (tableId, name)
);

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 1, name = "AmpMap",
	description = "Mapping table to translate amp names to numbers.";

	INSERT INTO md_Column
	SET columnId = 1, tableId = 1, name = "ampNum",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 2, tableId = 1, name = "ampName",
		type = "CHAR(3)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 3, name = "CcdMap",
	description = "Mapping table to translate ccd names to numbers.";

	INSERT INTO md_Column
	SET columnId = 30, tableId = 3, name = "ccdNum",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 31, tableId = 3, name = "ccdName",
		type = "CHAR(3)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 7, name = "Filter",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 105, tableId = 7, name = "filterId",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 106, tableId = 7, name = "filterName",
		description = "Filter name. Valid values: 'u', 'g', 'r', 'i', 'z', 'y'.",
		type = "CHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 107, tableId = 7, name = "photClam",
		description = "Filter centroid wavelength.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 108, tableId = 7, name = "photBW",
		description = "System effective bandwidth.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 10, name = "LeapSeconds",
	description = "Based on <a href='http://maia.usno.navy.mil/ser7/tai-utc.dat'>http://maia.usno.navy.mil/ser7/tai-utc.dat</a>.",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 120, tableId = 10, name = "whenJd",
		description = "JD of change in TAI-UTC difference (leap second).",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 121, tableId = 10, name = "offset",
		description = "New number of leap seconds.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 122, tableId = 10, name = "mjdRef",
		description = "Reference MJD for drift (prior to 1972-Jan-1).",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 123, tableId = 10, name = "drift",
		description = "Drift in seconds per day (prior to 1972-Jan-1).",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 124, tableId = 10, name = "whenMjdUtc",
		description = "MJD in UTC system of change (computed).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 125, tableId = 10, name = "whenUtc",
		description = "Nanoseconds from epoch in UTC system of change (computed).",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 126, tableId = 10, name = "whenTai",
		description = "Nanoseconds from epoch in TAI system of change (computed).",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 7;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 13, name = "Object",
	engine = "MyISAM",
	description = "The Object table contains descriptions of the multi-epoch static astronomical objects, in particular their astrophysical properties as derived from analysis of the Sources that are associated with them. Note that fast moving objects are kept in the MovingObject tables. Note that less-frequently used columns are stored in a separate table called ObjectExtras.";

	INSERT INTO md_Column
	SET columnId = 234, tableId = 13, name = "objectId",
		description = "Unique object id.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 235, tableId = 13, name = "iauId",
		description = "Not set for PT1.1. IAU compliant name for the object. Example: &quot;LSST-DR11 J001234.65-123456.18 GAL&quot;. The last 3 characters identify classification. Note that it will not accommodate multiple classifications.",
		type = "CHAR(34)",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 236, tableId = 13, name = "ra_PS",
		description = "RA of mean source cluster position. Computed from the normalized sum of the unit vector positions of all sources belonging to an object; for sources that are close together this is equivalent to minimizing the sum of the square angular separations between the source positions and the object position.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 237, tableId = 13, name = "ra_PS_Sigma",
		description = "Uncertainty of ra_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "deg",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 238, tableId = 13, name = "decl_PS",
		description = "Dec of mean source cluster position. Computed from the normalized sum of the unit vector positions of all sources belonging to an object; for sources that are close together this is equivalent to minimizing the sum of the square angular separations between the source positions and the object position.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 239, tableId = 13, name = "decl_PS_Sigma",
		description = "Uncertainty of decl_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "deg",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 240, tableId = 13, name = "radecl_PS_Cov",
		description = "Covariance of ra_PS and decl_PS.",
		type = "FLOAT",
		notNull = 0,
		unit = "deg^2",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 241, tableId = 13, name = "ra_SG",
		description = "Inverse variance weighted mean source cluster position RA. Note that PT1.1 contains no small galaxy model code - this position is computed using the same point source model source positions as ra_PS, decl_PS.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 242, tableId = 13, name = "ra_SG_Sigma",
		description = "Uncertainty of ra_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "deg",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 243, tableId = 13, name = "decl_SG",
		description = "Inverse variance weighted mean source cluster position Dec. Note that PT1.1 contains no small galaxy model code - this position is computed using the same point source model source positions as ra_PS, decl_PS.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 244, tableId = 13, name = "decl_SG_Sigma",
		description = "Uncertain of decl_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "deg",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 245, tableId = 13, name = "radecl_SG_Cov",
		description = "Covariance of ra_SG and decl_SG.",
		type = "FLOAT",
		notNull = 0,
		unit = "deg^2",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 246, tableId = 13, name = "raRange",
		description = "Not set for PT1.1. Width in RA of the bounding box on the sky that fully encloses the footprint of this object for the canonical model (Small Galaxy) and canonical filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "deg",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 247, tableId = 13, name = "declRange",
		description = "Not set for PT1.1. Height in Dec of the bounding box on the sky that fully encloses the footprint of this object in the canonical model (Small Galaxy) and canonical filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "deg",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 248, tableId = 13, name = "muRa_PS",
		description = "Not set for PT1.1. Proper motion (ra) for the Point Source model.",
		type = "DOUBLE",
		notNull = 0,
		unit = "miliarcsec/year",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 249, tableId = 13, name = "muRa_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of muRa_PS.",
		type = "FLOAT",
		notNull = 0,
		unit = "miliarcsec/year",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 250, tableId = 13, name = "muDecl_PS",
		description = "Not set for PT1.1. Proper motion (decl) for the Point Source model.",
		type = "DOUBLE",
		notNull = 0,
		unit = "miliarcsec/year",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 251, tableId = 13, name = "muDecl_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of muDecl_PS.",
		type = "FLOAT",
		notNull = 0,
		unit = "miliarcsec/year",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 252, tableId = 13, name = "muRaDecl_PS_Cov",
		description = "Not set for PT1.1. Covariance of muRa_PS and muDecl_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 253, tableId = 13, name = "parallax_PS",
		description = "Not set for PT1.1. Parallax for Point Source model.",
		type = "DOUBLE",
		notNull = 0,
		unit = "miliarcsec",
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 254, tableId = 13, name = "parallax_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of parallax_PS.",
		type = "FLOAT",
		notNull = 0,
		unit = "miliarcsec",
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 255, tableId = 13, name = "canonicalFilterId",
		description = "Not set for PT1.1. Id of the filter which is the canonical filter for size, ellipticity and Sersic index parameters.",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 256, tableId = 13, name = "extendedness",
		description = "Not set for PT1.1. Probability that this object is an extended object. Valid range: 0-1, where 1 indicates an extended object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 257, tableId = 13, name = "varProb",
		description = "Not set for PT1.1. Probability that this object is variable. Valid range: 0-1, where 1 indicates a variable object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 258, tableId = 13, name = "earliestObsTime",
		description = "Time when this object was observed for the first time (taiMidPoint of the first Source).",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 259, tableId = 13, name = "latestObsTime",
		description = "The latest time when this object was observed (taiMidPoint of the last Source).",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 260, tableId = 13, name = "flags",
		type = "INTEGER",
		notNull = 0,
		description = "Always 0 in PT1.1.",
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 261, tableId = 13, name = "uNumObs",
		description = "Number of u-band sources associated with this object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 262, tableId = 13, name = "uExtendedness",
		description = "Not set for PT1.1. Probability that this object is an extended object for u filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 263, tableId = 13, name = "uVarProb",
		description = "Not set for PT1.1. Probability that this object is variable for u filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 264, tableId = 13, name = "uRaOffset_PS",
		description = "Not set for PT1.1. Center correction of ra_PS for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 265, tableId = 13, name = "uRaOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of uRaOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 266, tableId = 13, name = "uDeclOffset_PS",
		description = "Not set for PT1.1. Center correction of decl_PS for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 267, tableId = 13, name = "uDeclOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of uDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 268, tableId = 13, name = "uRaDeclOffset_PS_Cov",
		description = "Not set for PT1.1. Covariance of uRaOffset_PS and uDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 269, tableId = 13, name = "uRaOffset_SG",
		description = "Not set for PT1.1. Center correction of raOffset_SG for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 270, tableId = 13, name = "uRaOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of uRaOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 271, tableId = 13, name = "uDeclOffset_SG",
		description = "Not set for PT1.1. Center correction of decl_SG for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 272, tableId = 13, name = "uDeclOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of uDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 273, tableId = 13, name = "uRaDeclOffset_SG_Cov",
		description = "Not set for PT1.1. Covariance of uRaOffset_SG and uDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 274, tableId = 13, name = "uLnL_PS",
		description = "Not set for PT1.1. Log-likelihood of being a Point Source for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 275, tableId = 13, name = "uLnL_SG",
		description = "Not set for PT1.1. Log-likelihood of being a Small Galaxy for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 276, tableId = 13, name = "uFlux_PS",
		description = "Inverse variance weighted mean AB PSF flux of u-band sources belonging to this object.",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 277, tableId = 13, name = "uFlux_PS_Sigma",
		description = "Uncertain of uFlux_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 278, tableId = 13, name = "uFlux_SG",
		description = "Not set for PT1.1. Flux for Small Galaxy model for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 279, tableId = 13, name = "uFlux_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of uFlux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 280, tableId = 13, name = "uFlux_CSG",
		description = "Not set for PT1.1. Flux for Canonical Small Galaxy model for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 281, tableId = 13, name = "uFlux_CSG_Sigma",
		description = "Not set for PT1.1. Uncertainty of uFlux_CSG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 282, tableId = 13, name = "uTimescale",
		description = "Not set for PT1.1. Characteristic timescale of flux variations for u filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 283, tableId = 13, name = "uEarliestObsTime",
		description = "Time (TAI) when this object was observed for the first time in u filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 284, tableId = 13, name = "uLatestObsTime",
		description = "The latest time (TAI) when this object was observed in u filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 285, tableId = 13, name = "uSersicN_SG",
		description = "Not set for PT1.1. Sersic index for Small Galaxy model for u filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 286, tableId = 13, name = "uSersicN_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of uSersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 287, tableId = 13, name = "uE1_SG",
		description = "Unweighted mean u-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 288, tableId = 13, name = "uE1_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of uE1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 289, tableId = 13, name = "uE2_SG",
		description = "Unweighted mean u-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 290, tableId = 13, name = "uE2_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of uE2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 291, tableId = 13, name = "uRadius_SG",
		description = "Unweighted mean u-band radius of source cluster. Note that PT1.1 contains no small galaxy model code - radii are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 292, tableId = 13, name = "uRadius_SG_Sigma",
		description = "Uncertainty of uRadius_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 293, tableId = 13, name = "uFlags",
		type = "INTEGER",
		notNull = 0,
		description = "Encodes the number of u-band sources used to determine mean flux/ellipticity. Equal to N_flux_samples + N_ellipticity_samples*4096.",
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 294, tableId = 13, name = "gNumObs",
		description = "Number of g-band sources associated with this object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 295, tableId = 13, name = "gExtendedness",
		description = "Not set for PT1.1. Probability that this object is an extended object for g filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 296, tableId = 13, name = "gVarProb",
		description = "Not set for PT1.1. Probability that this object is variable for g filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 297, tableId = 13, name = "gRaOffset_PS",
		description = "Not set for PT1.1. Center correction of ra_PS for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 298, tableId = 13, name = "gRaOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of gRaOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 299, tableId = 13, name = "gDeclOffset_PS",
		description = "Not set for PT1.1. Center correction of decl_PS for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 300, tableId = 13, name = "gDeclOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of gDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 301, tableId = 13, name = "gRaDeclOffset_PS_Cov",
		description = "Not set for PT1.1. Covariance of gRaOffset_PS and gDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 302, tableId = 13, name = "gRaOffset_SG",
		description = "Not set for PT1.1. Center correction of raOffset_SG for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 303, tableId = 13, name = "gRaOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of gRaOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 304, tableId = 13, name = "gDeclOffset_SG",
		description = "Not set for PT1.1. Center correction of decl_SG for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 305, tableId = 13, name = "gDeclOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of gDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 306, tableId = 13, name = "gRaDeclOffset_SG_Cov",
		description = "Not set for PT1.1. Covariance of gRaOffset_SG and gDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 307, tableId = 13, name = "gLnL_PS",
		description = "Not set for PT1.1. Log-likelihood of being a Point Source for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 308, tableId = 13, name = "gLnL_SG",
		description = "Not set for PT1.1. Log-likelihood of being a Small Galaxy for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 309, tableId = 13, name = "gFlux_PS",
		description = "Inverse variance weighted mean AB PSF flux of g-band sources belonging to this object.",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 310, tableId = 13, name = "gFlux_PS_Sigma",
		description = "Uncertainty of gFlux_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 311, tableId = 13, name = "gFlux_SG",
		description = "Not set for PT1.1. Flux for Small Galaxy model for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 312, tableId = 13, name = "gFlux_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of gFlux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 313, tableId = 13, name = "gFlux_CSG",
		description = "Not set for PT1.1. Flux for Canonical Small Galaxy model for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 314, tableId = 13, name = "gFlux_CSG_Sigma",
		description = "Not set for PT1.1. Uncertainty of gFlux_CSG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 315, tableId = 13, name = "gTimescale",
		description = "Not set for PT1.1. Characteristic timescale of flux variations for g filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 316, tableId = 13, name = "gEarliestObsTime",
		description = "Time (TAI) when this object was observed for the first time in g filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 83;

	INSERT INTO md_Column
	SET columnId = 317, tableId = 13, name = "gLatestObsTime",
		description = "The latest time (TAI) when this object was observed in g filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 84;

	INSERT INTO md_Column
	SET columnId = 318, tableId = 13, name = "gSersicN_SG",
		description = "Not set for PT1.1. Sersic index for Small Galaxy model for g filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 85;

	INSERT INTO md_Column
	SET columnId = 319, tableId = 13, name = "gSersicN_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of gSersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 86;

	INSERT INTO md_Column
	SET columnId = 320, tableId = 13, name = "gE1_SG",
		description = "Unweighted mean g-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 87;

	INSERT INTO md_Column
	SET columnId = 321, tableId = 13, name = "gE1_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of gE1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 88;

	INSERT INTO md_Column
	SET columnId = 322, tableId = 13, name = "gE2_SG",
		description = "Unweighted mean g-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 89;

	INSERT INTO md_Column
	SET columnId = 323, tableId = 13, name = "gE2_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of gE2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 90;

	INSERT INTO md_Column
	SET columnId = 324, tableId = 13, name = "gRadius_SG",
		description = "Unweighted mean g-band radius of source cluster. Note that PT1.1 contains no small galaxy model code - radii are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 91;

	INSERT INTO md_Column
	SET columnId = 325, tableId = 13, name = "gRadius_SG_Sigma",
		description = "Uncertainty of gRadius_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 92;

	INSERT INTO md_Column
	SET columnId = 326, tableId = 13, name = "gFlags",
		type = "INTEGER",
		notNull = 0,
		description = "Encodes the number of g-band sources used to determine mean flux/ellipticity. Equal to N_flux_samples + N_ellipticity_samples*4096.",
		displayOrder = 93;

	INSERT INTO md_Column
	SET columnId = 327, tableId = 13, name = "rNumObs",
		description = "Number of r-band sources associated with this object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 94;

	INSERT INTO md_Column
	SET columnId = 328, tableId = 13, name = "rExtendedness",
		description = "Not set for PT1.1. Probability that this object is an extended object for r filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 95;

	INSERT INTO md_Column
	SET columnId = 329, tableId = 13, name = "rVarProb",
		description = "Not set for PT1.1. Probability that this object is variable for r filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 96;

	INSERT INTO md_Column
	SET columnId = 330, tableId = 13, name = "rRaOffset_PS",
		description = "Not set for PT1.1. Center correction of ra_PS for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 97;

	INSERT INTO md_Column
	SET columnId = 331, tableId = 13, name = "rRaOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of rRaOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 98;

	INSERT INTO md_Column
	SET columnId = 332, tableId = 13, name = "rDeclOffset_PS",
		description = "Not set for PT1.1. Center correction of decl_PS for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 99;

	INSERT INTO md_Column
	SET columnId = 333, tableId = 13, name = "rDeclOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of rDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 100;

	INSERT INTO md_Column
	SET columnId = 334, tableId = 13, name = "rRaDeclOffset_PS_Cov",
		description = "Not set for PT1.1. Covariance of rRaOffset_PS and rDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 101;

	INSERT INTO md_Column
	SET columnId = 335, tableId = 13, name = "rRaOffset_SG",
		description = "Not set for PT1.1. Center correction of raOffset_SG for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 102;

	INSERT INTO md_Column
	SET columnId = 336, tableId = 13, name = "rRaOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of rRaOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 103;

	INSERT INTO md_Column
	SET columnId = 337, tableId = 13, name = "rDeclOffset_SG",
		description = "Not set for PT1.1. Center correction of decl_SG for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 104;

	INSERT INTO md_Column
	SET columnId = 338, tableId = 13, name = "rDeclOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of rDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 105;

	INSERT INTO md_Column
	SET columnId = 339, tableId = 13, name = "rRaDeclOffset_SG_Cov",
		description = "Not set for PT1.1. Covariance of rRaOffset_SG and rDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 106;

	INSERT INTO md_Column
	SET columnId = 340, tableId = 13, name = "rLnL_PS",
		description = "Not set for PT1.1. Log-likelihood of being a Point Source for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 107;

	INSERT INTO md_Column
	SET columnId = 341, tableId = 13, name = "rLnL_SG",
		description = "Not set for PT1.1. Log-likelihood of being a Small Galaxy for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 108;

	INSERT INTO md_Column
	SET columnId = 342, tableId = 13, name = "rFlux_PS",
		description = "Inverse variance weighted mean AB PSF flux of r-band sources belonging to this object.",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 109;

	INSERT INTO md_Column
	SET columnId = 343, tableId = 13, name = "rFlux_PS_Sigma",
		description = "Uncertainty of rFlux_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 110;

	INSERT INTO md_Column
	SET columnId = 344, tableId = 13, name = "rFlux_SG",
		description = "Not set for PT1.1. Flux for Small Galaxy model for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 111;

	INSERT INTO md_Column
	SET columnId = 345, tableId = 13, name = "rFlux_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of rFlux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 112;

	INSERT INTO md_Column
	SET columnId = 346, tableId = 13, name = "rFlux_CSG",
		description = "Not set for PT1.1. Flux for Canonical Small Galaxy model for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 113;

	INSERT INTO md_Column
	SET columnId = 347, tableId = 13, name = "rFlux_CSG_Sigma",
		description = "Not set for PT1.1. Uncertainty of rFlux_CSG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 114;

	INSERT INTO md_Column
	SET columnId = 348, tableId = 13, name = "rTimescale",
		description = "Not set for PT1.1. Characteristic timescale of flux variations for r filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 115;

	INSERT INTO md_Column
	SET columnId = 349, tableId = 13, name = "rEarliestObsTime",
		description = "Time (TAI) when this object was observed for the first time in r filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 116;

	INSERT INTO md_Column
	SET columnId = 350, tableId = 13, name = "rLatestObsTime",
		description = "The latest time (TAI) when this object was observed in r filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 117;

	INSERT INTO md_Column
	SET columnId = 351, tableId = 13, name = "rSersicN_SG",
		description = "Not set for PT1.1. Sersic index for Small Galaxy model for r filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 118;

	INSERT INTO md_Column
	SET columnId = 352, tableId = 13, name = "rSersicN_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of rSersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 119;

	INSERT INTO md_Column
	SET columnId = 353, tableId = 13, name = "rE1_SG",
		description = "Unweighted mean r-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 120;

	INSERT INTO md_Column
	SET columnId = 354, tableId = 13, name = "rE1_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of rE1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 121;

	INSERT INTO md_Column
	SET columnId = 355, tableId = 13, name = "rE2_SG",
		description = "Unweighted mean r-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 122;

	INSERT INTO md_Column
	SET columnId = 356, tableId = 13, name = "rE2_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of rE2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 123;

	INSERT INTO md_Column
	SET columnId = 357, tableId = 13, name = "rRadius_SG",
		description = "Unweighted mean r-band radius of source cluster. Note that PT1.1 contains no small galaxy model code - radii are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 124;

	INSERT INTO md_Column
	SET columnId = 358, tableId = 13, name = "rRadius_SG_Sigma",
		description = "Uncertainty of rRadius_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 125;

	INSERT INTO md_Column
	SET columnId = 359, tableId = 13, name = "rFlags",
		type = "INTEGER",
		notNull = 0,
		description = "Encodes the number of r-band sources used to determine mean flux/ellipticity. Equal to N_flux_samples + N_ellipticity_samples*4096.",
		displayOrder = 126;

	INSERT INTO md_Column
	SET columnId = 360, tableId = 13, name = "iNumObs",
		description = "Number of i-band sources associated with this object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 127;

	INSERT INTO md_Column
	SET columnId = 361, tableId = 13, name = "iExtendedness",
		description = "Not set for PT1.1. Probability that this object is an extended object for i filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 128;

	INSERT INTO md_Column
	SET columnId = 362, tableId = 13, name = "iVarProb",
		description = "Not set for PT1.1. Probability that this object is variable for i filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 129;

	INSERT INTO md_Column
	SET columnId = 363, tableId = 13, name = "iRaOffset_PS",
		description = "Not set for PT1.1. Center correction of ra_PS for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 130;

	INSERT INTO md_Column
	SET columnId = 364, tableId = 13, name = "iRaOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of iRaOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 131;

	INSERT INTO md_Column
	SET columnId = 365, tableId = 13, name = "iDeclOffset_PS",
		description = "Not set for PT1.1. Center correction of decl_PS for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 132;

	INSERT INTO md_Column
	SET columnId = 366, tableId = 13, name = "iDeclOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of iDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 133;

	INSERT INTO md_Column
	SET columnId = 367, tableId = 13, name = "iRaDeclOffset_PS_Cov",
		description = "Not set for PT1.1. Covariance of iRaOffset_PS and iDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 134;

	INSERT INTO md_Column
	SET columnId = 368, tableId = 13, name = "iRaOffset_SG",
		description = "Not set for PT1.1. Center correction of raOffset_SG for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 135;

	INSERT INTO md_Column
	SET columnId = 369, tableId = 13, name = "iRaOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of iRaOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 136;

	INSERT INTO md_Column
	SET columnId = 370, tableId = 13, name = "iDeclOffset_SG",
		description = "Not set for PT1.1. Center correction of decl_SG for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 137;

	INSERT INTO md_Column
	SET columnId = 371, tableId = 13, name = "iDeclOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of iDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 138;

	INSERT INTO md_Column
	SET columnId = 372, tableId = 13, name = "iRaDeclOffset_SG_Cov",
		description = "Not set for PT1.1. Covariance of iRaOffset_SG and iDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 139;

	INSERT INTO md_Column
	SET columnId = 373, tableId = 13, name = "iLnL_PS",
		description = "Not set for PT1.1. Log-likelihood of being a Point Source for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 140;

	INSERT INTO md_Column
	SET columnId = 374, tableId = 13, name = "iLnL_SG",
		description = "Not set for PT1.1. Log-likelihood of being a Small Galaxy for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 141;

	INSERT INTO md_Column
	SET columnId = 375, tableId = 13, name = "iFlux_PS",
		description = "Inverse variance weighted mean AB PSF flux of i-band sources belonging to this object.",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 142;

	INSERT INTO md_Column
	SET columnId = 376, tableId = 13, name = "iFlux_PS_Sigma",
		description = "Uncertainty of iFlux_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 143;

	INSERT INTO md_Column
	SET columnId = 377, tableId = 13, name = "iFlux_SG",
		description = "Not set for PT1.1. Flux for Small Galaxy model for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 144;

	INSERT INTO md_Column
	SET columnId = 378, tableId = 13, name = "iFlux_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of iFlux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 145;

	INSERT INTO md_Column
	SET columnId = 379, tableId = 13, name = "iFlux_CSG",
		description = "Not set for PT1.1. Flux for Canonical Small Galaxy model for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 146;

	INSERT INTO md_Column
	SET columnId = 380, tableId = 13, name = "iFlux_CSG_Sigma",
		description = "Not set for PT1.1. Uncertainty of iFlux_CSG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 147;

	INSERT INTO md_Column
	SET columnId = 381, tableId = 13, name = "iTimescale",
		description = "Not set for PT1.1. Characteristic timescale of flux variations for i filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 148;

	INSERT INTO md_Column
	SET columnId = 382, tableId = 13, name = "iEarliestObsTime",
		description = "Time (TAI) when this object was observed for the first time in i filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 149;

	INSERT INTO md_Column
	SET columnId = 383, tableId = 13, name = "iLatestObsTime",
		description = "The latest time (TAI) when this object was observed in i filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 150;

	INSERT INTO md_Column
	SET columnId = 384, tableId = 13, name = "iSersicN_SG",
		description = "Not set for PT1.1. Sersic index for Small Galaxy model for i filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 151;

	INSERT INTO md_Column
	SET columnId = 385, tableId = 13, name = "iSersicN_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of iSersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 152;

	INSERT INTO md_Column
	SET columnId = 386, tableId = 13, name = "iE1_SG",
		description = "Unweighted mean i-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 153;

	INSERT INTO md_Column
	SET columnId = 387, tableId = 13, name = "iE1_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of iE1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 154;

	INSERT INTO md_Column
	SET columnId = 388, tableId = 13, name = "iE2_SG",
		description = "Unweighted mean i-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 155;

	INSERT INTO md_Column
	SET columnId = 389, tableId = 13, name = "iE2_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of iE2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 156;

	INSERT INTO md_Column
	SET columnId = 390, tableId = 13, name = "iRadius_SG",
		description = "Unweighted mean i-band radius of source cluster. Note that PT1.1 contains no small galaxy model code - radii are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 157;

	INSERT INTO md_Column
	SET columnId = 391, tableId = 13, name = "iRadius_SG_Sigma",
		description = "Uncertainty of iRadius_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 158;

	INSERT INTO md_Column
	SET columnId = 392, tableId = 13, name = "iFlags",
		type = "INTEGER",
		notNull = 0,
		description = "Encodes the number of i-band sources used to determine mean flux/ellipticity. Equal to N_flux_samples + N_ellipticity_samples*4096.",
		displayOrder = 159;

	INSERT INTO md_Column
	SET columnId = 393, tableId = 13, name = "zNumObs",
		description = "Number of z-band sources associated with this object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 160;

	INSERT INTO md_Column
	SET columnId = 394, tableId = 13, name = "zExtendedness",
		description = "Not set for PT1.1. Probability that this object is an extended object for z filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 161;

	INSERT INTO md_Column
	SET columnId = 395, tableId = 13, name = "zVarProb",
		description = "Not set for PT1.1. Probability that this object is variable for z filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 162;

	INSERT INTO md_Column
	SET columnId = 396, tableId = 13, name = "zRaOffset_PS",
		description = "Not set for PT1.1. Center correction of ra_PS for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 163;

	INSERT INTO md_Column
	SET columnId = 397, tableId = 13, name = "zRaOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of zRaOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 164;

	INSERT INTO md_Column
	SET columnId = 398, tableId = 13, name = "zDeclOffset_PS",
		description = "Not set for PT1.1. Center correction of decl_PS for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 165;

	INSERT INTO md_Column
	SET columnId = 399, tableId = 13, name = "zDeclOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of zDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 166;

	INSERT INTO md_Column
	SET columnId = 400, tableId = 13, name = "zRaDeclOffset_PS_Cov",
		description = "Not set for PT1.1. Covariance of zRaOffset_PS and zDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 167;

	INSERT INTO md_Column
	SET columnId = 401, tableId = 13, name = "zRaOffset_SG",
		description = "Not set for PT1.1. Center correction of raOffset_SG for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 168;

	INSERT INTO md_Column
	SET columnId = 402, tableId = 13, name = "zRaOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of zRaOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 169;

	INSERT INTO md_Column
	SET columnId = 403, tableId = 13, name = "zDeclOffset_SG",
		description = "Not set for PT1.1. Center correction of decl_SG for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 170;

	INSERT INTO md_Column
	SET columnId = 404, tableId = 13, name = "zDeclOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of zDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 171;

	INSERT INTO md_Column
	SET columnId = 405, tableId = 13, name = "zRaDeclOffset_SG_Cov",
		description = "Not set for PT1.1. Covariance of zRaOffset_SG and zDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 172;

	INSERT INTO md_Column
	SET columnId = 406, tableId = 13, name = "zLnL_PS",
		description = "Not set for PT1.1. Log-likelihood of being a Point Source for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 173;

	INSERT INTO md_Column
	SET columnId = 407, tableId = 13, name = "zLnL_SG",
		description = "Not set for PT1.1. Log-likelihood of being a Small Galaxy for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 174;

	INSERT INTO md_Column
	SET columnId = 408, tableId = 13, name = "zFlux_PS",
		description = "Inverse variance weighted mean AB PSF flux of z-band sources belonging to this object.",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 175;

	INSERT INTO md_Column
	SET columnId = 409, tableId = 13, name = "zFlux_PS_Sigma",
		description = "Uncertainty of zFlux_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 176;

	INSERT INTO md_Column
	SET columnId = 410, tableId = 13, name = "zFlux_SG",
		description = "Not set for PT1.1. Flux for Small Galaxy model for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 177;

	INSERT INTO md_Column
	SET columnId = 411, tableId = 13, name = "zFlux_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of zFlux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 178;

	INSERT INTO md_Column
	SET columnId = 412, tableId = 13, name = "zFlux_CSG",
		description = "Not set for PT1.1. Flux for Canonical Small Galaxy model for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 179;

	INSERT INTO md_Column
	SET columnId = 413, tableId = 13, name = "zFlux_CSG_Sigma",
		description = "Not set for PT1.1. Uncertainty of zFlux_CSG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 180;

	INSERT INTO md_Column
	SET columnId = 414, tableId = 13, name = "zTimescale",
		description = "Not set for PT1.1. Characteristic timescale of flux variations for z filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 181;

	INSERT INTO md_Column
	SET columnId = 415, tableId = 13, name = "zEarliestObsTime",
		description = "Time (TAI) when this object was observed for the first time in z filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 182;

	INSERT INTO md_Column
	SET columnId = 416, tableId = 13, name = "zLatestObsTime",
		description = "The latest time (TAI) when this object was observed in z filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 183;

	INSERT INTO md_Column
	SET columnId = 417, tableId = 13, name = "zSersicN_SG",
		description = "Not set for PT1.1. Sersic index for Small Galaxy model for z filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 184;

	INSERT INTO md_Column
	SET columnId = 418, tableId = 13, name = "zSersicN_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of zSersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 185;

	INSERT INTO md_Column
	SET columnId = 419, tableId = 13, name = "zE1_SG",
		description = "Unweighted mean z-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 186;

	INSERT INTO md_Column
	SET columnId = 420, tableId = 13, name = "zE1_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of zE1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 187;

	INSERT INTO md_Column
	SET columnId = 421, tableId = 13, name = "zE2_SG",
		description = "Unweighted mean z-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 188;

	INSERT INTO md_Column
	SET columnId = 422, tableId = 13, name = "zE2_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of zE2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 189;

	INSERT INTO md_Column
	SET columnId = 423, tableId = 13, name = "zRadius_SG",
		description = "Unweighted mean z-band radius of source cluster. Note that PT1.1 contains no small galaxy model code - radii are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 190;

	INSERT INTO md_Column
	SET columnId = 424, tableId = 13, name = "zRadius_SG_Sigma",
		description = "Uncertainty of zRadius_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 191;

	INSERT INTO md_Column
	SET columnId = 425, tableId = 13, name = "zFlags",
		type = "INTEGER",
		notNull = 0,
		description = "Encodes the number of z-band sources used to determine mean flux/ellipticity. Equal to N_flux_samples + N_ellipticity_samples*4096.",
		displayOrder = 192;

	INSERT INTO md_Column
	SET columnId = 426, tableId = 13, name = "yNumObs",
		description = "Number of y-band sources associated with this object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 193;

	INSERT INTO md_Column
	SET columnId = 427, tableId = 13, name = "yExtendedness",
		description = "Not set for PT1.1. Probability that this object is an extended object for y filter. Valid range: 0-1, where 1 indicates an extended object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 194;

	INSERT INTO md_Column
	SET columnId = 428, tableId = 13, name = "yVarProb",
		description = "Not set for PT1.1. Probability that this object is variable for y filter. Valid range: 0-1, where 1 indicates a variable object with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 195;

	INSERT INTO md_Column
	SET columnId = 429, tableId = 13, name = "yRaOffset_PS",
		description = "Not set for PT1.1. Center correction of ra_PS for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 196;

	INSERT INTO md_Column
	SET columnId = 430, tableId = 13, name = "yRaOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of yRaOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 197;

	INSERT INTO md_Column
	SET columnId = 431, tableId = 13, name = "yDeclOffset_PS",
		description = "Not set for PT1.1. Center correction of decl_PS for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 198;

	INSERT INTO md_Column
	SET columnId = 432, tableId = 13, name = "yDeclOffset_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of yDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 199;

	INSERT INTO md_Column
	SET columnId = 433, tableId = 13, name = "yRaDeclOffset_PS_Cov",
		description = "Not set for PT1.1. Covariance of yRaOffset_PS and yDeclOffset_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 200;

	INSERT INTO md_Column
	SET columnId = 434, tableId = 13, name = "yRaOffset_SG",
		description = "Not set for PT1.1. Center correction of raOffset_SG for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 201;

	INSERT INTO md_Column
	SET columnId = 435, tableId = 13, name = "yRaOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of yRaOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 202;

	INSERT INTO md_Column
	SET columnId = 436, tableId = 13, name = "yDeclOffset_SG",
		description = "Not set for PT1.1. Center correction of decl_SG for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 203;

	INSERT INTO md_Column
	SET columnId = 437, tableId = 13, name = "yDeclOffset_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of yDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 204;

	INSERT INTO md_Column
	SET columnId = 438, tableId = 13, name = "yRaDeclOffset_SG_Cov",
		description = "Not set for PT1.1. Covariance of yRaOffset_SG and yDeclOffset_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 205;

	INSERT INTO md_Column
	SET columnId = 439, tableId = 13, name = "yLnL_PS",
		description = "Not set for PT1.1. Log-likelihood of being a Point Source for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 206;

	INSERT INTO md_Column
	SET columnId = 440, tableId = 13, name = "yLnL_SG",
		description = "Not set for PT1.1. Log-likelihood of being a Small Galaxy for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 207;

	INSERT INTO md_Column
	SET columnId = 441, tableId = 13, name = "yFlux_PS",
		description = "Inverse variance weighted mean AB PSF flux of y-band sources belonging to this object.",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 208;

	INSERT INTO md_Column
	SET columnId = 442, tableId = 13, name = "yFlux_PS_Sigma",
		description = "Uncertainty of yFlux_PS (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "erg/s/cm^2/Hz",
		displayOrder = 209;

	INSERT INTO md_Column
	SET columnId = 443, tableId = 13, name = "yFlux_SG",
		description = "Not set for PT1.1. Flux for Small Galaxy model for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 210;

	INSERT INTO md_Column
	SET columnId = 444, tableId = 13, name = "yFlux_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of yFlux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 211;

	INSERT INTO md_Column
	SET columnId = 445, tableId = 13, name = "yFlux_CSG",
		description = "Not set for PT1.1. Flux for Canonical Small Galaxy model for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 212;

	INSERT INTO md_Column
	SET columnId = 446, tableId = 13, name = "yFlux_CSG_Sigma",
		description = "Not set for PT1.1. Uncertainty of yFlux_CSG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 213;

	INSERT INTO md_Column
	SET columnId = 447, tableId = 13, name = "yTimescale",
		description = "Not set for PT1.1. Characteristic timescale of flux variations for y filter.",
		type = "FLOAT",
		notNull = 0,
		unit = "day",
		displayOrder = 214;

	INSERT INTO md_Column
	SET columnId = 448, tableId = 13, name = "yEarliestObsTime",
		description = "Time (TAI) when this object was observed for the first time in y filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 215;

	INSERT INTO md_Column
	SET columnId = 449, tableId = 13, name = "yLatestObsTime",
		description = "The latest time (TAI) when this object was observed in y filter.",
		type = "DOUBLE",
		notNull = 0,
		unit = "mjd",
		displayOrder = 216;

	INSERT INTO md_Column
	SET columnId = 450, tableId = 13, name = "ySersicN_SG",
		description = "Not set for PT1.1. Sersic index for Small Galaxy model for y filter.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 217;

	INSERT INTO md_Column
	SET columnId = 451, tableId = 13, name = "ySersicN_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of ySersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 218;

	INSERT INTO md_Column
	SET columnId = 452, tableId = 13, name = "yE1_SG",
		description = "Unweighted mean y-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 219;

	INSERT INTO md_Column
	SET columnId = 453, tableId = 13, name = "yE1_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of yE1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 220;

	INSERT INTO md_Column
	SET columnId = 454, tableId = 13, name = "yE2_SG",
		description = "Unweighted mean y-band ellipticity of source cluster in a tangent plane centered on (ra_PS, decl_PS) and with the standard N,E basis. Note that PT1.1 contains no small galaxy model code - ellipticities are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 221;

	INSERT INTO md_Column
	SET columnId = 455, tableId = 13, name = "yE2_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of yE2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 222;

	INSERT INTO md_Column
	SET columnId = 456, tableId = 13, name = "yRadius_SG",
		description = "Unweighted mean y-band radius of source cluster. Note that PT1.1 contains no small galaxy model code - radii are derived from source adaptive second moments (Ixx, Iyy, Ixy).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 223;

	INSERT INTO md_Column
	SET columnId = 457, tableId = 13, name = "yRadius_SG_Sigma",
		description = "Uncertainty of yRadius_SG (standard deviation).",
		type = "FLOAT",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 224;

	INSERT INTO md_Column
	SET columnId = 458, tableId = 13, name = "yFlags",
		type = "INTEGER",
		notNull = 0,
		description = "Encodes the number of y-band sources used to determine mean flux/ellipticity. Equal to N_flux_samples + N_ellipticity_samples*4096.",
		displayOrder = 225;

	INSERT INTO md_Column
	SET columnId = 459, tableId = 13, name = "_chunkId",
		description = "Internal column used by qserv.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 226;

	INSERT INTO md_Column
	SET columnId = 460, tableId = 13, name = "_subChunkId",
		description = "Internal column used by qserv.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 227;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 15, name = "ObjectType",
	engine = "MyISAM",
	description = "Table to store description of object types. It includes all object types: static, variables, Solar System objects, etc.";

	INSERT INTO md_Column
	SET columnId = 608, tableId = 15, name = "typeId",
		description = "Unique id.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 609, tableId = 15, name = "description",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 16, name = "RaftMap",
	description = "Mapping table to translate raft names to numbers.";

	INSERT INTO md_Column
	SET columnId = 610, tableId = 16, name = "raftNum",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 611, tableId = 16, name = "raftName",
		type = "CHAR(3)",
		notNull = 1,
		displayOrder = 2;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 18, name = "Raw_Amp_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 615, tableId = 18, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 616, tableId = 18, name = "visit",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 617, tableId = 18, name = "snap",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 618, tableId = 18, name = "raft",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 619, tableId = 18, name = "ccd",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 620, tableId = 18, name = "amp",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 621, tableId = 18, name = "filterId",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 622, tableId = 18, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 623, tableId = 18, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 624, tableId = 18, name = "equinox",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 625, tableId = 18, name = "raDeSys",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 626, tableId = 18, name = "ctype1",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 627, tableId = 18, name = "ctype2",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 628, tableId = 18, name = "crpix1",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 629, tableId = 18, name = "crpix2",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 630, tableId = 18, name = "crval1",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 631, tableId = 18, name = "crval2",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 632, tableId = 18, name = "cd1_1",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 633, tableId = 18, name = "cd1_2",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 634, tableId = 18, name = "cd2_1",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 635, tableId = 18, name = "cd2_2",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 636, tableId = 18, name = "llcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 637, tableId = 18, name = "llcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 638, tableId = 18, name = "ulcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 639, tableId = 18, name = "ulcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 640, tableId = 18, name = "urcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 641, tableId = 18, name = "urcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 642, tableId = 18, name = "lrcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 643, tableId = 18, name = "lrcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 644, tableId = 18, name = "taiMjd",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 645, tableId = 18, name = "obsStart",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 646, tableId = 18, name = "expMidpt",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 647, tableId = 18, name = "expTime",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 648, tableId = 18, name = "airmass",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 649, tableId = 18, name = "darkTime",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 650, tableId = 18, name = "zd",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 36;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 19, name = "Raw_Amp_Exposure_Metadata",
	engine = "MyISAM",
	description = "Generic key-value pair metadata for Raw_Amp_Exposure.";

	INSERT INTO md_Column
	SET columnId = 651, tableId = 19, name = "rawAmpExposureId",
		description = "Id of the corresponding Raw_Amp_Exposure.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 652, tableId = 19, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 653, tableId = 19, name = "exposureType",
		description = "Meaning of the bits:<ul><li>0x1: rawAmp,<li>0x2: postIsrAmp,<li>more tbd.</ul>",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 654, tableId = 19, name = "intValue",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 655, tableId = 19, name = "doubleValue",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 656, tableId = 19, name = "stringValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 20, name = "Raw_Amp_To_Science_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 657, tableId = 20, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 658, tableId = 20, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 659, tableId = 20, name = "snap",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 660, tableId = 20, name = "amp",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 4;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 21, name = "Raw_Amp_To_Snap_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 661, tableId = 21, name = "rawAmpExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 662, tableId = 21, name = "amp",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 663, tableId = 21, name = "snapCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 24, name = "RefObjMatch",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 692, tableId = 24, name = "refObjectId",
		description = "Reference object id (pointer to SimRefObject). NULL if reference object has no matches.",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 693, tableId = 24, name = "objectId",
		description = "Object id. NULL if object has no matches.",
		type = "BIGINT",
		notNull = 0,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 694, tableId = 24, name = "refRa",
		description = "ICRS reference object RA at mean epoch of sources assigned to object.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 695, tableId = 24, name = "refDec",
		description = "ICRS reference object Dec at mean epoch of sources assigned to object.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 696, tableId = 24, name = "angSep",
		description = "Angular separation between reference object and object.",
		type = "DOUBLE",
		notNull = 0,
		unit = "arcsec",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 697, tableId = 24, name = "nRefMatches",
		description = "Total number of matches for reference object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 698, tableId = 24, name = "nObjMatches",
		description = "Total number of matches for object.",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 699, tableId = 24, name = "closestToRef",
		description = "1 if object is the closest match for reference object, 0 otherwise.",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 700, tableId = 24, name = "closestToObj",
		description = "1 if reference object is the closest match for object, 0 otherwise.",
		type = "TINYINT",
		notNull = 0,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 701, tableId = 24, name = "flags",
		description = "Bitwise or of match flags.<ul><li>0x1: the reference object has proper motion.<li>0x2: the reference object has parallax.<li>0x4: a reduction for parallax from barycentric to geocentric place was applied prior to matching the reference object.</ul>",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 10;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 27, name = "Science_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 712, tableId = 27, name = "scienceCcdExposureId",
		description = "Primary key (unique identifier).",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 713, tableId = 27, name = "visit",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 714, tableId = 27, name = "raft",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 715, tableId = 27, name = "ccd",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 716, tableId = 27, name = "filterId",
		description = "Pointer to filter.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 717, tableId = 27, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 718, tableId = 27, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 719, tableId = 27, name = "equinox",
		description = "Equinox of World Coordinate System.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 720, tableId = 27, name = "raDeSys",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 721, tableId = 27, name = "ctype1",
		description = "Coordinate projection type, axis 1.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 722, tableId = 27, name = "ctype2",
		description = "Coordinate projection type, axis 2.",
		type = "VARCHAR(20)",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 723, tableId = 27, name = "crpix1",
		description = "Coordinate reference pixel, axis 1.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 724, tableId = 27, name = "crpix2",
		description = "Coordinate reference pixel, axis 2.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 725, tableId = 27, name = "crval1",
		description = "Coordinate value 1 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 726, tableId = 27, name = "crval2",
		description = "Coordinate value 2 @reference pixel.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 727, tableId = 27, name = "cd1_1",
		description = "First derivative of coordinate 1 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 728, tableId = 27, name = "cd1_2",
		description = "First derivative of coordinate 1 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 729, tableId = 27, name = "cd2_1",
		description = "First derivative of coordinate 2 w.r.t. axis 1.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 730, tableId = 27, name = "cd2_2",
		description = "First derivative of coordinate 2 w.r.t. axis 2.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 731, tableId = 27, name = "llcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 732, tableId = 27, name = "llcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 733, tableId = 27, name = "ulcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 734, tableId = 27, name = "ulcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 735, tableId = 27, name = "urcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 736, tableId = 27, name = "urcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 737, tableId = 27, name = "lrcRa",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 738, tableId = 27, name = "lrcDecl",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 739, tableId = 27, name = "taiMjd",
		description = "Date of the start of the exposure.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 740, tableId = 27, name = "obsStart",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 741, tableId = 27, name = "expMidpt",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 742, tableId = 27, name = "expTime",
		description = "Duration of exposure.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 743, tableId = 27, name = "nCombine",
		description = "Number of images co-added to create a deeper image.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 744, tableId = 27, name = "binX",
		description = "Binning of the ccd in x.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 745, tableId = 27, name = "binY",
		description = "Binning of the ccd in y.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 746, tableId = 27, name = "readNoise",
		description = "Read noise of the ccd.",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 747, tableId = 27, name = "saturationLimit",
		description = "Saturation limit for the ccd (average of the amplifiers).",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 748, tableId = 27, name = "gainEff",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 749, tableId = 27, name = "fluxMag0",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 750, tableId = 27, name = "fluxMag0Sigma",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 751, tableId = 27, name = "fwhm",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 40;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 28, name = "Science_Ccd_Exposure_Metadata",
	engine = "MyISAM",
	description = "Generic key-value pair metadata for Science_Ccd_Exposure.";

	INSERT INTO md_Column
	SET columnId = 752, tableId = 28, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 753, tableId = 28, name = "metadataKey",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 754, tableId = 28, name = "exposureType",
		description = "Meaning of the bits:<ul><li>0x1: scienceCcd<li>0x2: diffCcd<li>more tbd.</ul>",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 755, tableId = 28, name = "intValue",
		type = "INTEGER",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 756, tableId = 28, name = "doubleValue",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 757, tableId = 28, name = "stringValue",
		type = "VARCHAR(255)",
		notNull = 0,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 29, name = "SimRefObject",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 758, tableId = 29, name = "refObjectId",
		description = "Reference object id.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 759, tableId = 29, name = "isStar",
		description = "1 for stars, 0 for galaxies.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 760, tableId = 29, name = "ra",
		description = "RA, ICRS.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 761, tableId = 29, name = "decl",
		description = "Dec, ICRS.",
		type = "DOUBLE",
		notNull = 1,
		unit = "deg",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 762, tableId = 29, name = "gLat",
		description = "Galactic latitude. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 763, tableId = 29, name = "gLon",
		description = "Galactic longitude, deg. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "deg",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 764, tableId = 29, name = "sedName",
		description = "Best-fit SED name. NULL for galaxies.",
		type = "CHAR(32)",
		notNull = 0,
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 765, tableId = 29, name = "uMag",
		description = "u band AB magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 766, tableId = 29, name = "gMag",
		description = "g band AB magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 767, tableId = 29, name = "rMag",
		description = "r band AB magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 768, tableId = 29, name = "iMag",
		description = "i band AB magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 769, tableId = 29, name = "zMag",
		description = "z band AB magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 770, tableId = 29, name = "yMag",
		description = "y band AB magnitude",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 771, tableId = 29, name = "muRa",
		description = "dRA/dt*cos(decl). NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "milliarcsec/year",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 772, tableId = 29, name = "muDecl",
		description = "dDec/dt. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "milliarcsec/year",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 773, tableId = 29, name = "parallax",
		description = "Stellar parallax. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "milliarcsec",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 774, tableId = 29, name = "vRad",
		description = "Radial velocity. NULL for galaxies.",
		type = "DOUBLE",
		notNull = 0,
		unit = "km/s",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 775, tableId = 29, name = "isVar",
		description = "1 for variable stars, 0 for galaxies and non-variable stars.",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 776, tableId = 29, name = "redshift",
		description = "Redshift. NULL for stars.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 777, tableId = 29, name = "uCov",
		description = "Number of u-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 778, tableId = 29, name = "gCov",
		description = "Number of g-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 779, tableId = 29, name = "rCov",
		description = "Number of r-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 780, tableId = 29, name = "iCov",
		description = "Number of i-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 781, tableId = 29, name = "zCov",
		description = "Number of z-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 782, tableId = 29, name = "yCov",
		description = "Number of y-band science CCDs containing reference object.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 25;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 30, name = "Snap_Ccd_To_Science_Ccd_Exposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 783, tableId = 30, name = "snapCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 784, tableId = 30, name = "snap",
		type = "TINYINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 785, tableId = 30, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 31, name = "Source",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 786, tableId = 31, name = "sourceId",
		type = "BIGINT",
		notNull = 1,
		description = "Primary key (unique identifier)",
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 787, tableId = 31, name = "scienceCcdExposureId",
		type = "BIGINT",
		notNull = 0,
		description = "Identifier for the CCD the source was detected/measured on (pointer to Science_Ccd_Exposure).",
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 788, tableId = 31, name = "filterId",
		type = "TINYINT",
		notNull = 1,
		description = "Pointer to Filter table; 0='u', 1='g', 2='r', 3='i', 4='z', 5='y'.",
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 789, tableId = 31, name = "objectId",
		type = "BIGINT",
		notNull = 0,
		description = "The object this source was assigned to. NULL if the PT1.1 clustering algorithm generated a single-source object for this source.",
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 790, tableId = 31, name = "movingObjectId",
		type = "BIGINT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 791, tableId = 31, name = "procHistoryId",
		type = "INTEGER",
		notNull = 1,
		description = "Not set for PT1.1.",
		displayOrder = 6;

	INSERT INTO md_Column
	SET columnId = 792, tableId = 31, name = "ra",
		type = "DOUBLE",
		notNull = 1,
		description = "RA of source centroid (equal to raAstrom).",
		unit = "deg",
		displayOrder = 7;

	INSERT INTO md_Column
	SET columnId = 793, tableId = 31, name = "raErrForDetection",
		type = "FLOAT",
		notNull = 0,
		description = "Component of ra uncertainty due to detection uncertainty (xAstromErr, yAstromErr).",
		unit = "deg",
		displayOrder = 8;

	INSERT INTO md_Column
	SET columnId = 794, tableId = 31, name = "raErrForWcs",
		type = "FLOAT",
		notNull = 1,
		description = "Not set for PT1.1. Component of ra uncertainty due to uncertainty in WCS solution.",
		unit = "deg",
		displayOrder = 9;

	INSERT INTO md_Column
	SET columnId = 795, tableId = 31, name = "decl",
		type = "DOUBLE",
		notNull = 1,
		description = "Declination of source centroid (equal to declAstrom).",
		unit = "deg",
		displayOrder = 10;

	INSERT INTO md_Column
	SET columnId = 796, tableId = 31, name = "declErrForDetection",
		type = "FLOAT",
		notNull = 0,
		description = "Component of decl uncertainty due to detection uncertainty (xAstromErr, yAstromErr).",
		unit = "deg",
		displayOrder = 11;

	INSERT INTO md_Column
	SET columnId = 797, tableId = 31, name = "declErrForWcs",
		type = "FLOAT",
		notNull = 1,
		description = "Not set for PT1.1. Component of decl uncertainty due to uncertainty in WCS solution.",
		unit = "deg",
		displayOrder = 12;

	INSERT INTO md_Column
	SET columnId = 798, tableId = 31, name = "xFlux",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1.",
		unit = "pix",
		displayOrder = 13;

	INSERT INTO md_Column
	SET columnId = 799, tableId = 31, name = "xFluxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1. Uncertainty of xFlux.",
		unit = "pix",
		displayOrder = 14;

	INSERT INTO md_Column
	SET columnId = 800, tableId = 31, name = "yFlux",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1.",
		unit = "pix",
		displayOrder = 15;

	INSERT INTO md_Column
	SET columnId = 801, tableId = 31, name = "yFluxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1. Uncertainty of yFlux.",
		unit = "pix",
		displayOrder = 16;

	INSERT INTO md_Column
	SET columnId = 802, tableId = 31, name = "raFlux",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1. RA of (xFlux, yFlux).",
		unit = "deg",
		displayOrder = 17;

	INSERT INTO md_Column
	SET columnId = 803, tableId = 31, name = "raFluxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1. Uncertainty of raFlux.",
		unit = "deg",
		displayOrder = 18;

	INSERT INTO md_Column
	SET columnId = 804, tableId = 31, name = "declFlux",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1. Dec of (xFlux, yFlux).",
		unit = "deg",
		displayOrder = 19;

	INSERT INTO md_Column
	SET columnId = 805, tableId = 31, name = "declFluxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1. Uncertainty of declFlux.",
		unit = "deg",
		displayOrder = 20;

	INSERT INTO md_Column
	SET columnId = 806, tableId = 31, name = "xPeak",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1.",
		unit = "pix",
		displayOrder = 21;

	INSERT INTO md_Column
	SET columnId = 807, tableId = 31, name = "yPeak",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1.",
		unit = "pix",
		displayOrder = 22;

	INSERT INTO md_Column
	SET columnId = 808, tableId = 31, name = "raPeak",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1. RA of (xPeak, yPeak).",
		unit = "deg",
		displayOrder = 23;

	INSERT INTO md_Column
	SET columnId = 809, tableId = 31, name = "declPeak",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1. Dec of (xPeak, yPeak).",
		unit = "deg",
		displayOrder = 24;

	INSERT INTO md_Column
	SET columnId = 810, tableId = 31, name = "xAstrom",
		type = "DOUBLE",
		notNull = 0,
		description = "Position (x) measured for purposes of astrometry.",
		unit = "pix",
		displayOrder = 25;

	INSERT INTO md_Column
	SET columnId = 811, tableId = 31, name = "xAstromErr",
		type = "FLOAT",
		notNull = 0,
		description = "Uncertainty of xAstrom.",
		unit = "pix",
		displayOrder = 26;

	INSERT INTO md_Column
	SET columnId = 812, tableId = 31, name = "yAstrom",
		type = "DOUBLE",
		notNull = 0,
		description = "Position (y) measured for purposes of astrometry.",
		unit = "pix",
		displayOrder = 27;

	INSERT INTO md_Column
	SET columnId = 813, tableId = 31, name = "yAstromErr",
		type = "FLOAT",
		notNull = 0,
		description = "Uncertainty of yAstrom.",
		unit = "pix",
		displayOrder = 28;

	INSERT INTO md_Column
	SET columnId = 814, tableId = 31, name = "raAstrom",
		type = "DOUBLE",
		notNull = 0,
		description = "RA of (xAstrom, yAstrom).",
		unit = "deg",
		displayOrder = 29;

	INSERT INTO md_Column
	SET columnId = 815, tableId = 31, name = "raAstromErr",
		type = "FLOAT",
		notNull = 0,
		description = "Uncertainty of raAstrom.",
		unit = "deg",
		displayOrder = 30;

	INSERT INTO md_Column
	SET columnId = 816, tableId = 31, name = "declAstrom",
		type = "DOUBLE",
		notNull = 0,
		description = "Dec of (xAstrom, yAstrom).",
		unit = "deg",
		displayOrder = 31;

	INSERT INTO md_Column
	SET columnId = 817, tableId = 31, name = "declAstromErr",
		type = "FLOAT",
		notNull = 0,
		description = "Uncertainty of declAstrom.",
		unit = "deg",
		displayOrder = 32;

	INSERT INTO md_Column
	SET columnId = 818, tableId = 31, name = "raObject",
		type = "DOUBLE",
		notNull = 0,
		description = "ra_PS of object associated with this source, or ra if the source was not associated with any object (objectId is NULL).",
		unit = "deg",
		displayOrder = 33;

	INSERT INTO md_Column
	SET columnId = 819, tableId = 31, name = "declObject",
		type = "DOUBLE",
		notNull = 0,
		description = "decl_PS of object associated with this source, or decl if the source was not associated with any object (objectId is NULL).",
		unit = "deg",
		displayOrder = 34;

	INSERT INTO md_Column
	SET columnId = 820, tableId = 31, name = "taiMidPoint",
		type = "DOUBLE",
		notNull = 1,
		description = "Middle of exposure time (TAI).",
		unit = "mjd",
		displayOrder = 35;

	INSERT INTO md_Column
	SET columnId = 821, tableId = 31, name = "taiRange",
		type = "FLOAT",
		notNull = 0,
		description = "Exposure time.",
		unit = "s",
		displayOrder = 36;

	INSERT INTO md_Column
	SET columnId = 822, tableId = 31, name = "psfFlux",
		type = "DOUBLE",
		notNull = 1,
		description = "Uncalibrated PSF flux of source.",
		unit = "DN",
		displayOrder = 37;

	INSERT INTO md_Column
	SET columnId = 823, tableId = 31, name = "psfFluxErr",
		type = "FLOAT",
		notNull = 1,
		description = "Uncertainty of psfFlux.",
		unit = "DN",
		displayOrder = 38;

	INSERT INTO md_Column
	SET columnId = 824, tableId = 31, name = "apFlux",
		type = "DOUBLE",
		notNull = 1,
		description = "Uncalibrated aperture flux of source.",
		unit = "DN",
		displayOrder = 39;

	INSERT INTO md_Column
	SET columnId = 825, tableId = 31, name = "apFluxErr",
		type = "FLOAT",
		notNull = 1,
		description = "Uncertainty of apFlux.",
		unit = "DN",
		displayOrder = 40;

	INSERT INTO md_Column
	SET columnId = 826, tableId = 31, name = "modelFlux",
		type = "DOUBLE",
		notNull = 1,
		description = "Not set for PT1.1.",
		displayOrder = 41;

	INSERT INTO md_Column
	SET columnId = 827, tableId = 31, name = "modelFluxErr",
		type = "FLOAT",
		notNull = 1,
		description = "Not set for PT1.1.",
		displayOrder = 42;

	INSERT INTO md_Column
	SET columnId = 828, tableId = 31, name = "petroFlux",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 43;

	INSERT INTO md_Column
	SET columnId = 829, tableId = 31, name = "petroFluxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 44;

	INSERT INTO md_Column
	SET columnId = 830, tableId = 31, name = "instFlux",
		type = "DOUBLE",
		notNull = 1,
		description = "Not set for PT1.1.",
		displayOrder = 45;

	INSERT INTO md_Column
	SET columnId = 831, tableId = 31, name = "instFluxErr",
		type = "FLOAT",
		notNull = 1,
		description = "Not set for PT1.1.",
		displayOrder = 46;

	INSERT INTO md_Column
	SET columnId = 832, tableId = 31, name = "nonGrayCorrFlux",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 47;

	INSERT INTO md_Column
	SET columnId = 833, tableId = 31, name = "nonGrayCorrFluxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 48;

	INSERT INTO md_Column
	SET columnId = 834, tableId = 31, name = "atmCorrFlux",
		type = "DOUBLE",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 49;

	INSERT INTO md_Column
	SET columnId = 835, tableId = 31, name = "atmCorrFluxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 50;

	INSERT INTO md_Column
	SET columnId = 836, tableId = 31, name = "apDia",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1",
		displayOrder = 51;

	INSERT INTO md_Column
	SET columnId = 837, tableId = 31, name = "Ixx",
		type = "FLOAT",
		notNull = 0,
		description = "Adaptive second moment.",
		displayOrder = 52;

	INSERT INTO md_Column
	SET columnId = 838, tableId = 31, name = "IxxErr",
		type = "FLOAT",
		notNull = 0,
		description = "Uncertainty of Ixx.",
		displayOrder = 53;

	INSERT INTO md_Column
	SET columnId = 839, tableId = 31, name = "Iyy",
		type = "FLOAT",
		notNull = 0,
		description = "Adaptive second moment.",
		displayOrder = 54;

	INSERT INTO md_Column
	SET columnId = 840, tableId = 31, name = "IyyErr",
		type = "FLOAT",
		notNull = 0,
		description = "Uncertainty of Iyy.",
		displayOrder = 55;

	INSERT INTO md_Column
	SET columnId = 841, tableId = 31, name = "Ixy",
		type = "FLOAT",
		notNull = 0,
		description = "Adaptive second moment.",
		displayOrder = 56;

	INSERT INTO md_Column
	SET columnId = 842, tableId = 31, name = "IxyErr",
		type = "FLOAT",
		notNull = 0,
		description = "Uncertainty of Ixy.",
		displayOrder = 57;

	INSERT INTO md_Column
	SET columnId = 843, tableId = 31, name = "snr",
		type = "FLOAT",
		notNull = 1,
		description = "Not set for PT1.1.",
		displayOrder = 58;

	INSERT INTO md_Column
	SET columnId = 844, tableId = 31, name = "chi2",
		type = "FLOAT",
		notNull = 1,
		displayOrder = 59;

	INSERT INTO md_Column
	SET columnId = 845, tableId = 31, name = "sky",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 60;

	INSERT INTO md_Column
	SET columnId = 846, tableId = 31, name = "skyErr",
		type = "FLOAT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 61;

	INSERT INTO md_Column
	SET columnId = 847, tableId = 31, name = "extendedness",
		description = "Not set for PT1.1. Probability that this source is an extended source. Valid range: 0-1, where 1 indicates an extended source with 100% probability.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 62;

	INSERT INTO md_Column
	SET columnId = 848, tableId = 31, name = "flux_PS",
		description = "Not set for PT1.1. Calibrated flux for Point Source model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 63;

	INSERT INTO md_Column
	SET columnId = 849, tableId = 31, name = "flux_PS_Sigma",
		description = "Not set for PT1.1. Uncertainty of flux_PS.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 64;

	INSERT INTO md_Column
	SET columnId = 850, tableId = 31, name = "flux_SG",
		description = "Not set for PT1.1. Calibrated flux for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 65;

	INSERT INTO md_Column
	SET columnId = 851, tableId = 31, name = "flux_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of flux_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 66;

	INSERT INTO md_Column
	SET columnId = 852, tableId = 31, name = "sersicN_SG",
		description = "Not set for PT1.1. Sersic index for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 67;

	INSERT INTO md_Column
	SET columnId = 853, tableId = 31, name = "sersicN_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of sersicN_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 68;

	INSERT INTO md_Column
	SET columnId = 854, tableId = 31, name = "e1_SG",
		description = "Not set for PT1.1. Ellipticity for Small Galaxy.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 69;

	INSERT INTO md_Column
	SET columnId = 855, tableId = 31, name = "e1_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of e1_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 70;

	INSERT INTO md_Column
	SET columnId = 856, tableId = 31, name = "e2_SG",
		description = "Not set for PT1.1. Uncertainty of e2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 71;

	INSERT INTO md_Column
	SET columnId = 857, tableId = 31, name = "e2_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of e2_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 72;

	INSERT INTO md_Column
	SET columnId = 858, tableId = 31, name = "radius_SG",
		description = "Not set for PT1.1. Size of Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 73;

	INSERT INTO md_Column
	SET columnId = 859, tableId = 31, name = "radius_SG_Sigma",
		description = "Not set for PT1.1. Uncertainty of radius_SG.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 74;

	INSERT INTO md_Column
	SET columnId = 860, tableId = 31, name = "flux_flux_SG_Cov",
		description = "Not set for PT1.1. Covariance of flux and flux for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 75;

	INSERT INTO md_Column
	SET columnId = 861, tableId = 31, name = "flux_e1_SG_Cov",
		description = "Not set for PT1.1. Covariance of flux and e1 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 76;

	INSERT INTO md_Column
	SET columnId = 862, tableId = 31, name = "flux_e2_SG_Cov",
		description = "Not set for PT1.1. Covariance of flux and e2 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 77;

	INSERT INTO md_Column
	SET columnId = 863, tableId = 31, name = "flux_radius_SG_Cov",
		description = "Not set for PT1.1. Covariance of flux and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 78;

	INSERT INTO md_Column
	SET columnId = 864, tableId = 31, name = "flux_sersicN_SG_Cov",
		description = "Not set for PT1.1. Covariance of flux and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 79;

	INSERT INTO md_Column
	SET columnId = 865, tableId = 31, name = "e1_e1_SG_Cov",
		description = "Not set for PT1.1. Covariance of e1 and e1 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 80;

	INSERT INTO md_Column
	SET columnId = 866, tableId = 31, name = "e1_e2_SG_Cov",
		description = "Not set for PT1.1. Covariance of e1 and e2 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 81;

	INSERT INTO md_Column
	SET columnId = 867, tableId = 31, name = "e1_radius_SG_Cov",
		description = "Not set for PT1.1. Covariance of e1 and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 82;

	INSERT INTO md_Column
	SET columnId = 868, tableId = 31, name = "e1_sersicN_SG_Cov",
		description = "Not set for PT1.1. Covariance of e1 and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 83;

	INSERT INTO md_Column
	SET columnId = 869, tableId = 31, name = "e2_e2_SG_Cov",
		description = "Not set for PT1.1. Covariance of e2 and e2 for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 84;

	INSERT INTO md_Column
	SET columnId = 870, tableId = 31, name = "e2_radius_SG_Cov",
		description = "Not set for PT1.1. Covariance of e2 and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 85;

	INSERT INTO md_Column
	SET columnId = 871, tableId = 31, name = "e2_sersicN_SG_Cov",
		description = "Not set for PT1.1. Covariance of e2 and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 86;

	INSERT INTO md_Column
	SET columnId = 872, tableId = 31, name = "radius_radius_SG_Cov",
		description = "Not set for PT1.1. Covariance of radius and radius for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 87;

	INSERT INTO md_Column
	SET columnId = 873, tableId = 31, name = "radius_sersicN_SG_Cov",
		description = "Not set for PT1.1. Covariance of radius and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 88;

	INSERT INTO md_Column
	SET columnId = 874, tableId = 31, name = "sersicN_sersicN_SG_Cov",
		description = "Not set for PT1.1. Covariance for sersicN and sersicN for Small Galaxy model.",
		type = "FLOAT",
		notNull = 0,
		displayOrder = 89;

	INSERT INTO md_Column
	SET columnId = 875, tableId = 31, name = "flagForAssociation",
		type = "SMALLINT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 90;

	INSERT INTO md_Column
	SET columnId = 876, tableId = 31, name = "flagForDetection",
		type = "SMALLINT",
		notNull = 0,
		description = "Bitwise-or of detection flags.<ul><li>0x0001 EDGE: source is in region labelled EDGE.<li>0x0002 SHAPE_SHIFT: centroid shifted while estimating adaptive moments.<li>0x0004 SHAPE_MAXITER: too many iterations for adaptive moments.<li>0x0008 SHAPE_UNWEIGHTED: &quot;adaptive&quot; moments are unweighted.<li>0x0010 SHAPE_UNWEIGHTED_PSF: the PSF's &quot;adaptive&quot; moments are unweighted.<li>0x0020 SHAPE_UNWEIGHTED_BAD: even the unweighted moments were bad.<li>0x0040 PEAKCENTER: given centre is position of peak pixel.<li>0x0080 BINNED1: source was found in 1x1 binned image.<li>0x0100 INTERP: source's footprint includes interpolated pixels.<li>0x0200 INTERP_CENTER: source's centre is close to interpolated pixels.<li>0x0400 SATUR: source's footprint includes saturated pixels.<li>0x0800 SATUR_CENTER: source's centre is close to saturated pixels.<li>0x1000 DETECT_NEGATIVE: source was detected as being significantly negative.<li>0x2000 STAR: source is thought to be point-like.</ul>",
		displayOrder = 91;

	INSERT INTO md_Column
	SET columnId = 877, tableId = 31, name = "flagForWcs",
		type = "SMALLINT",
		notNull = 0,
		description = "Not set for PT1.1.",
		displayOrder = 92;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 33, name = "Visit",
	engine = "MyISAM",
	description = "Defines a single Visit. 1 row per LSST visit.";

	INSERT INTO md_Column
	SET columnId = 938, tableId = 33, name = "visitId",
		description = "Unique identifier.",
		type = "INTEGER",
		notNull = 1,
		displayOrder = 1;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 71, name = "sdqa_ImageStatus",
	engine = "MyISAM",
	description = "Unique set of status names and their definitions, e.g. &quot;passed&quot;, &quot;failed&quot;, etc.";

	INSERT INTO md_Column
	SET columnId = 1113, tableId = 71, name = "sdqa_imageStatusId",
		description = "Primary key.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1114, tableId = 71, name = "statusName",
		description = "One-word, camel-case, descriptive name of a possible image status (e.g., passedAuto, marginallyPassedManual, etc.)",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1115, tableId = 71, name = "definition",
		description = "Detailed Definition of the image status.",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 3;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 72, name = "sdqa_Metric",
	engine = "MyISAM",
	description = "Unique set of metric names and associated metadata (e.g., &quot;nDeadPix&quot;, &quot;median&quot;, etc.). There will be approximately 30 records total in this table.";

	INSERT INTO md_Column
	SET columnId = 1116, tableId = 72, name = "sdqa_metricId",
		description = "Primary key.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1117, tableId = 72, name = "metricName",
		description = "One-word, camel-case, descriptive name of a possible metric (e.g., mSatPix, median, etc).",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1118, tableId = 72, name = "physicalUnits",
		description = "Physical units of metric.",
		type = "VARCHAR(30)",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1119, tableId = 72, name = "dataType",
		description = "Flag indicating whether data type of the metric value is integer (0) or float (1)",
		type = "CHAR(1)",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1120, tableId = 72, name = "definition",
		type = "VARCHAR(255)",
		notNull = 1,
		displayOrder = 5;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 73, name = "sdqa_Rating_ForScienceAmpExposure",
	engine = "MyISAM",
	description = "Various SDQA ratings for a given amplifier image. There will approximately 30 of these records per image record.";

	INSERT INTO md_Column
	SET columnId = 1121, tableId = 73, name = "sdqa_ratingId",
		description = "Primary key. Auto-increment is used, we define a composite unique key, so potential duplicates will be captured.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1122, tableId = 73, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1123, tableId = 73, name = "sdqa_thresholdId",
		description = "Pointer to sdqa_Threshold.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1124, tableId = 73, name = "ampExposureId",
		description = "Pointer to Science_Amp_Exposure.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1125, tableId = 73, name = "metricValue",
		description = "Value of this SDQA metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1126, tableId = 73, name = "metricSigma",
		description = "Uncertainty of the value of this metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 74, name = "sdqa_Rating_ForScienceCcdExposure",
	engine = "MyISAM",
	description = "Various SDQA ratings for a given ScienceCcdExposure.";

	INSERT INTO md_Column
	SET columnId = 1127, tableId = 74, name = "sdqa_ratingId",
		description = "Primary key. Auto-increment is used, we define a composite unique key, so potential duplicates will be captured.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1128, tableId = 74, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1129, tableId = 74, name = "sdqa_thresholdId",
		description = "Pointer to sdqa_Threshold.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1130, tableId = 74, name = "ccdExposureId",
		description = "Pointer to Science_Ccd_Exposure.",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1131, tableId = 74, name = "metricValue",
		description = "Value of this SDQA metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1132, tableId = 74, name = "metricSigma",
		description = "Uncertainty of the value of this metric.",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 75, name = "sdqa_Rating_ForSnapCcdExposure",
	engine = "MyISAM";

	INSERT INTO md_Column
	SET columnId = 1133, tableId = 75, name = "sdqa_ratingId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1134, tableId = 75, name = "sdqa_metricId",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1135, tableId = 75, name = "sdqa_thresholdId",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1136, tableId = 75, name = "ccdExposureId",
		type = "BIGINT",
		notNull = 1,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1137, tableId = 75, name = "metricValue",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 5;

	INSERT INTO md_Column
	SET columnId = 1138, tableId = 75, name = "metricSigma",
		type = "DOUBLE",
		notNull = 1,
		displayOrder = 6;

-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --

INSERT INTO md_Table
SET tableId = 76, name = "sdqa_Threshold",
	engine = "MyISAM",
	description = "Version-controlled metric thresholds. Total number of these records is approximately equal to 30 x the number of times the thresholds will be changed over the entire period of LSST operations (of ordre of 100), with most of the changes occuring in the first year of operations.";

	INSERT INTO md_Column
	SET columnId = 1139, tableId = 76, name = "sdqa_thresholdId",
		description = "Primary key.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 1;

	INSERT INTO md_Column
	SET columnId = 1140, tableId = 76, name = "sdqa_metricId",
		description = "Pointer to sdqa_Metric table.",
		type = "SMALLINT",
		notNull = 1,
		displayOrder = 2;

	INSERT INTO md_Column
	SET columnId = 1141, tableId = 76, name = "upperThreshold",
		description = "Threshold for which a metric value is tested to be greater than.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 3;

	INSERT INTO md_Column
	SET columnId = 1142, tableId = 76, name = "lowerThreshold",
		description = "Threshold for which a metric value is tested to be less than.",
		type = "DOUBLE",
		notNull = 0,
		displayOrder = 4;

	INSERT INTO md_Column
	SET columnId = 1143, tableId = 76, name = "createdDate",
		description = "Database timestamp when the record is inserted.",
		type = "TIMESTAMP",
		notNull = 1,
		defaultValue = "CURRENT_TIMESTAMP",
		displayOrder = 5;

